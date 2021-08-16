package com.poly.ass.entity;

import java.io.Serializable;
import java.util.Date;
import java.util.List;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;
import javax.validation.constraints.Email;
import javax.validation.constraints.NotBlank;
import javax.validation.constraints.NotNull;

import org.hibernate.validator.constraints.Length;
import org.springframework.format.annotation.DateTimeFormat;

import lombok.Data;

@Data
@Entity
@Table(name = "Users")
public class User implements Serializable {
	@Id
	@NotBlank
	String id;
	@Length(min = 6)
	String password;
	@NotBlank
	String name;
	@NotNull
	@Temporal(TemporalType.DATE)
	@Column(name = "birthday")
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	Date birthDay;
	@NotNull
	boolean gender;
	@NotBlank
	@Email
	String email;
	@NotBlank
	String phone;
	@NotBlank
	String address;
	@NotBlank
	String admin;
	@NotNull
	boolean actived;
	String photo;
	@OneToMany(mappedBy = "user")
	List<Order> orders;
}
