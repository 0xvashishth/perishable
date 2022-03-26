package com.perishables.model;

import javax.persistence.Entity;
import javax.persistence.Table;

@Entity
@Table(name="FRUITS")
public class Fruits extends Perishables {
	private int itemsPerPack;
	
	public int getItemsPerPack() {
		return itemsPerPack;
	}

	public void setItemsPerPack(int itemsPerPack) {
		this.itemsPerPack = itemsPerPack;
	}
}
