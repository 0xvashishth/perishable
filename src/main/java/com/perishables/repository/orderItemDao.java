package com.perishables.repository;

import java.util.HashSet;
import java.util.List;
import java.util.Set;

import org.hibernate.Criteria;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.criterion.Restrictions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.perishables.model.Perishables;
import com.perishables.model.Product;
import com.perishables.model.orderItems;
import com.perishables.model.orders;

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
	
	public List<orderItems> filter(orders o) {
		Session session = sf.openSession();
		session.beginTransaction();
		
		Criteria cr = session.createCriteria(orderItems.class);
		cr.add(Restrictions.eq("orders", o));
		List<orderItems> odr_list = cr.list();
		
		session.getTransaction().commit();
		session.close();
		return odr_list;
	}
}