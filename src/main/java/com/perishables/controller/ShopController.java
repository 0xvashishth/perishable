package com.perishables.controller;

import java.util.Optional;
import java.util.Set;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.perishables.model.*;
import com.perishables.repository.ProductDao;

@Controller
@RequestMapping("/shop")
public class ShopController {
	@Autowired
	private ProductDao pDao;
	
	@RequestMapping("/")
	public ModelAndView shop(@RequestParam("p_string") Optional<String> search, @RequestParam("p_type") Optional<String> type) {
		ModelAndView mv = new ModelAndView();
		
		String s=null, t=null;
		if(search.isPresent()) {
			s = search.get();
		}
		if(type.isPresent()) {
			t = type.get();
		}
		
		Set<Perishables> plist = pDao.filter(s, t, 100);
		mv.addObject("pList", plist);
		mv.addObject("filter_text", s);
		mv.addObject("filter_type", t);
		mv.setViewName("shop/shop");
		return mv;
	}
}
