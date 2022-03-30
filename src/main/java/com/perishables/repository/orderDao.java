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
	
	public void deleteById(Long id) {
		Session session = sf.openSession();
		session.beginTransaction();
		orders o = (orders)session.get(orders.class, id);
		if(o == null)
			return;
		session.delete(o);
		session.getTransaction().commit();
		session.close();
		return ;
	}

	public Set<orders> find(String search, int len) {
		Session session = sf.openSession();
		session.beginTransaction();

//		Search the product by type
		Criteria crE = session.createCriteria(orders.class);
		crE.setMaxResults(len);
		
		if(search != null && !search.equals("")) {
			crE.add(Restrictions.ilike("customer.name", "%" + search + "%"));
		}
		
		List<orders> o_list = crE.list();
		Set<orders> o_set = new HashSet<orders>();
		for(orders c: o_list)
			o_set.add(c);
		
		return o_set;
	}
}
