package com.poly.ass.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Optional;

import javax.servlet.annotation.MultipartConfig;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.validation.Errors;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.poly.ass.dao.CategoryDAO;
import com.poly.ass.dao.DiscountDAO;
import com.poly.ass.dao.ProductDAO;
import com.poly.ass.entity.Category;
import com.poly.ass.entity.Product;
import com.poly.ass.entity.User;
import com.poly.ass.service.ImageService;
import com.poly.ass.service.SessionService;
import com.poly.ass.ultils.ConvertUltil;

@Controller
public class ProductController {
	@Autowired
	ProductDAO productDao;
	@Autowired
	CategoryDAO categoryDao;
	@Autowired
	ImageService imgUltil;
	@Autowired
	SessionService session;

	@GetMapping("/admin/editproduct")
	public String editProduct(@ModelAttribute("product") Product p, Model model) {
		model.addAttribute("img", "default.png");
		return "page-admin/edit-product";
	}

	@PostMapping("/admin/editproduct/add")
	public String add(Model model ,@Valid @ModelAttribute("product") Product p, Errors rs,
			@RequestParam("img") MultipartFile multipartfile) throws IllegalStateException, IOException {
		if (!rs.hasErrors()) {
			if (!productDao.existsById(p.getId())) {
				String dir = imgUltil.saveImage(multipartfile, model);
				p.setImage(dir);
				productDao.save(p);
				model.addAttribute("message",
						"<div class='text-success font-weight-bold'>Tạo sản phẩm " + p.getId() + " thành công</div>");
			} else {
				model.addAttribute("message",
						"<div class='text-danger font-weight-bold'>Sản phẩm " + p.getId() + " đã tồn tại</div>");
			}
			model.addAttribute("img", p.getImage());
		}
		model.addAttribute("img","default.png");
		return "page-admin/edit-product";
	}

	@ModelAttribute("categories")
	public Map<String, String> listCategory() {
		Map<String, String> map = new HashMap<>();
		map.put("", "-----Chọn loại hàng-------");
		for (Category category : categoryDao.findAll()) {
			map.put(category.getId(), category.getNamecategory());
		}
		return map;
	}

	@GetMapping("/admin/editproduct/edit")
	public String edit(@RequestParam("id") String id, Model model) {
		Product product = productDao.getById(id);
		model.addAttribute("img", product.getImage());
		model.addAttribute("product", product);
		model.addAttribute("readonly", true);
		return "page-admin/edit-product";
	}

	@GetMapping("/admin/editproduct/delete/{id1}")
	public String deleteAProduct(@Valid @ModelAttribute("product") Product p, BindingResult rs,
			@PathVariable("id1") String id, Model model) {
		String idRead = id;
		if (id.contains("d")) {
			idRead = id.substring(1);
		}
		if (id.contains("d")) {
			productDao.deleteById(idRead);
			return "redirect:/admin/listproduct/pagination";
		}
		if (id == null) {
			model.addAttribute("message", "<div class='text-danger font-weight-bold'>Không tìm thấy mã sản phẩm</div>");
			return "forward:/admin/editproduct";
		}
		productDao.deleteById(idRead);
		return "redirect:/admin/editproduct";
	}

	@GetMapping("/admin/editproduct/reset")
	public String reset() {
		return "redirect:/admin/editproduct";
	}

	@PostMapping("/admin/editproduct/update")
	public String update(@Valid @ModelAttribute("product") Product p, BindingResult rs,
			@RequestParam("img") MultipartFile multipartfile, Model model) throws IllegalStateException, IOException {
		if (!rs.hasErrors()) {
			if (productDao.existsById(p.getId())) {
				if (!multipartfile.isEmpty()) {
					String dir = imgUltil.saveImage(multipartfile, model);
					p.setImage(dir);
				}
				productDao.save(p);
				model.addAttribute("message", "<div class='text-success font-weight-bold'>Sản phẩm " + p.getId()
						+ " cập nhật thành công</div>");
			} else {
				model.addAttribute("message",
						"<div class='text-danger font-weight-bold'>Sản phẩm " + p.getId() + " không tồn tại</div>");
			}
		}
		model.addAttribute("img", p.getImage());
		return "page-admin/edit-product";
	}

	@RequestMapping("/admin/listproduct/pagination")
	public String listPagination(@RequestParam("pageNo") Optional<Integer> pageNo, @RequestParam("id") Optional<String> id,Optional<String> kw,
			Model model) {
		String kWorks = kw.orElse(session.get("keywords") == null ? "":session.get("keywords"));
		session.set("keywords",kWorks);
		Pageable pageable = PageRequest.of(pageNo.orElse(0), 8);
		if (id.orElse("") != "") {
			Page<Product> page = productDao.getAllByCategoryAndNameproduct(id.orElse(""), "%"+kWorks+"%", pageable);
			model.addAttribute("pageP", page);
			model.addAttribute("valueC", id.orElse(""));
		} else {
			Page<Product> page = productDao.findAll(pageable);
			model.addAttribute("pageP", page);
		}
		model.addAttribute("kws", kWorks);
		List<Category> listCategory = categoryDao.findAll();
		model.addAttribute("listCategory", listCategory);
		model.addAttribute("idCategory", id);
		return "page-admin/list-product";
	}

}
