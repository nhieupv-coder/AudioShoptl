package com.poly.ass.entity;

import java.io.Serializable;
import java.util.Date;
import javax.persistence.Id;

import org.springframework.format.annotation.DateTimeFormat;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class Statistical implements Serializable {
	@DateTimeFormat(pattern = "dd/MM/yyyy")
	Date date;
	double statistical;
	Long totalQuantity;
}
