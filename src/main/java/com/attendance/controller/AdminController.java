package com.attendance.controller;

import java.sql.SQLIntegrityConstraintViolationException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataIntegrityViolationException;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.attendance.credentials.AdminCredentials;
import com.attendance.model.Classname;
import com.attendance.model.Subjects;
import com.attendance.model.Teachers;
import com.attendance.service.AdminService;

import javassist.bytecode.stackmap.TypeData.ClassName;

@Controller
public class AdminController {
	HttpSession session;
	AdminCredentials admincred = new AdminCredentials();
	private String u = admincred.getUsername();
	private String p = admincred.getPassword();

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
	
	
	
	
	// add teacher get and post view
	@RequestMapping(path = "/addteacher")
	public ModelAndView createTeacherView(HttpServletRequest request, @RequestParam( required = false,name = "teachername") String tname,
			@RequestParam(required = false, name = "tpassword") String tpass )  {
		
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
			if(request.getMethod().equals("POST")) {
				try {						
					adminservice.addTeacher(tname, tpass);
					mv.addObject("alertdata", "successregister");
								
				}catch(DataIntegrityViolationException de) {
					mv.addObject("alertdata", "duplicate");
				}
				catch(Exception e) {
					e.printStackTrace();
				}							
			}
			
			List<Teachers> listteachers = adminservice.getTeachersList();
			mv.addObject("listteachers", listteachers);
			mv.setViewName("view/addteacher.jsp");
		
		}

		return mv;
	
	}
	

	
	// subject get and post view
		@RequestMapping(path = "/addsubject")
		public ModelAndView addSubjectView(HttpServletRequest request, @RequestParam( required = false,name = "sname") String sname ) {	
	
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
				if(request.getMethod().equals("POST")) {
					try {						
						adminservice.addSubject(sname);
						mv.addObject("alertdata", "successregister");
					}catch(DataIntegrityViolationException de) {
						mv.addObject("alertdata", "duplicate");
					}
					catch(Exception e) {
						e.printStackTrace();
					}	
				}
				List<Subjects> listsubject = adminservice.getSubjectsList();
				mv.addObject("listsubject", listsubject);
				mv.setViewName("view/addsubject.jsp");
			
			}

			return mv;
		
		}
		
		
		// class get and post view
		@RequestMapping(path = "/addclass")
		public ModelAndView addClassView(HttpServletRequest request, @RequestParam( required = false,name = "cname") String cname ) {	
			
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
				if(request.getMethod().equals("POST")) {
					try {						
						adminservice.addClassname(cname);
						mv.addObject("alertdata", "successregister");
					}catch(DataIntegrityViolationException de) {
						mv.addObject("alertdata", "duplicate");
					}
					catch(Exception e) {
						e.printStackTrace();
					}
					
				}
				
				List<Classname> listclass = adminservice.getClassList();
;
				mv.addObject("listclass", listclass);
				
				mv.setViewName("view/addclassname.jsp");
				
			}
			
			return mv;
			
		}
	
	
	
	
	
	
	
	@RequestMapping(path = "/logout")
	public ModelAndView logout(HttpServletRequest request) {
		request.getSession().removeAttribute("username");
		request.getSession().removeAttribute("password");
		return null;
	}

}
