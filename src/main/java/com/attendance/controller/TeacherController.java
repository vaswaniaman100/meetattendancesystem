package com.attendance.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.config.MvcNamespaceHandler;

import com.attendance.model.Classname;
import com.attendance.model.LectureAttendance;
import com.attendance.model.Lectures;
import com.attendance.model.Subjects;
import com.attendance.model.Teachers;
import com.attendance.service.TeacherService;

@Controller
public class TeacherController {

	@Autowired
	TeacherService teacherService;

	HttpSession session;
	
	@RequestMapping(value = "/teacherhome")
	public ModelAndView teacherHome(HttpServletRequest request) {
		ModelAndView mv = new ModelAndView();
		String username = null, password = null;

		session = request.getSession();
		try {
			username = session.getAttribute("username").toString();
			password = session.getAttribute("password").toString();
		} catch (Exception e) {
		}
		Teachers teacher = teacherService.validateTeacher(username, password);

		if (username == null && password == null) {
			return new ModelAndView("redirect:/");
		} else if (teacher != null && username.equals(teacher.getName()) && password.equals(teacher.getPassword())) {
			
	
			mv.addObject("lectureslist",teacherService.getLectures(username));
			mv.addObject("teachername",username);
			mv.setViewName("view/teacherhome.jsp");

		} else {

			return new ModelAndView("redirect:/");
		}

		return mv;
	}
	
	@RequestMapping(value = "/attendance/{id}")
	public ModelAndView attendancelist(@PathVariable String id,  HttpServletRequest request) {
		int id1 = Integer.parseInt(id);
		ModelAndView mv = new ModelAndView();
		String username = null, password = null;
		
		session = request.getSession();
		try {
			username = session.getAttribute("username").toString();
			password = session.getAttribute("password").toString();
		} catch (Exception e) {
		}
		Teachers teacher = teacherService.validateTeacher(username, password);
		
		if (username == null && password == null) {
			return new ModelAndView("redirect:/");
		} else if (teacher != null && username.equals(teacher.getName()) && password.equals(teacher.getPassword())) {
			Lectures li =teacherService.getLecturesbyid(id1);
			String teachername = li.getTeachername();
			if(username.equals(teachername)) {
				mv.addObject("listattendance",teacherService.getLecturesAttendance(id1));
				mv.setViewName("view/attendance.jsp");
				
				
			}
			else {
				return new ModelAndView("redirect:/");
			}
		} else {
			
			return new ModelAndView("redirect:/");
		}
		
		return mv;
	}
	
	
	
	
	
}
