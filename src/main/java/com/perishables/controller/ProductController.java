package com.perishables.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.perishables.model.Product;
import com.perishables.repository.ProductDao;

@Controller
@RequestMapping("/product")
public class ProductController {
	@Autowired
	private ProductDao pDao;
	
	@RequestMapping("/create")
	public ModelAndView createProduct(@ModelAttribute("product") Product product) {
		ModelAndView mv = new ModelAndView();
		pDao.save(product);
		mv.setViewName("redirect:/admin/dashboard");
		return mv;
	}
}
