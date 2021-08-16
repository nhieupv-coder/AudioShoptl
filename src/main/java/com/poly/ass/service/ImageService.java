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
	@Autowired(required = false)
	ServletContext app;

	public String saveImage(MultipartFile multipartFile, Model model) throws IllegalStateException, IOException {
		File file = new File(app.getRealPath("/img/post"));
		if (!file.exists()) {
			file.mkdirs();
		}
		try {
			String filename =  Integer.toHexString((int)System.currentTimeMillis())+multipartFile.getOriginalFilename().substring(multipartFile.getOriginalFilename().indexOf("."));
			String path = app.getRealPath("/img/post") + "/" +filename;
			File fileSave = new File(path);
			multipartFile.transferTo(fileSave);
			model.addAttribute("img", filename);
			return filename;
		} catch (Exception e) {
			return "default.png";
		}

	}
}
