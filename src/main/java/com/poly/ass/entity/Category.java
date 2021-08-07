package com.poly.ass.entity;

import java.io.Serializable;
import java.util.List;

import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.Table;
import javax.validation.constraints.NotBlank;

import lombok.Data;

@Data
@Entity
@Table(name = "Categories")
public class Category implements Serializable{
  @Id
  @NotBlank
  String id;
  @NotBlank
  String namecategory;
  @OneToMany(mappedBy = "category")
  List<Product> products;
}
