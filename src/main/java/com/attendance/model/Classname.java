package com.attendance.model;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;


@Entity
@Table(name = "classname")
public class Classname {
	@Id
	@Column(name= "id")
	int id;
	
	@Column(name= "name")
	int name;

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public int getName() {
		return name;
	}

	public void setName(int name) {
		this.name = name;
	}

	public Classname(int id, int name) {
		super();
		this.id = id;
		this.name = name;
	}
	
	
}
