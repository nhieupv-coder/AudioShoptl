package com.poly.ass.entity;

import java.io.Serializable;
import java.util.Date;
import java.util.List;

import com.poly.ass.entity.OrderDetail;


import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;

import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

import lombok.Data;

@Data
@Entity
@Table(name = "Orders")
public class Order implements Serializable{
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	Long id;
	@ManyToOne
	@JoinColumn(name = "iduser")
	User user;
	@Temporal(TemporalType.DATE)
	@Column(name = "datepurchase")
	Date  datepurchase = new Date();
	@Column(name = "address")
	String address;
	@OneToMany(mappedBy ="order")
	List<OrderDetail> listProductOrder; 
	
}
