package com.perishables.model;

import javax.persistence.Entity;
import javax.persistence.Table;

@Entity
@Table(name="MEAT")
public class Meat extends Perishables {
	private float gramsPerItem;
	
	public Meat() {
		super();
	}

	public Meat(Perishables p) { super(p); }

	public float getGramsPerItem() {
		return gramsPerItem;
	}

	public void setGramsPerItem(float gramsPerItem) {
		this.gramsPerItem = gramsPerItem;
	}
}