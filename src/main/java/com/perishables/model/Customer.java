package com.perishables.model;

import java.time.LocalDate;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name="CUSTOMERS")
public class Customer extends User {
	@Column(name="MobileNumber")
	private String mobNo;
	
	@Column(name="DateofBirth")
	private String dob;
	
	@Column(name="Address")
	private String address;

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