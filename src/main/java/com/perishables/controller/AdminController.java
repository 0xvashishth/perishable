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
import com.perishables.repository.CustomerDao;

@Controller
@RequestMapping("/admin")
public class AdminController {
	@Autowired
	private CustomerDao cDao;
	
	@RequestMapping("/dashboard")
	public ModelAndView dashboard(HttpServletRequest request, @RequestParam("u_string") Optional<String> search) {
		ModelAndView mv = new ModelAndView();
		HttpSession session = request.getSession();
		User user = (User)session.getAttribute("user");
		if(user == null || !user.getUserType().equals("Admin")) {
			mv.setViewName("redirect:/");
		} else {
//			Add product form
			Product p = new Perishables();
			mv.addObject("product", p);

			mv.addObject("admin", user);
			mv.setViewName("admin/adminPanel");
			if(search.isPresent()) {
				Set<Customer> clist = cDao.find(search.get(), 25);
				mv.addObject("clist", clist);
			} else {
				Set<Customer> clist = cDao.find(null, 25);
				mv.addObject("clist", clist);
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
