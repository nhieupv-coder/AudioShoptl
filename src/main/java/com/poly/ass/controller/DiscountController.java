package com.poly.ass.controller;

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

import com.poly.ass.dao.DiscountDAO;
import com.poly.ass.dao.ProductDAO;
import com.poly.ass.entity.Discount;
import com.poly.ass.entity.Product;
import com.poly.ass.service.SessionService;


@Controller
public class DiscountController {
	@Autowired
	ProductDAO productdao;
	@Autowired
	DiscountDAO discountdao;
    @Autowired
    SessionService session;
	
	@GetMapping("/admin/discount")
	public String discount() {
		return "views/page-admin/edit-discount";
	}

	@ModelAttribute("listProduct")
	public List<Product> listProduct() {
		List<Product> list = productdao.findAll();
		return list;
	}

	@PostMapping("/admin/discount/update")
	public String updateDiscount(@RequestParam("idproduct") String idProduct,
			@RequestParam("percents") Integer percent) {
		Product p = productdao.getById(idProduct);
		Discount discount = new Discount();
		discount.setPercent(percent);
		discount.setProduct(p);
		discountdao.save(discount);
		return "views/page-admin/edit-discount";
	}

	@GetMapping("/admin/discount/loadProduct")
	public String getProductAnDiscount(@RequestParam("idproduct") String id, Model model) {
		Product p = productdao.getById(id);
		model.addAttribute("product", p);
		try {
			Discount discount = discountdao.findByProductEquals(p).get(0);
			model.addAttribute("percent", discount.getPercent());
		} catch (Exception e) {
			model.addAttribute("percent", 0);
		}
		return "views/page-admin/edit-discount";
	}

	@GetMapping("/admin/discount/add-or-update")
	public String addOrUpdateDiscount(@RequestParam("idproduct") Optional<String> idProduct,
			@RequestParam("percent") Optional<Float> percent) {
		Product p = productdao.getById(idProduct.orElse(""));
		if (p != null) {
			try {
				Discount discount = discountdao.findByProductEquals(p).get(0);
				discount.setPercent(percent.orElse(0F));
				discountdao.save(discount);
			} catch (Exception e) {
				Discount discount = new Discount();
				discount.setProduct(p);
				discount.setPercent(percent.orElse(0F));
				discountdao.save(discount);
			}
		}
      return "redirect:/admin/discount/loadProduct?idproduct="+p.getId();
	}
	@RequestMapping("/admin/discount/list-discount")
	public String getList(@RequestParam("search-kw") Optional<String> kw,Model model) {
		String kewords =  kw.orElse(session.get("keywords")!=null ?session.get("keywords"):"");
		session.set("keywords", kewords);
		Pageable pageable = PageRequest.of(0, 10);
		Page<Discount> page = discountdao.findDiscounByProductName("%"+kw.orElse("")+"%", pageable) ;
		model.addAttribute("pageC",page);
		model.addAttribute("kws", kewords);
		return "views/page-admin/list-discount";
	}
	@GetMapping("/admin/discount/delete")
	public String getList(@RequestParam("id") Long id) {
		discountdao.deleteById(id);
		return "redirect:/admin/discount/list-discount";
	}
	@GetMapping("/admin/discount/edit")
	public String edit(@RequestParam("id") String id) {
		return "redirect:/admin/discount/loadProduct?idproduct="+id;
	}
}
