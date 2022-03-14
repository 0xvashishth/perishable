package com.perishables;

import java.io.File;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;

import com.perishables.controller.FileUploadController;

@SpringBootApplication
public class Myapplication {

	public static void main(String[] args) {
//		new File(FileUploadController.uploadDirectory).mkdir();
		SpringApplication.run(Myapplication.class, args);
	}
}