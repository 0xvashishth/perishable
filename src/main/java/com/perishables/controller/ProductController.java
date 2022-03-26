package com.perishables.controller;

import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.perishables.model.Dairy;
import com.perishables.model.Fruits;
import com.perishables.model.Meat;
import com.perishables.model.Oil;
import com.perishables.model.Perishables;
import com.perishables.model.Product;
import com.perishables.model.User;
import com.perishables.model.Vegetables;
import com.perishables.repository.ProductDao;

@Controller
@RequestMapping("/product")
public class ProductController {
	@Autowired
	private ProductDao pDao;
	public static String uploadDirectory;
	
	{
		uploadDirectory = System.getProperty("user.dir")+"/src/main/resources/static/products";
	}
		
	public Perishables saveCorrectObject(String type, float items, Perishables p) {
		switch(type) {
			case "Fruits": p = new Fruits(p); ((Fruits) p).setItemsPerPack((int)items); pDao.save(p); break;
			case "Vegetables": p = new Vegetables(p); ((Vegetables) p).setItemsPerPack((int)items); pDao.save(p); break;
			case "Oil": p = new Oil(p); ((Oil) p).setMillilitresPerItem(items); pDao.save(p); break;
			case "Dairy": p = new Dairy(p); ((Dairy) p).setMillilitresPerItem(items); pDao.save(p); break;
			case "Meat": p = new Meat(p); ((Meat) p).setGramsPerItem(items); pDao.save(p); break;
			default: new Perishables(p); break;
		}
		return p;
	}
	
	@RequestMapping("/create")
	public ModelAndView createProduct(@ModelAttribute("perishable") Perishables p, @RequestParam("itemsPerPack") String items, @RequestParam("p_img") MultipartFile[] files) {
		ModelAndView mv = new ModelAndView();
		Perishables pro;
		pro = saveCorrectObject(p.getType(), Float.parseFloat(items), p);

		//		Save the image
		StringBuilder fileNames = new StringBuilder();
		String fileName = "" + pro.getId() + ".png";
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
		
		mv.setViewName("redirect:/admin/dashboard");
		return mv;
	}
	
	@RequestMapping("/delete")
	public ModelAndView delete(HttpServletRequest request, @RequestParam("id") Long id) {
		ModelAndView mv = new ModelAndView();
		HttpSession session = request.getSession();
		User u = (User)session.getAttribute("user");
		if(u == null) {
			mv.setViewName("redirect:/");
			return mv;
		} else {
			pDao.deleteById(id);
			mv.addObject("admin", u);
			mv.setViewName("redirect:/admin/dashboard");
		}
		return mv;
	}
}
