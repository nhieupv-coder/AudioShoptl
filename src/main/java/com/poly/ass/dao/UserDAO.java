package com.poly.ass.dao;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;

import com.poly.ass.entity.User;

public interface UserDAO extends JpaRepository<User, String>{
    Page<User> findAllByNameLike(String kw, Pageable pageable);
}
