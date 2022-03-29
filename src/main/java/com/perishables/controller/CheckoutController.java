package com.perishables.controller;

import java.util.HashMap;
import java.util.Set;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.perishables.model.Customer;
import com.perishables.model.Perishables;
import com.perishables.repository.ProductDao;

@Controller
@RequestMapping("/checkout")
public class CheckoutController {
	@Autowired
	private ProductDao pDao;
	
	@RequestMapping("/")
	public ModelAndView showLoginForm(HttpServletRequest request , @ModelAttribute("customer") Customer c) {
		ModelAndView mv = new ModelAndView();
		HttpSession session = request.getSession();
		if(session.getAttribute("customer") != null)
			mv.setViewName("redirect:/");
		else {
			mv.setViewName("checkout");
			HashMap<Long, Integer> mpcart = (HashMap<Long, Integer>) session.getAttribute("cart");
			String s=null, t=null;
			Set<Perishables> plist = pDao.filter(s, t, 100);
			mv.addObject("pList", plist);
			
		}
		return mv;
	}
	
	@RequestMapping("submit")
	public ModelAndView submitcheckout(HttpServletRequest request, @ModelAttribute("customer") Customer c) {
		String address = request.getParameter("checkout_address");
		
		ModelAndView mv = new ModelAndView();
		HttpSession session = request.getSession();
		if(session.getAttribute("customer") != null)
			mv.setViewName("redirect:/");
		else{
			mv.setViewName("billpage");
			HashMap<Long, Integer> mpcart = (HashMap<Long, Integer>) session.getAttribute("cart");
			String s=null, t=null;
			Set<Perishables> plist = pDao.filter(s, t, 100);
			mv.addObject("pList", plist);
			
		}
		
		return mv;
	}
}