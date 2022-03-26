package com.perishables.model;

import javax.persistence.Entity;
import javax.persistence.Table;

@Entity
@Table(name="PERISHABLES")
public class Perishables extends Product {
	private String bestBefore;

	public String getBestBefore() {
		return bestBefore;
	}

	public void setBestBefore(String bestBefore) {
		this.bestBefore = bestBefore;
	}

	public Perishables(Long id, String name, String description, float price, float discount, String type, int quantity,
			String bestBefore) {
		super(id, name, description, price, discount, type, quantity);
		this.bestBefore = bestBefore;
	}
	
	public Perishables() {
		super();
	}
}
