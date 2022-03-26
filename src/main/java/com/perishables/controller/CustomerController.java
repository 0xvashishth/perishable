package com.perishables.controller;

import java.io.File;
import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.io.ClassPathResource;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.perishables.model.Customer;
import com.perishables.model.User;
import com.perishables.repository.CustomerDao;

@Controller
@RequestMapping("/customer")
public class CustomerController {
	@Autowired
	private CustomerDao cDao;
	public static String uploadDirectory;
	
	{
		uploadDirectory = System.getProperty("user.dir")+"/src/main/resources/static/users";
	}
	
	@RequestMapping("/login/show")
	public ModelAndView showLoginForm(HttpServletRequest request) {
		ModelAndView mv = new ModelAndView();
		HttpSession session = request.getSession();
		if(session.getAttribute("customer") != null)
			mv.setViewName("redirect:/");
		else
			mv.setViewName("login-customer-form");
		return mv;
	}
	
	@RequestMapping("/login/submit")
	public ModelAndView submitLoginForm(HttpServletRequest request, @RequestParam("email") String email, @RequestParam("password") String password) {
		ModelAndView mv = new ModelAndView();
		User c = cDao.login(email);
		
		if(c == null) {
			mv.addObject("msg", "No such user found!");
			mv.setViewName("redirect:/customer/login/show");
			return mv;
		}
		
		if(password.equals(c.getPassword())) {
			mv.addObject("msg", "Logged in successfully!");
			HttpSession session = request.getSession();
			session.setAttribute("user", c);		
			mv.setViewName("redirect:/");
		} else {
			mv.addObject("msg", "Password is incorrect!");
			mv.setViewName("redirect:/customer/login/show");
		}
		return mv;
	}
	
	
	@RequestMapping("/update/submit")
	public ModelAndView updateCustomerAccount(RedirectAttributes rattrs, HttpServletRequest request, @ModelAttribute("customer") Customer c, @RequestParam("u_pic") MultipartFile[] files) {
		ModelAndView mv = new ModelAndView();
		HttpSession session = request.getSession();
		if(session.getAttribute("user") == null) {
			mv.setViewName("redirect:/");
			return mv;
		}
		
		if(c.getName() == "" || c.getAddress() == "" || c.getPassword() == "" || c.getEmail() == "" || c.getmobNo() == "" || c.getDob() == "") {
			rattrs.addAttribute("FieldEmpty", "Some required fields were left empty.");
			mv.setViewName("redirect:/customer/customerprofile");
			return mv;
		}
		
		cDao.update(c);
		
//		Update the profile picture
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
		
		session.setAttribute("user", c);
		session.setAttribute("userType", "Customer");
		mv.setViewName("redirect:/customer/customerprofile");
		return mv;
	}
	
	@RequestMapping("/delete")
	public ModelAndView deleteAccount(HttpServletRequest request) {
		ModelAndView mv = new ModelAndView();
		HttpSession session = request.getSession();
		if (session.getAttribute("customer") != null) {
			Customer c = (Customer)session.getAttribute("customer");
			cDao.delete(c);
			
			// Delete user profile image
			ClassPathResource resource = new ClassPathResource("/static/users/" + c.getId() + ".png");
			try {
				System.out.println(resource.getFile().getAbsolutePath());
				boolean status= resource.getFile().delete();
				System.out.println(status);
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			session.invalidate();
		}
		
		mv.setViewName("redirect:/");
		return mv;
	}
	
	@RequestMapping("/register/show")
	public ModelAndView showRegistrationForm(HttpServletRequest request) {
		ModelAndView mv = new ModelAndView();
		HttpSession session = request.getSession();
		if(session.getAttribute("customer") != null)
			mv.setViewName("redirect:/");
		else {
			mv.setViewName("register-customer-form");
			Customer c = new Customer();
			mv.addObject("customer", c);
		}
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
		if(session.getAttribute("user") != null) {
			ModelAndView mv = new ModelAndView();
	//		request.getSession().invalidate();
			User u = (User)session.getAttribute("user");
			if(u.getUserType().equals("Admin")) {
				mv.setViewName("admin/adminProfile");
				mv.addObject("admin", session.getAttribute("user"));
			}
			else {
				mv.setViewName("userprofile");
				mv.addObject("customer", session.getAttribute("user"));
			}
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
		
//		Determine the type of user (default is customer)
		c.setUserType("Customer");
		
//		If the details are valid, then create the user account
		cDao.save(c);
//		Start the user session
		HttpSession session = request.getSession();
		session.setAttribute("user", c);
		session.setAttribute("userType", "Customer");
		
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