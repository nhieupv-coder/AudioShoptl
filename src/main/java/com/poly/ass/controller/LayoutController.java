package com.poly.ass.controller;

import java.util.Optional;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.poly.ass.entity.Category;

@Controller
public class LayoutController {
	

	@GetMapping("/home/contact")
	public String contact() {
		return "page/contact";
	}

   @GetMapping("/home/list-user")
   public String showList() {
	   return "views/page-admin/list-users";
   }
   @RequestMapping("/errors")
   public String error(@RequestParam("error") Optional<String> error,Model model) {
	   model.addAttribute("error", error.orElse("Not found"));
	   return "/page/error/error-page";
   }
	
}
