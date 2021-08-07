package com.poly.ass.service;

import java.util.List;
import java.util.Optional;

import com.poly.ass.entity.OrderDetail;


public interface ShoppingCartService {
	
	void add(String id, Optional<Integer> quantity,String address,Double price,String username);

	/**
	 * Xóa mặt hàng khỏi giỏ
	 * 
	 * @param id mã mặt hàng cần xóa
	 */
	void remove(String id);

	/**
	 * Thay đổi số lượng lên của mặt hàng trong giỏ
	 * 
	 * @param id  mã mặt hàng
	 * @param qty số lượng mới
	 * @return mặt hàng đã được thay đổi số lượng
	 */
	void update(String id, int qty);

	/**
	 * Xóa sạch các mặt hàng trong giỏ
	 */
	void clear();

	/**
	 * Lấy tất cả các mặt hàng trong giỏ
	 */
	List<OrderDetail> getAllOrderDetail();

	/**
	 * Lấy tổng số lượng các mặt hàng trong giỏ
	 */
	int getCount();

	/**
	 * Lấy tổng số tiền tất cả các mặt hàng trong giỏ
	 */
	double getAmount();
}
