package com.attendance.model;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name = "subjects")
public class Subjects {
	@Id
	@Column(name = "id")
	private int id;
	
	@Column(name = "subjectname")
	private String subjectname;

	
	public Subjects() {
	}

	public Subjects(int id, String subjectname) {
		super();
		this.id = id;
		this.subjectname = subjectname;
	}
	
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getSubjectname() {
		return subjectname;
	}
	public void setSubjectname(String subjectname) {
		this.subjectname = subjectname;
	}

	
}
