package com.perishables.repository;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.perishables.model.orders;

@Repository
public class orderDao {
	@Autowired
	private SessionFactory sf;
	
	public Long save(orders s) {
		Session session = sf.openSession();
		session.beginTransaction();
		Long id = (Long)session.save(s);
		session.getTransaction().commit();
		session.close();
		return id;
	}
	
	public orders getById(Long id) {
		Session session = sf.openSession();
		session.beginTransaction();
		orders o = (orders)session.get(orders.class, id);
		session.getTransaction().commit();
		session.close();
		return o;
	}
}
