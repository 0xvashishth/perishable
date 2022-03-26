package com.perishables.model;

import javax.persistence.Entity;
import javax.persistence.Table;

@Entity
@Table(name="DAIRY")
public class Dairy extends Perishables {
	private float millilitresPerItem;
	
	public Dairy() {
		super();
	}
	
	public Dairy(Perishables p) { super(p); }
	
	public float getMillilitresPerItem() {
		return millilitresPerItem;
	}

	public void setMillilitresPerItem(float millilitresPerItem) {
		this.millilitresPerItem = millilitresPerItem;
	}
}