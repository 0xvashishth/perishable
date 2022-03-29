package com.perishables.controller;

import java.util.HashMap;
import java.util.Iterator;
import java.util.Set;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.perishables.model.Perishables;
import com.perishables.repository.ProductDao;

@Controller
@RequestMapping("/cart")
public class Cart {
	@Autowired
	private ProductDao pDao;
	
	@RequestMapping("/add")
	@ResponseBody
	public String add(HttpServletRequest request, @RequestParam("id") String id) {
		String tokens[] = id.strip().split("-");
		id = tokens[tokens.length - 1];
		Long id2 = Long.valueOf(id);
		
		HttpSession session = request.getSession();
		if(session.getAttribute("cart") == null) {
			session.setAttribute("cart", new HashMap<Long, Integer>());
		}
		if(id != null) {
			@SuppressWarnings("unchecked")
			HashMap<Long, Integer> mp = (HashMap<Long, Integer>)session.getAttribute("cart");
			if(!mp.containsKey(id2)) {
				mp.put(id2, 1);
			}
			System.out.println("Added in cart !");
			session.setAttribute("cart", mp);
		}
		
		return "Done";
	}
	
	
	@SuppressWarnings("unlikely-arg-type")
	@RequestMapping("/addmore")
	@ResponseBody
	public String addmore(HttpServletRequest request, @RequestParam("id") String id) {
		String tokens[] = id.strip().split("-");
		id = tokens[tokens.length - 1];
		Long id2 = null;
		try {
			id2 = Long.valueOf(id);
		} catch (NumberFormatException e) {
			e.printStackTrace();
		}
		HttpSession session = request.getSession();
		if(id2 != null) {
			@SuppressWarnings("unchecked")
			HashMap<Long, Integer> mpcart = (HashMap<Long, Integer>) session.getAttribute("cart");
			mpcart.replace(id2,(mpcart.get(id2)+1));
			session.setAttribute("cart", mpcart);
		}
		
		return "Done";
	}
	
	@SuppressWarnings("unlikely-arg-type")
	@RequestMapping("/removemore")
	@ResponseBody
	public String removemore(HttpServletRequest request, @RequestParam("id") String id) {
		String tokens[] = id.strip().split("-");
		id = tokens[tokens.length - 1];
		Long id2 = null;
		try {
			id2 = Long.valueOf(id);
		} catch (NumberFormatException e) {
			e.printStackTrace();
		}
		HttpSession session = request.getSession();
		if(id2 != null) {
			@SuppressWarnings("unchecked")
			HashMap<Long, Integer> mpcart = (HashMap<Long, Integer>) session.getAttribute("cart");
			mpcart.replace(id2,(mpcart.get(id2)-1));
			session.setAttribute("cart", mpcart);
		}
		
		return "Done";
	}
	
	@SuppressWarnings("unlikely-arg-type")
	@RequestMapping("/removeitem")
	@ResponseBody
	public String removeitem(HttpServletRequest request, @RequestParam("id") String id) {
		String tokens[] = id.strip().split("-");
		id = tokens[tokens.length - 1];
		Long id2 = null;
		try {
			id2 = Long.valueOf(id);
		} catch (NumberFormatException e) {
			e.printStackTrace();
		}
		HttpSession session = request.getSession();
		if(id2 != null) {
			@SuppressWarnings("unchecked")
			HashMap<Long, Integer> mpcart = (HashMap<Long, Integer>) session.getAttribute("cart");
			Integer returned_value = mpcart.remove(id2);
			System.out.println("Removed " + returned_value);
			session.setAttribute("cart", mpcart);
		}
		
		return "Done";
	}
	
	@SuppressWarnings("unchecked")
	@RequestMapping("/show")
	public ModelAndView showLoginForm(HttpServletRequest request) {
		ModelAndView mv = new ModelAndView();
		HttpSession session = request.getSession();
		if(session.getAttribute("customer") != null)
			mv.setViewName("redirect:/");
		else {
			mv.setViewName("cart");
			HashMap<Long, Integer> mpcart = (HashMap<Long, Integer>) session.getAttribute("cart");
			String s=null, t=null;
			Set<Perishables> plist = pDao.filter(s, t, 100);
			mv.addObject("pList", plist);
		}
		return mv;
	}
}
