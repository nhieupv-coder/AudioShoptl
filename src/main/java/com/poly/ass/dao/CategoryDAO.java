package com.poly.ass.dao;
import java.util.List;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;

import com.poly.ass.entity.Category;

public interface CategoryDAO extends JpaRepository<Category, String>{
	Page<Category>findAllByNamecategoryLike(String name,Pageable pageable);
}
