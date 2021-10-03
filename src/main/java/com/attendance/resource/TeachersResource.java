package com.attendance.resource;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.data.jpa.repository.JpaRepository;

import com.attendance.model.Subjects;
import com.attendance.model.Teachers;

@Resource
public interface TeachersResource extends JpaRepository<Teachers, Integer>  {
	Teachers findByNameAndPassword(String name, String password);

}
