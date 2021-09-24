package com.attendance.resource;

import javax.annotation.Resource;

import org.springframework.data.jpa.repository.JpaRepository;

import com.attendance.model.Classname;

@Resource
public interface ClassnameResource extends JpaRepository<Classname, Integer>  {
		
}
