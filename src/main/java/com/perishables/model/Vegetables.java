package com.perishables.model;

import javax.persistence.Entity;
import javax.persistence.Table;

@Entity
@Table(name="VEGETABLES")
public class Vegetables extends Perishables {
	private int itemsPerPack;
	
	public Vegetables() {}
	
	public Vegetables(Perishables p) { super(p); }

	public int getItemsPerPack() {
		return itemsPerPack;
	}

	public void setItemsPerPack(int itemsPerPack) {
		this.itemsPerPack = itemsPerPack;
	}
}