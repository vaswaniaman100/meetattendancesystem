package com.attendance.model;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name = "lectureattendance")
public class LectureAttendance {
	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	@Column(name = "id")
	int id;

	@Column(name = "lectureid")
	int lectureid;
	
	public LectureAttendance() {
		// TODO Auto-generated constructor stub
	}
	public LectureAttendance(int lectureid, String studentname) {
		
		this.lectureid = lectureid;
		this.studentname = studentname;
	}

	@Column(name = "studentname")
	String studentname;

	public int getId() {
		return id;
	}
	
	public void setId(int id) {
		this.id = id;
	}
	public int getLectureid() {
		return lectureid;
	}

	public void setLectureid(int lectureid) {
		this.lectureid = lectureid;
	}

	public String getStudentname() {
		return studentname;
	}

	public void setStudentname(String studentname) {
		this.studentname = studentname;
	}
	@Override
	public String toString() {
		return "LectureAttendance [id=" + id + ", lectureid=" + lectureid + ", studentname=" + studentname + "]";
	}
	

}
