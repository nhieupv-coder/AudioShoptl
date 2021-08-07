package com.poly.ass.controller;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Optional;

import com.poly.ass.dao.DiscountDAO;
import com.poly.ass.dao.OrderDAO;
import com.poly.ass.dao.OrderDetailDAO;
import com.poly.ass.dao.ProductDAO;
import com.poly.ass.dao.UserDAO;
import com.poly.ass.entity.*;

import javax.websocket.Session;

import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.poly.ass.service.SessionService;
import com.poly.ass.service.ShoppingCartServiceImpl;
import com.poly.ass.service.UserService;

@Controller
public class CartController {
	@Autowired
	SessionService session;
	@Autowired
	ProductDAO productDao;
	@Autowired
	ShoppingCartServiceImpl cart;
	@Autowired
	OrderDAO orderDao;
	@Autowired
	UserDAO userDao;
	@Autowired
	OrderDetailDAO orderDetailDao;
	@Autowired
	UserService UserService;
	@Autowired
	DiscountDAO discountDao;
	
	@PostMapping("/product/addtocart")
	public String addToCart(@RequestParam("idproduct") String id, @RequestParam("amount") Optional<Integer> quantity,Authentication auth) {
		String username = auth.getName();
		User u = userDao.getById(username);
		
		//
		Product p = productDao.getById(id);
		Double price;
		try {
			Discount discount = discountDao.findByProductEquals(p).get(0);
			price = (double) (p.getPrice() - (p.getPrice() * discount.getPercent()) / 100);
		} catch (Exception e) {
			price = (double) p.getPrice();
		}
		cart.add(id, quantity, u.getAddress(), price,username);
		
		return "redirect:/home/cart?iduser=" + u.getId();
	}

	@GetMapping("/cart/deleteall")
	public String deleteCart() {
		cart.clear();
		return "redirect:/home/cart";
	}

	@GetMapping("/cart/remove")
	public String removeAproductInCart(@RequestParam("id") String id) {
		cart.remove(id);
		return "redirect:/home/cart";
	}

	@RequestMapping("/cart/update/{id}")
	public String updateACart(@PathVariable("id") Optional<String> idProductInCart,
			@RequestParam("quantity") Optional<Integer> quantity) {
		String id = idProductInCart.orElse("");
		Integer qty = quantity.orElse(-1);
		if (id != "" && qty != -1) {
			if (qty == 0) {
				return "redirect:/cart/remove?id=" + id;
			}
			cart.update(id, qty);
		}
		return "redirect:/home/cart";
	}

	@GetMapping("home/bought")
	public String bought(Model model) {
		if (session.get("username") == null) {
			return "page/bought";
		}
		User user = userDao.getById(session.get("username"));
		List<Order> listOrder = orderDao.findByUserEquals(user);
		model.addAttribute("listorder", listOrder);
		return "page/bought";
	}

	@GetMapping("/home/cart")
	public String cart(@RequestParam("iduser") Optional<String> address, Model model) {
		if (address.orElse("") != "") {
			User user = userDao.getById(address.orElse(""));
			model.addAttribute("address", user.getAddress());
		}
		if (cart.order != null) {
			model.addAttribute("listorder", cart.getAllOrderDetail());
		}
		return "page/cart";
	}

	@PostMapping("/cart/pay")
	public String pay(@RequestParam("address-delivery") String addressDelivery, Model model) {
		cart.order.setAddress(addressDelivery);
		orderDao.save(cart.order);
		orderDetailDao.saveAll(cart.getAllOrderDetail());
		cart.clear();
		model.addAttribute("message", "Đặt Hàng Thành Công");
		return "redirect:/home/bought";
	}

	@ModelAttribute("total")
	public double gettotal() {
		return cart.getAmount();
	}

	@ModelAttribute("discountDao")
	public DiscountDAO discountDao() {
		return discountDao;
	}

}
