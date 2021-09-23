package com.attendance.model;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;


@Entity
@Table(name = "lectures")
public class Lectures {
	@Id
	@Column(name = "lectureid")
	int lectureid;
	
	@Column(name = "lecturecomments")
	String lecturecomments;
		
	@Column(name = "teachername")
	String teachername;
		
	@Column(name = "dateoflec")
	String dateoflec;	
	
	@Column(name = "classname")
	String classname;
	
	@Column(name = "Subject")
	String Subject;
	
	public Lectures(int lectureid, String lecturecomments, String teachername, String dateoflec, String classname,
			String subject) {
		super();
		this.lectureid = lectureid;
		this.lecturecomments = lecturecomments;
		this.teachername = teachername;
		this.dateoflec = dateoflec;
		this.classname = classname;
		Subject = subject;
	}

	public int getLectureid() {
		return lectureid;
	}

	public void setLectureid(int lectureid) {
		this.lectureid = lectureid;
	}

	public String getLecturecomments() {
		return lecturecomments;
	}

	public void setLecturecomments(String lecturecomments) {
		this.lecturecomments = lecturecomments;
	}

	public String getTeachername() {
		return teachername;
	}

	public void setTeachername(String teachername) {
		this.teachername = teachername;
	}

	public String getDateoflec() {
		return dateoflec;
	}

	public void setDateoflec(String dateoflec) {
		this.dateoflec = dateoflec;
	}

	public String getClassname() {
		return classname;
	}

	public void setClassname(String classname) {
		this.classname = classname;
	}

	public String getSubject() {
		return Subject;
	}

	public void setSubject(String subject) {
		Subject = subject;
	}

	
	

}
