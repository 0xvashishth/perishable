package com.perishables.model;
import java.sql.Date;

import javax.persistence.CascadeType;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

@Entity
@Table(name="ORDERS")
public class orders {
	@Id
	@GeneratedValue(strategy=GenerationType.AUTO)
	private Long order_id;
	@ManyToOne(cascade = CascadeType.ALL)
	private Customer customer;
	private double total_price;
	private Date order_date;
	private String balanceStatus;
	
	public Long getOrder_id() {
		return order_id;
	}
	public void setOrder_id(Long order_id) {
		this.order_id = order_id;
	}
	public Customer getCustomer() {
		return customer;
	}
	public void setCustomer(Customer customer) {
		this.customer = customer;
	}
	public double getTotal_price() {
		return total_price;
	}
	public void setTotal_price(double total_price) {
		this.total_price = total_price;
	}
	public Date getOrder_date() {
		return order_date;
	}
	public void setOrder_date(Date order_date) {
		this.order_date = order_date;
	}
	public String getBalanceStatus() {
		return balanceStatus;
	}
	public void setBalanceStatus(String balanceStatus) {
		this.balanceStatus = balanceStatus;
	}
	public orders(Long order_id, Customer customer, double total_price, Date order_date, String balanceStatus) {
		super();
		this.order_id = order_id;
		this.customer = customer;
		this.total_price = total_price;
		this.order_date = order_date;
		this.balanceStatus = balanceStatus;
	}
}
