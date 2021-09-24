package com.attendance.resource;

import javax.annotation.Resource;

import org.springframework.data.jpa.repository.JpaRepository;

import com.attendance.model.Subjects;

@Resource
public interface SubjectsResource extends JpaRepository<Subjects, Integer>  {
		
}
