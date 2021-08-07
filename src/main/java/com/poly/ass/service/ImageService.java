package com.poly.ass.service;

import java.io.File;
import java.io.IOException;

import javax.servlet.ServletContext;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;
import org.springframework.web.multipart.MultipartFile;

@Service
public class ImageService {
	@Autowired
	ServletContext app;

	public String saveImage(MultipartFile multipartFile, Model model) throws IllegalStateException, IOException {
		File file = new File(app.getRealPath("/resource/static/img/post"));
		if (!file.exists()) {
			file.mkdirs();
		}
		try {
			String path = app.getRealPath("/resources/static/img/post") + "/" + multipartFile.getOriginalFilename();
			File fileSave = new File(path);
			multipartFile.transferTo(fileSave);
			model.addAttribute("img", multipartFile.getOriginalFilename());
			return multipartFile.getOriginalFilename();
		} catch (Exception e) {
			return "default.png";
		}

	}
}
