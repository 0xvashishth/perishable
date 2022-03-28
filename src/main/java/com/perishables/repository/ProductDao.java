package com.perishables.repository;

import java.util.ArrayList;
import java.util.HashSet;
import java.util.List;
import java.util.Set;
import java.util.TreeSet;

import org.hibernate.Criteria;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.criterion.Restrictions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.perishables.model.Perishables;
import com.perishables.model.Product;
import com.perishables.model.Product;
import com.perishables.model.User;

@Repository
public class ProductDao {
	@Autowired
	private SessionFactory sf;
	
	public Long save(Product p) {
		Session session = sf.openSession();
		session.beginTransaction();
		Long id = (Long)session.save(p);
		session.getTransaction().commit();
		session.close();
		return id;
	}
	
	public Set<Perishables> find(String search, int len) {
		Session session = sf.openSession();
		session.beginTransaction();

//		Search the product by type
		Criteria crE = session.createCriteria(Product.class);
		crE.setMaxResults(len);
		
		if(search != null && !search.equals("")) {
			crE.add(Restrictions.ilike("type", "%" + search + "%"));
		}
		
		List<Perishables> cust_list = crE.list();
		Set<Perishables> cust_set = new HashSet<Perishables>();
		for(Perishables c: cust_list)
			cust_set.add(c);
		
//		Search the product by name
		Criteria crN = session.createCriteria(Product.class);
		crN.setMaxResults(len);
		if(search != null && !search.equals("")) {
			crN.add(Restrictions.ilike("name", "%" + search + "%"));
		}
		
		List<Perishables> cust_list2 = crN.list();
		for(Perishables c: cust_list2)
			cust_set.add(c);
		
		session.getTransaction().commit();
		session.close();
		
		return cust_set;
	}

	public void deleteById(Long id) {
		Session session = sf.openSession();
		session.beginTransaction();
		
		Product p = (Product)session.get(Product.class, id);
		if (p == null)
			return;
		session.delete(p);
		
		session.getTransaction().commit();
		session.close();
	}
	
	public Set<Perishables> filter(String search, String type, int len) {
		Session session = sf.openSession();
		session.beginTransaction();

//		Search the product by type
		Criteria crE = session.createCriteria(Product.class);
		crE.setMaxResults(len);
		
		if((type + search) != null && !(type + search).equals("")) {
			if(type != null && !type.equals("") && !type.equals("All"))
				crE.add(Restrictions.ilike("type", "%" + type + "%"));
			if(search != null && !search.equals(""))
				crE.add(Restrictions.ilike("name", "%" + search + "%"));
		}
		
		List<Perishables> cust_list = crE.list();
		Set<Perishables> cust_set = new HashSet<Perishables>();
		for(Perishables c: cust_list)
			cust_set.add(c);
		
		session.getTransaction().commit();
		session.close();
		
		return cust_set;
	}
	
	public Perishables getById(Long id) {
		Session session = sf.openSession();
		session.beginTransaction();
		Perishables p = session.get(Perishables.class, id);
		session.getTransaction().commit();
		session.close();
		return p;
	}
}
