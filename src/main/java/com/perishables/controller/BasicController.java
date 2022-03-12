package com.perishables.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
@RequestMapping("/")
public class BasicController {
	@RequestMapping("/")
	public ModelAndView Home(HttpServletRequest request) {
		ModelAndView mv = new ModelAndView();
		HttpSession session = request.getSession();
		if(session.getAttribute("customer") != null) {
			mv.addObject("customer", session.getAttribute("customer"));
		}
		mv.setViewName("index");
		return mv;
	}
}
