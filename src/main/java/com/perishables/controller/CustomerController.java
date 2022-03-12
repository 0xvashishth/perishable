package com.perishables.controller;

import java.io.IOException;
import java.net.http.HttpRequest;
import java.net.http.HttpResponse;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
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
	public ModelAndView registerCustomer(HttpServletRequest request, @ModelAttribute("customer") Customer c, @RequestParam("c_pass") String cpass) {
		ModelAndView mv = new ModelAndView();
		
//		Validation of the customer details
		if(!cpass.equals(c.getPassword())) {
			mv.addObject("PassMismatch", "The entered passwords do not match!");
			mv.setViewName("register-customer-form");
			return mv;
		}
		
		if(c.getName() == "" || c.getPassword() == "" || c.getEmail() == "" || c.getMobNo() == "" || c.getDob() == "") {
			mv.addObject("FieldEmpty", "Some required fields were left empty.");
			mv.setViewName("register-customer-form");
			return mv;
		}
		
//		If the details are valid, then create the user account
		cDao.save(c);
//		Start the user session
		HttpSession session = request.getSession();
		session.setAttribute("customer", c);
		
//		Save the user image
		Part filePart;
		try {
			filePart = request.getPart("c_img");
			String fileName = "" + c.getId();
			String context = "classpath:static/users/";
		    for (Part part : request.getParts()) {
		      part.write(context + fileName + ".png");
		    }
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (ServletException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		mv.addObject("customer", c);
		mv.setViewName("redirect:/");
		return mv;
	}
}