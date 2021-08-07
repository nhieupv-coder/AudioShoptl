package com.poly.ass.controller;

import com.poly.ass.entity.*;
import com.poly.ass.ultils.ConvertUltil;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.poly.ass.dao.CategoryDAO;
import com.poly.ass.dao.OrderDAO;

@Controller
public class StatisticalController {
	@Autowired
	OrderDAO orderDao;
	@Autowired
	CategoryDAO categoryDao;
	@ModelAttribute("listcategory")
	public List<Category> getListCategory() {
		List<Category> listCategory = categoryDao.findAll();
		return listCategory;
	}

	@RequestMapping("admin/statitiscal/bydate")
	public String statistcalByDate(@RequestParam("begin") Optional<String> begin, @RequestParam("end") Optional<String> end,@RequestParam("pageNo") Optional<Integer> pageNo, Model model)
			throws ParseException {
		SimpleDateFormat fmt = new SimpleDateFormat();
		fmt.applyPattern("yyyy-MM-dd");
		Pageable pageable = PageRequest.of(pageNo.orElse(0), 10);
		Page<Statistical> page = orderDao.statisticalByDate(fmt.parse(begin.orElse(fmt.format(new Date()))),
				fmt.parse(end.orElse(fmt.format(new Date()))),pageable);
		model.addAttribute("page", page);
		model.addAttribute("begin", begin.orElse(fmt.format(new Date())));
		model.addAttribute("end", end.orElse(fmt.format(new Date())));
		return "views/page-admin/statistical-bydate";
	}
	@RequestMapping("/admin/statistical-category")
	public String getStatisticalByCategory(@RequestParam("category") Optional<String> idCategory,@RequestParam("pageNo") Optional<Integer> pageNo,Model model) {
		Pageable pageable = PageRequest.of(pageNo.orElse(0), 10);
		Page<Statistical> page = orderDao.statisticalByCategory(idCategory.orElse("LH001"), pageable);
		model.addAttribute("page", page);
		model.addAttribute("idCategory", idCategory.orElse("LH001"));
		return "views/page-admin/statistical-category";
	}
	

}
