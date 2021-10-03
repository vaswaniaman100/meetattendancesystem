package com.attendance.resource;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import com.attendance.model.Classname;
import com.attendance.model.Lectures;
import com.attendance.model.Teachers;

@Resource
public interface LecturesRepository extends JpaRepository<Lectures, Integer>  {
	
	@Query(value = "select * from lectures order by lectureid DESC LIMIT 1" ,nativeQuery = true)
	public Lectures getLastLecture();
	
	List<Lectures> findByTeachername(String name);
	Lectures findByLectureid(int id);
	
	List<Lectures> findByTeachernameAndClassnameAndSubject(String tname,String sname,String cname );
	
}
