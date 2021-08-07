package com.poly.ass.dao;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import com.poly.ass.entity.Category;
import com.poly.ass.entity.Product;

public interface ProductDAO extends JpaRepository<Product, String> {
	Page<Product> findAllByNameproductLike(String keywords, Pageable pageable);
	Page<Product> findAllByCategoryEquals(Category category,Pageable pageable);
	@Query("SELECT p FROM Product p WHERE p.category.id = ?1 AND p.nameproduct LIKE ?2")
	Page<Product> getAllByCategoryAndNameproduct(String category,String name,Pageable pageable);
}
