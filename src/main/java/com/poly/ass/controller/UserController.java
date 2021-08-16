package com.poly.ass.controller;

import java.io.IOException;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;
import java.util.Optional;

import javax.servlet.annotation.MultipartConfig;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.security.core.Authentication;
import org.springframework.security.oauth2.client.authentication.OAuth2AuthenticationToken;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.validation.Errors;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.poly.ass.dao.UserDAO;
import com.poly.ass.entity.MailInfo;
import com.poly.ass.entity.Product;
import com.poly.ass.entity.User;
import com.poly.ass.service.*;

@Controller
public class UserController {
	@Autowired
	ParamService paramService;
	@Autowired
	SessionService sessionService;
	@Autowired
	CookieService cookieService;
	@Autowired
	UserDAO userDao;
	@Autowired
	ImageService imgService;
	@Autowired
	MailerServiceImpl mailService;
    @Autowired
	UserService userService;

	@RequestMapping("/home/login/oauth2")
	public String loginOauth2(OAuth2AuthenticationToken oauth2){
        userService.LoginFormOAuth2(oauth2);
		return "redirect:/home";
	}

	@GetMapping("/account/login")
	public String login(@RequestParam("error") Optional<String> error, Model model) {
		String username = cookieService.getValue("user");
		System.out.println("value: " + username);
		if (username != null) {
			sessionService.set("username", username);
			return "redirect:/home";
		}
		model.addAttribute("error", error.orElse(""));
		return "user/login";
	}

	@PostMapping("/account/login")
	public String login(@RequestParam("username") String un, @RequestParam("password") String pw,
			@RequestParam("remember") Optional<Boolean> rm, Model model) {
		try {
			User user = userDao.getById(un);
			if (!user.isActived()) {
				throw new Exception();
			}
			if (!user.getPassword().equals(pw)) {
				model.addAttribute("message", "Invalid password");
			} else {
				String uri = sessionService.get("security-uri");
				System.out.println(uri);

				sessionService.set("username", un);
				if (rm.orElse(false)) {
					cookieService.add("user", un, 10);
					System.out.println(rm.orElse(false));
				} else {
					cookieService.remove("user");
				}
				model.addAttribute("message", "Login successfully");
				if (uri != null) {
					return "redirect:" + uri;
				}
				return "redirect:/home";
			}
		} catch (Exception e) {
			model.addAttribute("message", "Invalid username");
		}
		return "user/login";
	}

	@GetMapping("/account/logout")
	public String logout() {
		User u = sessionService.get("remember");
		sessionService.remove("username");
		sessionService.remove("security-uri");
		cookieService.remove("user");
		return "redirect:/home";
	}

	@GetMapping("/home/profile")
	public String profile(@RequestParam("message") Optional<Boolean> message,Authentication auth, Model model) {
		String username = auth.getName();
		User user = userDao.getById(username);
		model.addAttribute("user", user);
		if (message.orElse(false)) {
			model.addAttribute("message", "<b style='color:green'>Cập nhật thành công </b>");
		}
		model.addAttribute("show", true);
		return "user/profile";
	}

	@PostMapping("/account/update-profile")
	public String updateProfile(Model model,@Valid @ModelAttribute("user") User user, Errors rs,
			@RequestParam("image") MultipartFile multipartFile ) throws IllegalStateException, IOException {
		if (userDao.existsById(user.getId())) {
			// get user in table user;
			User userGet = userDao.getById(user.getId());
			user.setPassword(userGet.getPassword());
			if (multipartFile.isEmpty()) {
				user.setPhoto(userGet.getPhoto());
				System.out.print("Check 1");
			} else {
				user.setPhoto(imgService.saveImage(multipartFile, model));
				System.out.print("Check 2");
			}
			if (rs.hasErrors()) {
				model.addAttribute("message", "<b style='color:red'>Cập nhật thất bại </b> ");
				rs.getAllErrors().stream().forEach(i->System.out.println(i));
				return "user/profile";
			}
			userDao.save(user);
			System.out.print("Check 3");
		}

		return "redirect:/home/profile?message=true";

	}

	@GetMapping("/account/profile/cancel")
	public String cancelUpdate() {
		return "redirect:/home/profile";
	}

	@GetMapping("/home/retrivepassword")
	public String retrive(@ModelAttribute("user") User user) {
		return "user/retrive-password";
	}

