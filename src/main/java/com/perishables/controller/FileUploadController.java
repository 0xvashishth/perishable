package com.perishables.controller;

import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

@Controller
public class FileUploadController {
	
//	public static String uploadDirectory = System.getProperty("user.dir")+"/src/main/resources/static/users";
	public static String uploadDirectory = System.getProperty("/home/vashishth/eclipse-workspace/users");
	
	
	@RequestMapping("/uploadtest")
	public String UploadPage(Model model) {
		return "uploadview";
	}
	
	@RequestMapping("/uploadfile")
	public String upload(Model model, @RequestParam("files") MultipartFile[] files) throws IOException {
		StringBuilder fileNames = new StringBuilder();
		for(MultipartFile file : files) {
			Path fileNameAndPath = Paths.get(uploadDirectory,file.getOriginalFilename());
			fileNames.append(file.getOriginalFilename());
			Files.write(fileNameAndPath, file.getBytes());
		}
		model.addAttribute("msg","Successfully files " + fileNames.toString());
		System.out.println("Successfully files " + fileNames.toString());
		return "uploadstatusview";
	}
}