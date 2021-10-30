package com.attendance.controller;

import java.sql.Timestamp;
import java.util.Arrays;
import java.util.List;
import java.util.stream.Collectors;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.config.MvcNamespaceHandler;

import com.attendance.credentials.AdminCredentials;
import com.attendance.model.Classname;
import com.attendance.model.LectureAttendance;
import com.attendance.model.Lectures;
import com.attendance.model.Subjects;
import com.attendance.model.Teachers;
import com.attendance.resource.LectureAttendanceResource;
import com.attendance.service.AdminService;
import com.attendance.service.TeacherService;

@Controller
public class TeacherController {

	@Autowired
	TeacherService teacherService;
	
	@Autowired
	AdminService adminService;

	HttpSession session;
	
	AdminCredentials admincred = new AdminCredentials();
	private String u = admincred.getUsername();
	private String p = admincred.getPassword();
	
	@Autowired
	LectureAttendanceResource attendanceResource;
	
	@RequestMapping(value = "/teacherhome")
	public ModelAndView teacherHome(HttpServletRequest request) {
		
		
		List<Integer> tempid = Arrays.asList(new Integer[]{46,49});
	//	System.out.println( attendanceResource.findByLecturesbyids(tempid));
		
		
		
		
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
			request.getSession().removeAttribute("username");
			request.getSession().removeAttribute("password");
			System.out.println("hello");
			mv.setViewName("index.jsp");
			return mv;
		} else if (teacher != null && username.equals(teacher.getName()) && password.equals(teacher.getPassword())) {
			
	
			mv.addObject("lectureslist",teacherService.getLectures(username));
			mv.addObject("teachername",username);
			mv.setViewName("view/teacherhome.jsp");
			return mv;

		}else if (!username.equals(u) && !password.equals(p)) {
			request.getSession().removeAttribute("username");
			request.getSession().removeAttribute("password");
//System.out.println("hello");
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
	
	@RequestMapping(value = "/report")
	public ModelAndView report( HttpServletRequest request) {
		
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
			if(request.getMethod().equals("POST")) {
				String teachername = username;
				String subject = request.getParameter("subject");
				String classname = request.getParameter("classname");
				//System.out.println(teachername+" "+subject+" "+classname);
				//get lecture by teachername subject classname
				List<Lectures> listlectures = teacherService.findlecturesbytcs(teachername, classname, subject);
				//System.out.println(listlectures);
				//remove and store lecture id from listlectures  //complete
				List<Integer> listoflecid= listlectures.stream().map(m->m.getLectureid()).collect(Collectors.toList());
				// get attendance of relevant ids          //complete
				List<LectureAttendance> attendance= teacherService.getLectureAteendancebyList(listoflecid);
				
				List<Timestamp> datelist = listlectures.stream().map(m->m.getDateoflec()).collect(Collectors.toList());
				
				// getting students name            //complete
				//List<String> studentsname = attendanceResource.findAll().stream().map(LectureAttendance::getStudentname).distinct().collect(Collectors.toList());
				
				mv.addObject("listoflecid",listoflecid);
				mv.addObject("attendance",attendance);
				//mv.addObject("studentsname",studentsname);
				mv.addObject("datelist",datelist);
				mv.setViewName("view/reporttable.jsp");
				return mv;
			}
			List<Subjects> listsub = adminService.getSubjectsList();
			List<Classname> listclass = adminService.getClassList();
			mv.addObject("listsub",listsub);
			mv.addObject("listclass",listclass);
			mv.setViewName("view/report.jsp");
				
		} else {
			
			return new ModelAndView("redirect:/");
		}
		
		return mv;
	}
	
	
	
	
	
	
	
}
