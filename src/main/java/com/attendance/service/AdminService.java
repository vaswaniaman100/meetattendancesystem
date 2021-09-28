package com.attendance.service;

import java.util.List;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Sort;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Service;

import com.attendance.model.Classname;
import com.attendance.model.LectureAttendance;
import com.attendance.model.Lectures;
import com.attendance.model.Subjects;
import com.attendance.model.Teachers;
import com.attendance.resource.ClassnameResource;
import com.attendance.resource.LectureAttendanceResource;
import com.attendance.resource.LecturesRepository;
import com.attendance.resource.SubjectsResource;
import com.attendance.resource.TeachersResource;

@Service
public class AdminService {
	
	@Autowired
	TeachersResource teacherresource;
	
	@Autowired
	SubjectsResource subjectresource;
	
	@Autowired
	ClassnameResource classresource;
	
	@Autowired
	LecturesRepository lrepo;
	
	@Autowired
	LectureAttendanceResource larepo;
	
	
	public List<Teachers> getTeachersList(){
		
		return teacherresource.findAll(Sort.by(Sort.Direction.DESC,"id"));
	}
	public List<Subjects> getSubjectsList(){
		
		return subjectresource.findAll(Sort.by(Sort.Direction.DESC,"id"));
	}
	
	public List<Classname> getClassList(){
		
		return classresource.findAll(Sort.by(Sort.Direction.DESC,"id"));
	}
	
	public void addTeacher(String name,String password) {
		Teachers teacher = new Teachers();
		teacher.setName(name);
		teacher.setPassword(password);
		teacherresource.save(teacher);
		
	}
	public void addSubject(String name) {
		Subjects subject = new Subjects();
		subject.setSubjectname(name);
		subjectresource.save(subject);
		
	}
	public void addClassname(String name) {
		Classname classname = new Classname();
		classname.setName(name);
		classresource.save(classname);
		
	}
	public int deleteTeacher(int id) {
		boolean data =teacherresource.existsById(id);
		if(data) {
			teacherresource.deleteById(id);
			return 0;
		}
		else {
			return 1;
		}
		
	}
	
	public int deleteSubject(int id) {
		boolean data =subjectresource.existsById(id);
		if(data) {
			subjectresource.deleteById(id);
			return 0;
		}
		else {
			return 1;
		}
		
	}
	
	public int deleteClass(int id) {
		boolean data =classresource.existsById(id);
		if(data) {
			classresource.deleteById(id);
			return 0;
		}
		else {
			return 1;
		}
		
	}
	public  void saveLecture(Lectures l) {
		lrepo.save(l);
	}
	@Transactional
	public  void saveLectureAttendance(int lecid, List<String> arr) {
		for(String a:arr) {
			larepo.saveAndFlush(new LectureAttendance(lecid,a));
		}
	}
	
	
	
}
