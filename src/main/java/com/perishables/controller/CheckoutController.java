package com.perishables.controller;

import java.util.ArrayList;

import java.util.Date;
	
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Set;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.perishables.model.Customer;
import com.perishables.model.Perishables;
import com.perishables.model.orderItems;
import com.perishables.model.orders;
import com.perishables.repository.ProductDao;
import com.perishables.repository.orderDao;
import com.perishables.repository.orderItemDao;

@Controller
@RequestMapping("/checkout")
public class CheckoutController {
	@Autowired
	private ProductDao pDao;
	@Autowired
	private orderDao oDao;
	@Autowired
	private orderItemDao oiDao;
	
	
	@RequestMapping("/")
	public ModelAndView showLoginForm(HttpServletRequest request , @ModelAttribute("customer") Customer c) {
		ModelAndView mv = new ModelAndView();
		HttpSession session = request.getSession();
		if(session.getAttribute("user") == null)
			mv.setViewName("redirect:/");
		else {
			mv.setViewName("checkout");
			HashMap<Long, Integer> mpcart = (HashMap<Long, Integer>) session.getAttribute("cart");
			String s=null, t=null;
			Set<Perishables> plist = pDao.filter(s, t, 100);
			mv.addObject("pList", plist);
			
		}
		return mv;
	}
	
	@RequestMapping("/submit")
	public ModelAndView submitcheckout(HttpServletRequest request, @ModelAttribute("customer") Customer c) {
		String address = request.getParameter("checkout_address");
		
		ModelAndView mv = new ModelAndView();
		HttpSession session = request.getSession();
		if(session.getAttribute("user") == null)
			mv.setViewName("redirect:/");
		else{
//			Date date = new Date();
			java.util.Date utilDate = new java.util.Date();
			java.sql.Date date = new java.sql.Date(utilDate.getTime());
			Customer c1 = (Customer) session.getAttribute("user");
			orders o1 = new orders();
			o1.setCustomer(c1);
			o1.setOrder_date(date);
			o1.setDeliveryAddress(address);
			o1.setBalanceStatus("given");
			double G_total = (double) session.getAttribute("G_total");
			o1.setTotal_price(G_total);
			oDao.save(o1);
			
			List<orderItems> objects = new ArrayList<orderItems>();
			
			mv.setViewName("billpage");
			HashMap<Long, Integer> mpcart = (HashMap<Long, Integer>) session.getAttribute("cart");
			
			Iterator it = mpcart.entrySet().iterator();
			
			while (it.hasNext()) {
		        HashMap.Entry pair = (HashMap.Entry)it.next();
		        orderItems oi = new orderItems();
		        oi.setOrders(o1);
		        oi.setQuantity((int) pair.getValue());
		        oi.setProduct(pDao.getById((Long) pair.getKey()));
		        oiDao.save(oi);
		        System.out.println(pair.getKey() + " = " + pair.getValue());
		    }
			String s=null, t=null;
			Set<Perishables> plist = pDao.filter(s, t, 100);
			mv.addObject("pList", plist);
			
		}
		
		return mv;
	}
}