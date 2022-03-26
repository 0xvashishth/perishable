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
import com.perishables.model.User;

@Repository
public class CustomerDao {
	@Autowired
	private SessionFactory sf;
	
	public Long save(User c) {
		Session session = sf.openSession();
		session.beginTransaction();
		Long id = (Long)session.save(c);
		session.getTransaction().commit();
		session.close();
		return id;
	}
	
	public User login(String email) {
		Session session = sf.openSession();
		session.beginTransaction();
		
//		Fetch the record based on email
		@SuppressWarnings("rawtypes")
		Query query = session.createQuery("FROM com.perishables.model.User WHERE email='" + email + "'");
		User c = null;
		@SuppressWarnings("deprecation")
		List<Customer> q = query.list();
		if(!q.isEmpty())
			c = q.get(0);
		
		if(c == null)
			return c;
		
		query = session.createQuery("FROM com.perishables.model." + c.getUserType() + " WHERE id='" + c.getId() + "'");
		c = null;
		@SuppressWarnings("deprecation")
		List<Customer> q2 = query.list();
		if(!q2.isEmpty())
			c = q.get(0);
		
		session.getTransaction().commit();
		session.close();
		return c;
	}
	
	public void delete(User c) {
		Session session = sf.openSession();
		session.beginTransaction();
		session.delete(c);
		session.getTransaction().commit();
		session.close();
	}
	
	public void deleteById(Long id) {
		Session session = sf.openSession();
		session.beginTransaction();
		
		User u = (User)session.get(User.class, id);
		if (u == null)
			return;
		session.delete(u);
		
		session.getTransaction().commit();
		session.close();
	}
	
	public void update(User c) {
		Session session = sf.openSession();
		session.beginTransaction();
		session.saveOrUpdate(c);
		session.getTransaction().commit();
		session.close();
	}
	
	public Set<Customer> find(String search, int len) {
		Session session = sf.openSession();
		session.beginTransaction();

//		Search the user by email
		Criteria crE = session.createCriteria(Customer.class);
		crE.setMaxResults(len);
		
		if(search != null && !search.equals("")) {
			crE.add(Restrictions.ilike("email", "%" + search + "%"));
		}
		
		List<Customer> cust_list = crE.list();
		Set<Customer> cust_set = new HashSet<Customer>();
		for(Customer c: cust_list)
			cust_set.add(c);
		
//		Search the user by name
		Criteria crN = session.createCriteria(Customer.class);
		crN.setMaxResults(len);
		if(search != null && !search.equals("")) {
			crN.add(Restrictions.ilike("name", "%" + search + "%"));
		}
		
		List<Customer> cust_list2 = crN.list();
		for(Customer c: cust_list2)
			cust_set.add(c);
		
		session.getTransaction().commit();
		session.close();
		
		return cust_set;
	}
}
