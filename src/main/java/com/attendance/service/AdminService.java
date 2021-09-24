package com.attendance.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Sort;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Service;

import com.attendance.model.Classname;
import com.attendance.model.Subjects;
import com.attendance.model.Teachers;
import com.attendance.resource.ClassnameResource;
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
	
	public List<Teachers> getTeachersList(){
		
		return teacherresource.findAll(Sort.by(Sort.Direction.DESC,"id"));
	}
	public List<Subjects> getSubjectsList(){
		
		return subjectresource.findAll(Sort.by(Sort.Direction.DESC,"id"));
	}
	
	public List<Classname> getClassList(){
		
		return classresource.findAll(Sort.by(Sort.Direction.DESC,"id"));
	}
	
	
}
