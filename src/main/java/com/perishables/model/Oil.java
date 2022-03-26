package com.perishables.model;

import javax.persistence.Entity;
import javax.persistence.Table;

@Entity
@Table(name="OIL")
public class Oil extends Perishables {
	private float millilitresPerItem;

	public float getMillilitresPerItem() {
		return millilitresPerItem;
	}

	public void setMillilitresPerItem(float millilitresPerItem) {
		this.millilitresPerItem = millilitresPerItem;
	}
}