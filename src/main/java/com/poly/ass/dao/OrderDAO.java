package com.poly.ass.dao;


import java.util.Date;
import java.util.List;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import com.poly.ass.entity.Order;
import com.poly.ass.entity.Statistical;
import com.poly.ass.entity.User;

public interface OrderDAO extends JpaRepository<Order, Long> {
    @Query("SELECT new com.poly.ass.entity.Statistical(a.order.datepurchase,Sum(a.quantity*a.price),Sum(a.quantity)) FROM OrderDetail a WHERE a.order.datepurchase BETWEEN ?1 and ?2 GROUP BY a.order.datepurchase")
    Page<Statistical> statisticalByDate(Date date1, Date date2,Pageable pageable);
    List<Order> findByUserEquals(User user);
    @Query("SELECT new com.poly.ass.entity.Statistical(a.order.datepurchase,Sum(a.quantity*a.price),Sum(a.quantity)) FROM OrderDetail a WHERE a.product.category.id = ?1 GROUP BY a.order.datepurchase")
    Page<Statistical>  statisticalByCategory(String idCategory,Pageable pageable);
}
