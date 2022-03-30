package com.perishables.controller;

import java.util.List;
import java.util.Optional;
import java.util.Set;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.perishables.model.Customer;
import com.perishables.model.Perishables;
import com.perishables.model.Product;
import com.perishables.model.User;
import com.perishables.model.orders;
import com.perishables.repository.CustomerDao;
import com.perishables.repository.ProductDao;
import com.perishables.repository.orderDao;

@Controller
@RequestMapping("/admin")
public class AdminController {
	@Autowired
	private CustomerDao cDao;
	@Autowired
	private ProductDao pDao;
	@Autowired
	private orderDao oDao;
	
	@RequestMapping("/dashboard")
	public ModelAndView dashboard(HttpServletRequest request, @RequestParam("u_string") Optional<String> search, @RequestParam("u_string_p") Optional<String> searchP, @RequestParam("o_string") Optional<String> searchO) {
		ModelAndView mv = new ModelAndView();
		HttpSession session = request.getSession();
		User user = (User)session.getAttribute("user");
		if(user == null || !user.getUserType().equals("Admin")) {
			mv.setViewName("redirect:/");
		} else {
//			Add product form
			Perishables p = new Perishables();
			mv.addObject("perishable", p);

			mv.addObject("admin", user);
			mv.setViewName("admin/adminPanel");
			if(search.isPresent()) {
				Set<Customer> clist = cDao.find(search.get(), 25);
				mv.addObject("clist", clist);
			} else {
				Set<Customer> clist = cDao.find(null, 25);
				mv.addObject("clist", clist);
			} 
			
			if(searchP.isPresent()) {
				Set<Perishables> pList = pDao.find(searchP.get(), 25);
				mv.addObject("pList", pList);
			} else {
				Set<Perishables> pList = pDao.find(null, 25);
				mv.addObject("pList", pList);
			}
			
			if(searchO.isPresent()) {
				Set<orders> oList = oDao.find(searchO.get(), 25);
				mv.addObject("oList", oList);
			} else {
				Set<orders> oList = oDao.find(null, 25);
				mv.addObject("oList", oList);
			}
		}
		return mv;
	}
	
	@RequestMapping("/deleteUser")
	public ModelAndView deleteUser(HttpServletRequest request, @RequestParam("id") Long id) {
		ModelAndView mv = new ModelAndView();
		HttpSession session = request.getSession();
		User u = (User)session.getAttribute("user");
		if(u == null) {
			mv.setViewName("redirect:/");
			return mv;
		} else {
			cDao.deleteById(id);
			mv.addObject("admin", u);
			mv.setViewName("redirect:/admin/dashboard");
		}
		return mv;
	}
}
