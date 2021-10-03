package com.attendance.model;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;


public class LectureAttendanceR {
	

	int lectureid;
	
	String studentname;
	public LectureAttendanceR() {
		// TODO Auto-generated constructor stub
	}
	public LectureAttendanceR(int lectureid, String studentname) {
		
		this.lectureid = lectureid;
		this.studentname = studentname;
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
		return "LectureAttendance [ lectureid=" + lectureid + ", studentname=" + studentname + "]";
	}
	   @Override
	public boolean equals(Object obj) {
        if (this == obj)
                return true;
        if (obj == null)
                return false;
        if (getClass() != obj.getClass())
                return false;
        LectureAttendanceR other = (LectureAttendanceR) obj;
        if (lectureid != other.lectureid)
                return false;
        if (studentname == null) {
                if (other.studentname != null)
                        return false;
        } else if (!studentname.equals(other.studentname))
                return false;
        return true;
}
	

}
