
package com.poly.ass.entity;

import java.io.Serializable;
import java.util.Date;
import java.util.List;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.OneToOne;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;
import javax.validation.constraints.Email;
import javax.validation.constraints.Min;
import javax.validation.constraints.NotBlank;
import javax.validation.constraints.NotEmpty;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Pattern;



import lombok.Data;

@Data
@Entity
@Table(name = "Products")
public class Product implements Serializable{
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	@Id
	@Pattern(regexp = "SP[0-9]{3}")
	String id;
	@NotBlank
	String nameproduct;
	@NotBlank 
	String description;
	@NotNull @Min(0)
	float price;
	@NotNull @Min(0)
	int quantity;
	@ManyToOne
	@JoinColumn(name = "idcategory")
	Category category;
	@Temporal(TemporalType.DATE)
	@Column(name = "createdate")
	Date createDate = new Date();
	String image;
	@OneToMany(mappedBy = "product")
	List<OrderDetail> orderDetails;
}
