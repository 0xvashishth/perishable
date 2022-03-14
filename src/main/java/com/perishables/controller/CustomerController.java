package com.perishables.controller;

import java.io.IOException;
import java.net.http.HttpRequest;
import java.net.http.HttpResponse;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;

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
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.perishables.model.Customer;
import com.perishables.repository.CustomerDao;

@Controller
@RequestMapping("/customer")
public class CustomerController {
	@Autowired
	private CustomerDao cDao;
	public static String uploadDirectory = System.getProperty("user.dir")+"/src/main/resources/static/users";
	
	@RequestMapping("/register/show")
	public ModelAndView showRegistrationForm() {
		ModelAndView mv = new ModelAndView();
		Customer c = new Customer();
		mv.addObject("customer", c);
		mv.setViewName("register-customer-form");
		return mv;
	}
	
	@RequestMapping("/logout")
	public ModelAndView logoutuser(HttpServletRequest request) {
		ModelAndView mv = new ModelAndView();
		request.getSession().invalidate();
		mv.setViewName("redirect:/");
		return mv;
	}
	
	@RequestMapping("/customerprofile")
	public ModelAndView customerprofile(HttpServletRequest request) {
		HttpSession session = request.getSession();
		if(session.getAttribute("customer") != null) {
			ModelAndView mv = new ModelAndView();
	//		request.getSession().invalidate();
			mv.setViewName("userprofile");
			return mv;
		}
		else {
			ModelAndView mv = new ModelAndView();
			mv.setViewName("redirect:/");
			return mv;
		}
	}
	
	@RequestMapping("/register/submit")
	public ModelAndView registerCustomer(HttpServletRequest request, @ModelAttribute("customer") Customer c, @RequestParam("c_pass") String cpass, @RequestParam("c_img") MultipartFile[] files) {
		ModelAndView mv = new ModelAndView();
		
//		Validation of the customer details
		if(!cpass.equals(c.getPassword())) {
			mv.addObject("PassMismatch", "The entered passwords do not match!");
			mv.setViewName("register-customer-form");
			return mv;
		}
		
		if(c.getName() == "" || c.getAddress() == "" || c.getPassword() == "" || c.getEmail() == "" || c.getmobNo() == "" || c.getDob() == "") {
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
//		Part filePart;
//		try {
//			filePart = request.getPart("c_img");
//			String fileName = "" + c.getId();
//			String context = "classpath:static/users/";
//		    for (Part part : request.getParts()) {
//		      part.write(context + fileName + ".png");
//		    }
//		} catch (IOException e) {
//			// TODO Auto-generated catch block
//			e.printStackTrace();
//		} catch (ServletException e) {
//			// TODO Auto-generated catch block
//			e.printStackTrace();
//		}
		StringBuilder fileNames = new StringBuilder();
		String fileName = "" + c.getId() + ".png";
		for(MultipartFile file : files) {
			Path fileNameAndPath = Paths.get(uploadDirectory,fileName);
			fileNames.append(fileName);
			try {
				Files.write(fileNameAndPath, file.getBytes());
				System.out.println("Successfully files " + fileNames.toString());
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
//		model.addAttribute("msg","Successfully files " + fileNames.toString());
		
		

		mv.addObject("customer", c);
		mv.setViewName("redirect:/");
		return mv;
	}
}