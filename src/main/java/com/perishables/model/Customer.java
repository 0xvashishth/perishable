package com.perishables.model;

import java.time.LocalDate;
import java.util.List;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.Table;

import org.hibernate.annotations.OnDelete;
import org.hibernate.annotations.OnDeleteAction;

@Entity
@Table(name="CUSTOMERS")
public class Customer extends User {
	@Column(name="MobileNumber")
	private String mobNo;
	
	@Column(name="DateofBirth")
	private String dob;
	
	@Column(name="Address")
	private String address;
	
	@OneToMany(mappedBy = "customer")
	@OnDelete(action = OnDeleteAction.CASCADE)
	private List<orders> order;

	public List<orders> getOrder() {
		return order;
	}

	public void setOrder(List<orders> order) {
		this.order = order;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public String getmobNo() {
		return mobNo;
	}

	public void setmobNo(String mobNo) {
		this.mobNo = mobNo;
	}

	public String getDob() {
		return dob;
	}

	public void setDob(String dob) {
		this.dob = dob;
	}

	public Customer() {}
	
	public Customer(Customer c) {
		super(c.getId(), c.getName(), c.getEmail(), c.getPassword());
		this.mobNo = c.getmobNo();
		this.dob = c.getDob();
		this.address = c.getAddress();
	}
}