package com.attendance.resource;

import org.springframework.data.jpa.repository.JpaRepository;

import javax.annotation.Resource;

import com.attendance.model.LectureAttendance;
import com.attendance.model.Lectures;
@Resource
public interface LectureAttendanceResource  extends JpaRepository<LectureAttendance, Integer> {

}
