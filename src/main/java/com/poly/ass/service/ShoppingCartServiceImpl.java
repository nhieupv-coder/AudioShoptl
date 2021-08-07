package com.poly.ass.service;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Service;
import org.springframework.web.context.annotation.SessionScope;

import com.poly.ass.controller.CartController;
import com.poly.ass.dao.ProductDAO;
import com.poly.ass.dao.UserDAO;
import com.poly.ass.entity.Order;
import com.poly.ass.entity.OrderDetail;
import com.poly.ass.entity.User;

@Service
@SessionScope
public class ShoppingCartServiceImpl implements ShoppingCartService {
	@Autowired
	SessionService session;
	@Autowired
	ProductDAO productDao;
	@Autowired
	UserDAO userDao;

	public static Order order;

	@Override
	public void add(String id, Optional<Integer> quantity, String address, Double price,String username) {
		// test
		 Authentication auth;
		User u = userDao.getById(username);
		//

		if (order == null || order.getUser().getId() != username) {
			// will edit
			order = new Order();
//			User u = new User();
//			u.setId("US1");
			order.setUser(u);
			// end
			order.setAddress(address);
			order.setDatepurchase(new Date());

			///
			List<OrderDetail> list = new ArrayList<>();
			OrderDetail orderDetail = new OrderDetail();
			orderDetail.setOrder(order);
			orderDetail.setPrice(price);
			orderDetail.setProduct(productDao.getById(id));
			orderDetail.setQuantity(quantity.orElse(0));
			list.add(orderDetail);
			//
			order.setListProductOrder(list);
		} else {
			List<OrderDetail> listOrderDetail = order.getListProductOrder();
			for (int i = 0; i < listOrderDetail.size(); i++) {
				if (listOrderDetail.get(i).getProduct().getId().equals(id)) {
					OrderDetail o = listOrderDetail.get(i);
					o.setQuantity(o.getQuantity() + quantity.orElse(0));
					listOrderDetail.set(i, o);
					order.setListProductOrder(listOrderDetail);
					return;
				}
			}
			OrderDetail orderDetail2 = new OrderDetail();
			orderDetail2.setOrder(order);
			orderDetail2.setProduct(productDao.getById(id));
			orderDetail2.setQuantity(quantity.orElse(0));
			orderDetail2.setPrice(price);
			listOrderDetail.add(orderDetail2);
			return;
		}
	}

	@Override
	public void remove(String id) {
		List<OrderDetail> list = order.getListProductOrder();
		for (int i = 0; i < list.size(); i++) {
			if (list.get(i).getProduct().getId().equals(id)) {
				list.remove(i);
			}
		}
		order.setListProductOrder(list);
	}

	@Override
	public void update(String id, int qty) {
		List<OrderDetail> listOrderDetail = order.getListProductOrder();
		for (OrderDetail orderDetail : listOrderDetail) {
			if (orderDetail.getProduct().getId().equals(id)) {
				orderDetail.setQuantity(qty);
			}
		}
		order.setListProductOrder(listOrderDetail);
		return;
	}

	@Override
	public void clear() {
		order = null;
	}

	@Override
	public int getCount() {
		return order.getListProductOrder().size();
	}

	@Override
	public double getAmount() {
		double amount = 0;
		if (order != null) {
			List<OrderDetail> list = this.getAllOrderDetail();
			for (OrderDetail orderDetail : list) {
				amount += orderDetail.getQuantity() * orderDetail.getPrice();
			}
		}
		return amount;
	}

	@Override
	public List<OrderDetail> getAllOrderDetail() {
		return order.getListProductOrder();
	}

}
