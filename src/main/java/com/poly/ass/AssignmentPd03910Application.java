package com.poly.ass;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.data.jpa.repository.config.EnableJpaRepositories;
import org.springframework.scheduling.annotation.EnableScheduling;

@SpringBootApplication
@EnableScheduling
public class AssignmentPd03910Application {
	public static void main(String[] args) {
		SpringApplication.run(AssignmentPd03910Application.class, args);
	}

}
