package com.perishables.controller;

import java.io.File;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import javax.servlet.RequestDispatcher;
import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.HashMap;
import java.util.Map;
import java.util.Set;

import javax.servlet.ServletContext;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.catalina.core.ApplicationContext;
import org.springframework.beans.factory.BeanFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.SpringApplication;
import org.springframework.core.io.ClassPathResource;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.perishables.bean.Mail;
import com.perishables.model.Customer;
import com.perishables.model.User;
import com.perishables.model.orders;
import com.perishables.repository.CustomerDao;
import com.perishables.service.MailService;


@Controller
@RequestMapping("/customer")
public class CustomerController{
	@Autowired
	private CustomerDao cDao;
	public static String uploadDirectory;
	
	{
		uploadDirectory = System.getProperty("user.dir")+"/src/main/resources/static/users";
	}
	
//	private String host;
//    private String port;
//    private String user;
//    private String pass;
// 
//    public void init() {
//        // reads SMTP server setting from web.xml file
//        ServletContext context = getServletContext();
//        host = context.getInitParameter("host");
//        port = context.getInitParameter("port");
//        user = context.getInitParameter("user");
//        pass = context.getInitParameter("pass");
//    }
	
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
			
			Cookie[] cookies = request.getCookies();
			if(cookies != null) {
				Cookie cookie = null;
				for(int i=0; i < cookies.length; i++) {
					if(cookies[i].getName().equals("" + c.getId())) {
						cookie = cookies[i];
						break;
					}
				}
				
				if(cookie != null) {
					HashMap<Long, Integer> mp = new HashMap<Long, Integer>();
					
					String[] pairs = cookie.getValue().split(":");
					for(int i=0; i < pairs.length; i++) {
						String pId = pairs[i].split("-")[0];
						String quan = pairs[i].split("-")[1];
												
						try {
							Long.valueOf(pId);
							Integer.valueOf(quan);
						}
						catch(Exception e) {
							continue;
						}
						
						mp.put(Long.valueOf(pId), Integer.valueOf(quan));
					}
					
					session.setAttribute("cart", mp);
				}
			}
			
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
	public ModelAndView logoutuser(HttpServletRequest request, HttpServletResponse response) {
		ModelAndView mv = new ModelAndView();
		
		HttpSession session = request.getSession();
		User cust = (User)session.getAttribute("user");
		if(session.getAttribute("cart") != null && cust != null) {
			HashMap<Long, Integer> mp = (HashMap<Long, Integer>)session.getAttribute("cart");
			if(!mp.isEmpty()) {
				Cookie c = new Cookie("" + cust.getId(), "");
				for(Map.Entry<Long, Integer> entry: mp.entrySet()) {
					c.setValue(c.getValue() + entry.getKey() + "-" + entry.getValue() + ":");
				}
				c.setMaxAge(30*24*3600);
				response.addCookie(c);
			}
		}
		
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
				Set<orders> qset = cDao.getUserOrders(u.getId());
				session.setAttribute("orderset", qset);
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
		Long id1 = cDao.save(c);
		if(id1 == -1L) {
			mv.setViewName("redirect:/customer/register");
			return mv;
		}
			
		
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
		
//		String subject = "Recover Password | Perishable System";
////      
//      String content = "Your Passsword : ";
//
//      String resultMessage = "";
//
//    
//      try {
//          EmailUtility.sendEmail(host, port, user, pass, "vashishthchaudhary48@gmail.com", subject,
//                  content);
//          System.out.println("The e-mail was sent successfully");
//      } catch (Exception ex) {
//          ex.printStackTrace();
//          System.out.println("There were an error: " + ex.getMessage());
//      }
      
//		model.addAttribute("msg","Successfully files " + fileNames.toString());
		mv.addObject("customer", c);
		mv.setViewName("redirect:/");
		return mv;
	}
}