package com.perishables.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.perishables.model.Customer;

@Controller
@RequestMapping("/checkout")
public class CheckoutController {
	
	@RequestMapping("/")
	public ModelAndView showLoginForm(HttpServletRequest request , @ModelAttribute("customer") Customer c) {
		ModelAndView mv = new ModelAndView();
		HttpSession session = request.getSession();
		if(session.getAttribute("customer") != null)
			mv.setViewName("checkout");
		else
			mv.setViewName("redirect:/");
		return mv;
	}
}