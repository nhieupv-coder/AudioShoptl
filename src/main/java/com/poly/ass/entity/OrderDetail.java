package com.poly.ass.entity;

import java.io.Serializable;
import java.util.List;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.OneToMany;
import javax.persistence.OneToOne;
import javax.persistence.Table;

import javassist.SerialVersionUID;
import lombok.Data;

@Data
@Entity
@Table(name = "Orderdetail")
public class OrderDetail implements Serializable{
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	Long id;
	@OneToOne
	@JoinColumn(name ="idorder")
	Order order;
	@OneToOne
	@JoinColumn(name = "idproduct")
	Product product;
	Double price;
	int quantity = 1;
}
