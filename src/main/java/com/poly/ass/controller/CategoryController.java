package com.poly.ass.controller;

import java.util.List;
import java.util.Optional;

import javax.mail.Session;
import javax.validation.Valid;
import javax.websocket.server.PathParam;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.support.DaoSupport;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.poly.ass.dao.CategoryDAO;
import com.poly.ass.entity.Category;
import com.poly.ass.service.SessionService;

@Controller
public class CategoryController {
	@Autowired
	CategoryDAO categoryDao;
	@Autowired
	SessionService session;

	@GetMapping("/admin/editcategory")
	public String editCategory(@ModelAttribute("category") Category category) {
		return "page-admin/edit-category";
	}

	@RequestMapping("/admin/listCategory")
	public String viewListCategory(@RequestParam("pageNo") Optional<Integer> pageNo,
			@RequestParam("search-by") Optional<String> kw, Model model) {
		String kWorks = kw.orElse(session.get("keywords") == null ? "" : session.get("keywords"));
		session.set("keywords", kWorks);
		model.addAttribute("kws", kWorks);
		Pageable pageable = PageRequest.of(pageNo.orElse(0), 5);
		Page<Category> pageCategory = categoryDao.findAllByNamecategoryLike("%" + kWorks + "%", pageable);
		model.addAttribute("pageC", pageCategory);
		return "page-admin/list-category";
	}

	@GetMapping("/admin/category/insert")
	public String insert(@Valid @ModelAttribute("category") Category category, BindingResult rs, Model model) {
		if (!rs.hasErrors()) {
			if (!categoryDao.existsById(category.getId())) {
				categoryDao.save(category);
				model.addAttribute("message", "<div class='text-success font-weight-bold'>Tạo loại hàng "
						+ category.getId() + " thành công</div>");
			} else {

				model.addAttribute("message", "<div class='text-danger font-weight-bold'> loại hàng " + category.getId()
						+ " Đã tồn tại</div>");
			}
		}
		return "page-admin/edit-category";

	}

	@GetMapping("/admin/category/edit/{id}")
	public String edit(@PathVariable("id") String id, Model model) {
		Category category = categoryDao.getOne(id);
		model.addAttribute("category", category);
		model.addAttribute("st", true);
		return "page-admin/edit-category";
	}

	@GetMapping("/admin/category/reset")
	public String reset() {
		return "redirect:/admin/editcategory";
	}

	@GetMapping("/admin/category/update")
	public String update(@Valid @ModelAttribute("category") Category category, BindingResult rs, Model model) {
		if (!rs.hasErrors()) {
			if (categoryDao.existsById(category.getId())) {
				categoryDao.save(category);
			} else {
				model.addAttribute("message",
						"<div class='text-danger font-weight-bold'>Thất bại! loại hàng này không tồn tại</div>");
				return "page-admin/edit-category";
			}
			return "redirect:/category/edit/" + category.getId();
		}
		return "page-admin/edit-category";
	}

	@GetMapping("/admin/category/delete/{id1}")
	public String delete(@Valid @ModelAttribute("category") Category category, BindingResult rs,
			@PathVariable("id1") String id, Model model) {

		String idRead = id;
		if (id.contains("d")) {
			idRead = id.substring(1);
		}
		if (id.contains("d")) {
			try {
				categoryDao.deleteById(idRead);
			} catch (Exception e) {
				model.addAttribute("message", "không thể xóa");
			}
			return "redirect:/admin/listCategory";
		} else {
			try {
				categoryDao.deleteById(idRead);
			} catch (Exception e) {
				model.addAttribute("message", "không thể xóa");
			}
			return "redirect:/admin/editcategory";
		}

	}

}
