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

import com.perishables.model.Customer;
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
}
