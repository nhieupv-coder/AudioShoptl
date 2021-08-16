package com.poly.ass.dao;


import java.util.List;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import com.poly.ass.entity.Discount;
import com.poly.ass.entity.Product;
@Repository
public interface DiscountDAO extends JpaRepository<Discount, Long> {
	List<Discount> findByProductEquals(Product product);
	@Query("SELECT d FROM Discount d WHERE d.product.nameproduct LIKE ?1 ORDER BY d.percent DESC")
	Page<Discount> findDiscounByProductName(String nameProduct,Pageable pageable);

}
