package com.attendance.model;

import java.sql.Timestamp;

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
	Timestamp dateoflec;	
	
	@Column(name = "classname")
	String classname;
	
	@Column(name = "subject")
	String subject;
	
	Lectures(){}
	
	public Lectures( String lecturecomments, String teachername, Timestamp dateoflec, String classname,
			String subject) {
	
		this.lecturecomments = lecturecomments;
		this.teachername = teachername;
		this.dateoflec = dateoflec;
		this.classname = classname;
		this.subject = subject;
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

	public Timestamp getDateoflec() {
		return dateoflec;
	}

	public void setDateoflec(Timestamp dateoflec) {
		this.dateoflec = dateoflec;
	}

	public String getClassname() {
		return classname;
	}

	public void setClassname(String classname) {
		this.classname = classname;
	}

	public String getSubject() {
		return subject;
	}

	public void setSubject(String subject) {
		subject = subject;
	}

	@Override
	public String toString() {
		return "Lectures [lectureid=" + lectureid + ", lecturecomments=" + lecturecomments + ", teachername="
				+ teachername + ", dateoflec=" + dateoflec + ", classname=" + classname + ", subject=" + subject + "]";
	}
	

}
