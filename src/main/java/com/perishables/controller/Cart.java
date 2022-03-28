package com.perishables.controller;

import java.util.HashMap;

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
			HashMap<Long, Integer> mp = (HashMap<Long, Integer>)session.getAttribute("cart");
			if(!mp.containsKey(id2)) {
				mp.put(id2, 1);
			}
			session.setAttribute("cart", mp);
		}
		
		return "Done";
	}
}
