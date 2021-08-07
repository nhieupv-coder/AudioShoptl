package com.poly.ass.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
import org.springframework.data.domain.Sort.Direction;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;

import com.poly.ass.dao.DiscountDAO;
import com.poly.ass.dao.OrderDetailDAO;
import com.poly.ass.entity.Discount;
import com.poly.ass.entity.Product;
import com.poly.ass.entity.TrendProduct;

@Controller
public class HomeController {
	@Autowired
	DiscountDAO discountDao;
	@Autowired
	OrderDetailDAO orderdDetailDao;

	@GetMapping(value = {"/home","/"})
	public String home(Model model) {
		 Sort sort = Sort.by(Direction.DESC,"percent");
		 Pageable pageable = PageRequest.of(0, 10,sort);
		 Page<Discount> pageDiscount = discountDao.findAll(pageable);
		 List<TrendProduct> listTop10ProductTrend = orderdDetailDao.getTop10ProductTrend();
		 model.addAttribute("topProduct", listTop10ProductTrend);
		 model.addAttribute("pageDiscount",pageDiscount);
		return "page/home";
	}
}
