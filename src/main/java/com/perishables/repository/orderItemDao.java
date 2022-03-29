package com.perishables.repository;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.perishables.model.orderItems;

@Repository
public class orderItemDao {
	@Autowired
	private SessionFactory sf;
	
	public Long save(orderItems s) {
		Session session = sf.openSession();
		session.beginTransaction();
		Long id = (Long)session.save(s);
		session.getTransaction().commit();
		session.close();
		return id;
	}
}