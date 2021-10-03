package com.attendance.resource;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import java.util.List;

import javax.annotation.Resource;

import com.attendance.model.LectureAttendance;
import com.attendance.model.Lectures;
@Resource
public interface LectureAttendanceResource  extends JpaRepository<LectureAttendance, Integer> {
	List<LectureAttendance> findByLectureid(int id);
	
	@Query(value = "Select * from lectureattendance where lectureid in ?1",nativeQuery = true)
	List<LectureAttendance> findByLecturesbyids(List<Integer> id);
}
