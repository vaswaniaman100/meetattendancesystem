package com.attendance.model;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name = "lectureattendance")
public class LectureAttendance {
	@Id
	@Column(name = "lectureid")
	int lectureid;
	
	@Column(name = "studentname")
	String studentname;

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

}
