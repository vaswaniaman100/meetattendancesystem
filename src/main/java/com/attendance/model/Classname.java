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
	String name;

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public Classname(int id, String name) {
		super();
		this.id = id;
		this.name = name;
	}
	
	public Classname() {
		
	}
}
