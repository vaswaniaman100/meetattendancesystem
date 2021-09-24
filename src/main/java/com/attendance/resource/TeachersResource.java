package com.attendance.resource;

import javax.annotation.Resource;

import org.springframework.data.jpa.repository.JpaRepository;

import com.attendance.model.Subjects;
import com.attendance.model.Teachers;

@Resource
public interface TeachersResource extends JpaRepository<Teachers, Integer>  {
		
}
