package com.perishables.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.perishables.model.Customer;
import com.perishables.repository.CustomerDao;

@Controller
@RequestMapping("/customer")
public class CustomerController {
	@Autowired
	private CustomerDao cDao;
	
	@RequestMapping("/register/show")
	public ModelAndView showRegistrationForm() {
		ModelAndView mv = new ModelAndView();
		Customer c = new Customer();
		mv.addObject("customer", c);
		mv.setViewName("register-customer-form");
		return mv;
	}
	
	@RequestMapping("/register/submit")
	public ModelAndView registerCustomer(@ModelAttribute("customer") Customer c) {
		ModelAndView mv = new ModelAndView();
		cDao.save(c);
		mv.addObject("customer", c);
		mv.setViewName("index");
		return mv;
	}
}