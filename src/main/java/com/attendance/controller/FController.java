

package com.attendance.controller;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.websocket.Session;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.ViewResolver;

import com.attendance.credentials.AdminCredentials;
import com.attendance.model.Teachers;
import com.attendance.resource.TeachersResource;
import com.attendance.service.TeacherService;

@Controller
public class FController {
	
	@Autowired
	TeacherService teacherService;
	HttpSession session;
	AdminCredentials admincred = new AdminCredentials();
	private String u = admincred.getUsername();
	private String p = admincred.getPassword();
	
	@RequestMapping("/")
	public ModelAndView index(HttpServletRequest request) {
		session=request.getSession();
		ModelAndView mv = new ModelAndView();
		String username =null ,password =null;
		try {
			username = session.getAttribute("username").toString();
			password = session.getAttribute("password").toString();
		} catch (Exception e) {
//			e.printStackTrace();
		}
		
		Teachers teacher = teacherService.validateTeacher(username, password);
		
		if (username == null && password == null) {
			mv.setViewName("index.jsp");
			return mv;
		} else if(username.equals(u) && password.equals(p)) {
			
			return new ModelAndView("redirect:/adminhome");

		}
		else if (teacher != null && username.equals(teacher.getName()) && password.equals(teacher.getPassword())) {
	
			return new ModelAndView("redirect:/teacherhome");
			
		} else {

			mv.setViewName("index.jsp");
			
		}
		
		if (!username.equals(u) && !password.equals(p)) {

			mv.setViewName("index.jsp");
			return mv;
		}

		mv.setViewName("index.jsp");
		return mv;

	}

	@RequestMapping("/login")
	public ModelAndView login(@RequestParam(name = "username",defaultValue = "null") String username ,
			@RequestParam(name = "pass",defaultValue = "null") String password, HttpServletRequest request) {
		ModelAndView mv = new ModelAndView();
		session = request.getSession();
		if(session.getAttribute("username")== null  && 
				session.getAttribute("password") == null) {
			System.out.println("null is value what to do");
		}
		else if(session.getAttribute("username").toString().equals(u) && 
				session.getAttribute("password").toString().equals(p)) {
			username = u;
			password =p;
			System.out.println(username);
		}
		
		Teachers teacher = teacherService.validateTeacher(username, password);
		if (username == null && password == null) {
			mv.addObject("faillogin", "invalidlogin");
			mv.setViewName("index.jsp");
		} else if (username.equals(u) && password.equals(p)) {
			session.setAttribute("username", username);
			session.setAttribute("password", password);
			return new ModelAndView("redirect:/adminhome");

		}else if(teacher != null && username.equals(teacher.getName()) && password.equals(teacher.getPassword())) {
			session.setAttribute("username", username);
			session.setAttribute("password", password);
			return new ModelAndView("redirect:/teacherhome");
		} 
		
		else {
			mv.addObject("faillogin", "faillogin");
			mv.setViewName("index.jsp");
		}

		return mv;

	}
	
}

//rest api template without Rest controller
