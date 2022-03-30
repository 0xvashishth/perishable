package com.perishables.controller;

import java.util.ArrayList;

import java.util.Date;
	
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Set;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.perishables.model.Customer;
import com.perishables.model.Perishables;
import com.perishables.model.User;
import com.perishables.model.orderItems;
import com.perishables.model.orders;
import com.perishables.repository.ProductDao;
import com.perishables.repository.orderDao;
import com.perishables.repository.orderItemDao;

@Controller
@RequestMapping("/orders")
public class OrderController {
	@Autowired
	private ProductDao pDao;
	@Autowired
	private orderDao oDao;
	@Autowired
	private orderItemDao oiDao;
	
	@RequestMapping("/viewOrder")
	public ModelAndView showOrder(HttpServletRequest request, @RequestParam("id") String id) {
		ModelAndView mv = new ModelAndView();
		
		User u = (User)request.getSession().getAttribute("user");
		
		System.out.println("id " + id);
		if(u == null) {
			mv.setViewName("redirect:/");
			
			return mv;
		}
		
		Long oid = 0L;
		try {
			oid = Long.valueOf(id);
		} catch(Exception e) {
			mv.setViewName("redirect:/");
			
			return mv;
		}
		
		orders order = oDao.getById(oid);
		
		List<orderItems> items = oiDao.filter(order);
		
		if(u.getId() != order.getCustomer().getId() || order == null) {
			mv.setViewName("redirect:/");
			
			return mv;
		}
		
		mv.addObject("order", order);
		mv.addObject("items", items);
		mv.setViewName("billpage");
		return mv;
	}
}