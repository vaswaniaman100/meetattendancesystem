

package com.attendance.controller;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.websocket.Session;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.ViewResolver;

import com.attendance.credentials.AdminCredentials;

@Controller
public class FController {
	HttpSession session;
	AdminCredentials admincred = new AdminCredentials();
	private String u = admincred.getUsername();
	private String p = admincred.getPassword();
	
	@RequestMapping("/")
	public ModelAndView index() {
		ModelAndView mv = new ModelAndView();

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
		
		
		if (username == null && password == null) {
			mv.addObject("faillogin", "invalidlogin");
			mv.setViewName("index.jsp");
		} else if (username.equals(u) && password.equals(p)) {
			session.setAttribute("username", username);
			session.setAttribute("password", password);
			return new ModelAndView("redirect:/adminhome");

		} else {
			mv.addObject("faillogin", "faillogin");
			mv.setViewName("index.jsp");
		}

		return mv;

	}
	
}

//rest api template without Rest controller