	@PostMapping("/home/retrivepassword")
	public String retrivePassword(@ModelAttribute("user") User user, Model model) {
		try {
			User user1 = userDao.getById(user.getId());
			if (user1.getEmail().equals(user.getEmail())) {
				String body = "Dear, " + user1.getName() + "<br/>"
						+ "Hệ thống khôi phục mật khẩu của <b>Audio Market</b>" + "<br>" + "Tài khoản của bạn là: <br/>"
						+ "Username: " + user.getId() + "<br/>Password: " + user1.getPassword()
						+ "<br/> Hãy luôn luôn giữ tài khoản của bạn cẩn thận";
				mailService.queue(new MailInfo(user.getEmail(), "Audio-Market Lấy lại mật khẩu", body));
				model.addAttribute("message", "Mật khẩu đã được gửi về tài khoản gmail của bạn");
				user.setId("");
				user.setEmail("");
			} else {
				model.addAttribute("message", "Thông tin sai");
			}
		} catch (Exception e) {
			model.addAttribute("message", "Tài Khoản không tồn tại");
		}
		return "user/retrive-password";
	}

	@GetMapping("/account/change-password")
	public String changePassword() {
		return "next";
	}

	@ModelAttribute("genderselect")
	public Map<Boolean, String> getGender() {
		Map<Boolean, String> map = new HashMap<>();
		map.put(true, "Nam");
		map.put(false, "Nữ");
		return map;
	}

	@GetMapping("/home/register")
	public String registerPage(@ModelAttribute("user") User user) {
		user.setActived(true);
		user.setAdmin("USER");
		return "user/register";
	}

	@PostMapping("/account/register")
	public String register( Model model,@Valid @ModelAttribute("user") User user, Errors rs,
			@RequestParam("confirmpass") String confirmPass) {
		if (!rs.hasErrors()) {
			if (confirmPass.length() < 6) {
				model.addAttribute("eVal", "Xác nhận mật khẩu ít nhất 6 ký tự");
				return "user/register";
			}
			if (user.getPassword().equals(confirmPass)) {
				if (!userDao.existsById(user.getId())) {
					user.setPhoto("default.png");
					user.setAdmin("USER");
					user.setActived(true);
					userDao.save(user);
					String body = "Dear, " + user.getName() + "<br/>"
							+ "Chào mừng bạn bạn đã trở thành thành viên của <b>Audio Market</b>" + "<br>"
							+ "Tài khoản của bạn là: <br/>" + "Username: " + user.getId() + "<br/>Password: "
							+ user.getPassword();
					mailService.queue(new MailInfo(user.getEmail(), "Thư Chào Mừng", body));
					model.addAttribute("message",
							"<p>Tạo Tài khoản <b class='text-success'>thành công</b> <a href='/account/login'>Go to login page</a><p>");
					//
					user.setName("");
					user.setId("");
					user.setEmail("");
					user.setBirthDay(new Date());
					user.setPhone("");
					user.setAddress("");
				} else {

					model.addAttribute("message",
							" <b class='text-danger'>Thất bại</b> tài khoản này đã tồn tại <a href='/account/login'>Go to login page</a>");
				}

			} else {
				model.addAttribute("message", " <b class='text-danger'>Thất bại</b> Xác nhận mật khẩu không khớp");
			}

		}
		rs.getAllErrors().forEach(i->System.out.println(i));
		user.setPassword("");
		return "user/register";
	}

	@PostMapping("/account/change-password")
	public String changePassword(@RequestParam("olderpassword") String olderPassword,
			@RequestParam("username") String username, @RequestParam("newpassword") String newPassword,
			@RequestParam("confirmpassword") String confirmPassword, Model model) {
		User user = userDao.getById(username);
		model.addAttribute("user", user);
		// check form
		boolean error = false;
		if (olderPassword == "") {
			model.addAttribute("error1", "Không được để trống mật khẩu cũ");
			error = true;
		}
		if (newPassword == "") {
			model.addAttribute("error2", "Không được để trống mật khẩu mới");
			error = true;
		}
		if (confirmPassword == "") {
			model.addAttribute("error3", "Không được để trống xác nhận mật khẩu");
			error = true;
		}
		// end check form
		try {
			if (!error) {
				if (olderPassword.equals(user.getPassword())) {
					if (newPassword.equals(confirmPassword)) {
						user.setPassword(confirmPassword);
						model.addAttribute("user", user);
						userDao.save(user);
						model.addAttribute("message", "Đổi mật khẩu <b style='color:green'>thành công</b>");

					} else {
						model.addAttribute("message", "<b>Thất bại </b>Xác nhận mật khẩu không khớp");
					}
				} else {
					model.addAttribute("message", "<b>Thất bại </b> Mật khẩu cũ không đúng");
				}
			}
		} catch (Exception e) {
			model.addAttribute("message", "Đổi mật khẩu <b>Thất bại </b>");
		}
		model.addAttribute("show", false);
		return "user/profile";
	}

