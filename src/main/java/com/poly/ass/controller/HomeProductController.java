package com.poly.ass.controller;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageImpl;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
import org.springframework.data.domain.Sort.Direction;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.poly.ass.dao.CategoryDAO;
import com.poly.ass.dao.DiscountDAO;
import com.poly.ass.dao.ProductDAO;
import com.poly.ass.entity.Category;
import com.poly.ass.entity.Product;
import com.poly.ass.service.SessionService;
import com.poly.ass.service.UserService;
import com.poly.ass.ultils.ConvertUltil;

@Controller
public class HomeProductController {
	@Autowired
	ProductDAO productDao;
	@Autowired
	CategoryDAO categoryDao;
	@Autowired
	UserService userService;
	@Autowired
	DiscountDAO discountDao;
	@Autowired
	SessionService session;

	@GetMapping("/home/product")
	public String product() {
		session.remove("keywords");
		return "forward:/product/search-sort-pagination";
	}

	@GetMapping("/home/order")
	public String orderProduct(@RequestParam("id") Optional<String> id, Model model) {
			Product product = productDao.getById(id.orElse(""));
			model.addAttribute("product", product);
			return "page/order";
	}

	@GetMapping("/product/list-category")
	public String viewListWithCategory(@RequestParam("id") String id, Model model) {
		Category category = categoryDao.getOne(id);
		Pageable pageable = PageRequest.of(0, 9);
		Page<Product> page = ConvertUltil.listConvertToPage1(category.getProducts(), pageable);
		model.addAttribute("page", page);
		List<Category> listCategory = categoryDao.findAll();
		model.addAttribute("listCategory", listCategory);
		model.addAttribute("idCategory", id);
		return "page/product";
	}

	@RequestMapping("/product/search-sort-pagination")
	public String listPagination(@RequestParam("keyworks") Optional<String> kw,Optional<Integer> pageNo,@RequestParam("id") Optional<String> idCategory,@RequestParam("typesort") Optional<String> typeSort,@RequestParam("sortby") Optional<String> sortBy ,Model model) {
		//
		List<Category> listCategory = categoryDao.findAll();
		model.addAttribute("listCategory", listCategory);
		//
		//Sort
		Sort sort;
		if(typeSort.orElse("").equals("")) {
			sort = Sort.by(Direction.DESC,"nameproduct");
		}else{
			if(typeSort.orElse("ASC").equals("DESC")) {
				sort = Sort.by(Direction.DESC,sortBy.orElse("nameproduct"));
			}else {
				sort = Sort.by(Direction.ASC,sortBy.orElse("nameproduct"));
			}
			model.addAttribute("typesort", typeSort.orElse("ASC"));
			model.addAttribute("sortby", sortBy.orElse("nameproduct"));
		}
		
		String kWorks = kw.orElse(session.get("keywords") == null ? "":session.get("keywords"));
		session.set("keywords", kWorks);
		Pageable pageable = PageRequest.of(pageNo.orElse(0), 9,sort);
		Page<Product> page = Page.empty();
		
		String idCtgr = idCategory.orElse("");
		if(idCtgr !="") {
		    page = productDao.getAllByCategoryAndNameproduct(idCtgr,"%"+kWorks+"%",pageable);
		    model.addAttribute("idCategory", idCtgr);
		}else {
			page = productDao.findAllByNameproductLike("%"+kWorks+"%", pageable);
		}
		
		model.addAttribute("page", page);
		model.addAttribute("kw", kWorks);
		return "page/product";
	}



	@ModelAttribute("discountDao")
	public DiscountDAO discountDao() {
		return discountDao;
	}

}
