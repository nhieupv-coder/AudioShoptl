package com.poly.ass.dao;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import com.poly.ass.entity.Product;
import com.poly.ass.entity.TrendProduct;
import com.poly.ass.entity.OrderDetail;

public interface OrderDetailDAO extends JpaRepository<OrderDetail, Long>{
 @Query("SELECT new com.poly.ass.entity.TrendProduct(o.product,sum(o.quantity)) FROM OrderDetail o GROUP BY o.product ORDER BY sum(o.quantity) DESC")
 List<TrendProduct> getTop10ProductTrend();
}
