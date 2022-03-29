package com.perishables.model;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToOne;
import javax.persistence.Table;

@Entity
@Table(name="ORDER_ITEMS")
public class orderItems {
	@Id
	@GeneratedValue(strategy=GenerationType.AUTO)
	private Long id;
	@ManyToOne(cascade = CascadeType.ALL)
	private orders orders;
	@OneToOne(cascade = CascadeType.ALL)
	@JoinColumn(name = "p_id", referencedColumnName="p_id", unique = true)
	private Product product;
	private int quantity;
	public Long getId() {
		return id;
	}
	public void setId(Long id) {
		this.id = id;
	}
	public orders getOrders() {
		return orders;
	}
	public void setOrders(orders orders) {
		this.orders = orders;
	}
	public Product getProduct() {
		return product;
	}
	public void setProduct(Product product) {
		this.product = product;
	}
	public int getQuantity() {
		return quantity;
	}
	public void setQuantity(int quantity) {
		this.quantity = quantity;
	}
	public orderItems(Long id, com.perishables.model.orders orders, Product product, int quantity) {
		super();
		this.id = id;
		this.orders = orders;
		this.product = product;
		this.quantity = quantity;
	}
	public orderItems() {
		// TODO Auto-generated constructor stub
	}

}
