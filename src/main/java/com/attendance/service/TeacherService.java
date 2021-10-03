package com.attendance.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.attendance.model.LectureAttendance;
import com.attendance.model.Lectures;
import com.attendance.model.Teachers;
import com.attendance.resource.LectureAttendanceResource;
import com.attendance.resource.LecturesRepository;
import com.attendance.resource.TeachersResource;

@Service
public class TeacherService {

	@Autowired
	TeachersResource teacherResource;
	
	@Autowired
	LecturesRepository lecturesRepository;
	
	@Autowired
	LectureAttendanceResource attendanceResource;
	
	public Teachers validateTeacher(String name,String password) {
		Teachers teacher = teacherResource.findByNameAndPassword(name, password);
		return teacher;
	}
	
	
	public List<Lectures> getLectures(String username) {
			return lecturesRepository.findByTeachername(username);
	}
	
	public List<LectureAttendance> getLecturesAttendance(int id ) {
		return attendanceResource.findByLectureid(id);
	}
	
	public Lectures getLecturesbyid(int id ) {
		return lecturesRepository.findByLectureid(id);
	}
	
	public List<Lectures> findlecturesbytcs(String name,String classname,String subject){
		return lecturesRepository.findByTeachernameAndClassnameAndSubject(name, classname, subject);
		
	}
	public List<LectureAttendance> getLectureAteendancebyList(List<Integer> id){
		return attendanceResource.findByLecturesbyids(id);
	}
	
	
	
}
