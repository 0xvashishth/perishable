package com.perishables.repository;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.perishables.model.Customer;

@Repository
public class CustomerDao {
	@Autowired
	private SessionFactory sf;
	
	public Long save(Customer c) {
		Session session = sf.openSession();
		session.beginTransaction();
		Long id = (Long)session.save(c);
		session.getTransaction().commit();
		session.close();
		return id;
	}
}
