package com.attendance.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.attendance.model.Classname;
import com.attendance.model.Subjects;
import com.attendance.model.Teachers;
import com.attendance.service.AdminService;

import javassist.bytecode.stackmap.TypeData.ClassName;

@Controller
public class AdminController {
	HttpSession session;
	private String u = "mcaadmin";
	private String p = "1234";

	@Autowired
	AdminService adminservice;

	@RequestMapping("/adminhome")
	public ModelAndView adminhome(HttpServletRequest request) {
		ModelAndView mv = new ModelAndView();
		String username = null, password = null;
		session = request.getSession();
		try {
			username = session.getAttribute("username").toString();
			password = session.getAttribute("password").toString();
		} catch (Exception e) {
		}

		if (username == null && password == null) {
			return new ModelAndView("redirect:/");
		} else if (!username.equals(u) && !password.equals(p)) {

			return new ModelAndView("redirect:/");

		} else {

			List<Teachers> listteachers = adminservice.getTeachersList();
			List<Subjects> listsubject = adminservice.getSubjectsList();
			List<Classname> listclass = adminservice.getClassList();

			mv.setViewName("view/home.jsp");
			mv.addObject("listteachers", listteachers);
			mv.addObject("listsubject", listsubject);
			mv.addObject("listclass", listclass);
		}

		return mv;
	}

	public void createTeacherView() {

	}

}