	@RequestMapping("/admin/edit-user")
	public String editUser(@ModelAttribute("user") User user) {
		user.setAdmin("ADMIN");
		user.setGender(true);
		user.setActived(true);
		return "page-admin/edit-users";
	}

	@RequestMapping("/admin/user/reset")
	public String reset(@ModelAttribute("user") User user)  {
		user.setPhoto("default.png");
		return "redirect:/admin/edit-user";
	}

	@RequestMapping("/admin/list-user-pagination")
	public String getListUsers(@RequestParam("search-name") Optional<String> kw,
			@RequestParam("pageNo") Optional<Integer> pageNo, Model model) {
		String keyworks = kw.orElse(sessionService.get("keywords") == null ? "" : sessionService.get("keywords"));
		sessionService.set("keywords", keyworks);
		Pageable pageable = PageRequest.of(pageNo.orElse(0), 10);
		Page<User> page = userDao.findAllByNameLike("%" + keyworks + "%", pageable);
		model.addAttribute("names", keyworks);
		model.addAttribute("page", page);
		return "page-admin/list-users";
	}

	// Create
	@PostMapping("/admin/user/create")
	public String createUser(@Valid @ModelAttribute("user") User user, BindingResult rs,
			@RequestParam("img") MultipartFile multipartFile, Model model) throws IllegalStateException, IOException {
		if (!rs.hasErrors()) {
			if (!userDao.existsById(user.getId())) {
				String img = imgService.saveImage(multipartFile, model);
				user.setPhoto(img);
				model.addAttribute("img", img);
				userDao.save(user);
				model.addAttribute("message", "<div><b class='text-success'>Thành công !</b> Tài khoản " + user.getId()
						+ " Đã được tạo</div>");
			} else {
				model.addAttribute("message",
						"<div><b class='text-danger'>Thất bại !<b> Tài khoản " + user.getId() + " đã tồn tại</div>");
			}
		}
		if(user.getPhoto() == null || user.getPhoto().length() == 0 || user.getPhoto() ==" "){
			user.setPhoto("default.png");
		}
		return "page-admin/edit-users";
	}

	//
	@PostMapping("/admin/user/update")
	public String updateUser(@Valid @ModelAttribute("user") User user, BindingResult rs,
			@RequestParam("img") MultipartFile multipartFile, Model model) throws IllegalStateException, IOException {
		if (!rs.hasErrors()) {
			if (userDao.existsById(user.getId())) {
				String img;
				if (multipartFile.isEmpty()) {

					img = user.getPhoto();
				} else {
					img = imgService.saveImage(multipartFile, model);
				}
				user.setPhoto(img);
				model.addAttribute("img", img);
				userDao.save(user);
				model.addAttribute("message", "<div><b class='text-success'>Thành công !</b> Tài khoản " + user.getId()
						+ " Đã được cập nhật</div>");
			} else {
				model.addAttribute("message", "<div><b class='text-danger'>Thất bại !</b> Tài khoản " + user.getId()
						+ " Không tồn tại</div>");
			}
		}
		if(user.getPhoto() == null || user.getPhoto().length() == 0 || user.getPhoto() ==" "){
			user.setPhoto("default.png");
		}
		return "page-admin/edit-users";
	}

	@RequestMapping("/admin/user/delete")
	public String deleteUser(@RequestParam("id") Optional<String> id, Model model) {
		try {
			String idReal = id.orElse("").substring(1, id.orElse("").length());
			User user = userDao.getById(idReal);
			System.out.println(idReal);
			userDao.delete(user);
			if (id.orElse("").contains("d")) {
				return "redirect:/admin/list-user-pagination";
			}
		} catch (Exception e) {
			// TODO: handle exception
		}
		return "redirect:/admin/edit-user";
	}

	//
	@RequestMapping("/admin/edit")
	public ModelAndView getUserForEdit(@RequestParam("id") Optional<String> id, ModelAndView modelview) {
		Map<String, Object> map = new HashMap<>();
		try {
			User user = userDao.getById(id.orElse(""));
			map.put("user", user);
		} catch (Exception e) {
			map.put("message", "Không tìm thấy user");
		}
		return new ModelAndView("page-admin/edit-users", map);
	}

}
