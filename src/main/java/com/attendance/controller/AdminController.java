package com.attendance.controller;

import java.sql.SQLIntegrityConstraintViolationException;
import java.sql.Timestamp;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataIntegrityViolationException;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestAttribute;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.attendance.credentials.AdminCredentials;
import com.attendance.model.Classname;
import com.attendance.model.LectureAttendance;
import com.attendance.model.Lectures;
import com.attendance.model.Subjects;
import com.attendance.model.Teachers;
import com.attendance.resource.LecturesRepository;
import com.attendance.resource.TeachersResource;
import com.attendance.service.AdminService;
import com.attendance.service.TeacherService;
import com.fasterxml.jackson.annotation.JsonCreator.Mode;
import com.fasterxml.jackson.databind.ObjectMapper;

import javassist.bytecode.stackmap.TypeData.ClassName;

@Controller
public class AdminController {
	
	@Autowired
	LecturesRepository lrepo;
	
	@Autowired
	TeacherService teacherService;
	
	@Autowired
	TeachersResource tr;
	int globalvar =26;
	
	HttpSession session;
	AdminCredentials admincred = new AdminCredentials();
	private String u = admincred.getUsername();
	private String p = admincred.getPassword();

	@Autowired
	AdminService adminservice;
	
	ArrayList<String> arr1;
	
	@RequestMapping("/header")
	public ModelAndView header(){
		ModelAndView mv = new ModelAndView();
		mv.setViewName("view/header.jsp");
		return mv;
	}
	
	@RequestMapping("/footer")
	public ModelAndView footer(){
		ModelAndView mv = new ModelAndView();
		mv.setViewName("view/footer.jsp");
		return mv;
	}
	
	@RequestMapping("/teacherheader")
	public ModelAndView teacherheader(){
		ModelAndView mv = new ModelAndView();
		mv.setViewName("view/teacherheader.jsp");
		return mv;
	}

	@RequestMapping("/adminhome")
	public ModelAndView adminhome(HttpServletRequest request) {
		ModelAndView mv = new ModelAndView();
		String username = null, password = null;
		session = request.getSession();
		try {
			username = session.getAttribute("username").toString();
			password = session.getAttribute("password").toString();
		} catch (Exception e) {
//			e.printStackTrace();
		}

		if (username == null && password == null) {
			mv.setViewName("index.jsp");
			return mv;
		} else if (!username.equals(u) && !password.equals(p)) {

			return new ModelAndView("redirect:/teacherhome");

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

				mv.addObject("listclass", listclass);
				
				mv.setViewName("view/addclassname.jsp");
				
			}
			
			return mv;
			
		}
	
		// delete teacher get and post view
		@RequestMapping(path = "/deleteteacher")
		public ModelAndView deleteTeacherView(HttpServletRequest request, @RequestParam( required = false,name = "tid") String id )  {
			
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
						
						int a = adminservice.deleteTeacher(Integer.parseInt(id));
						if(a==0) {					
							mv.addObject("alertdata", "successdelete");
						}
						else {
							mv.addObject("alertdata", "notexist");
						}
									
					}
					catch(Exception e) {
						e.printStackTrace();
					}							
				}
				
				List<Teachers> listteachers = adminservice.getTeachersList();
				mv.addObject("listteachers", listteachers);
				mv.setViewName("view/deleteteacher.jsp");
			
			}

			return mv;
		
		}
		
		
		
		@RequestMapping(path = "/deletesubject")
		public ModelAndView deleteSubjectView(HttpServletRequest request, @RequestParam( required = false,name = "sid") String id )  {
			
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
						
						int a = adminservice.deleteSubject(Integer.parseInt(id));
						if(a==0) {					
							mv.addObject("alertdata", "successdelete");
						}
						else {
							mv.addObject("alertdata", "notexist");
						}
						
					}
					catch(Exception e) {
						e.printStackTrace();
					}							
				}
				List<Subjects> listsubject = adminservice.getSubjectsList();
				mv.addObject("listsubject", listsubject);
				mv.setViewName("view/deletesubject.jsp");
				
			}
			
			return mv;
			
		}
	
	
		@RequestMapping(path = "/deleteclassname")
		public ModelAndView deleteClassnameView(HttpServletRequest request, @RequestParam( required = false,name = "cid") String id )  {
			
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
						
						int a = adminservice.deleteClass(Integer.parseInt(id));
						if(a==0) {					
							mv.addObject("alertdata", "successdelete");
						}
						else {
							mv.addObject("alertdata", "notexist");
						}
						
					}
					catch(Exception e) {
						e.printStackTrace();
					}							
				}
				List<Classname> listclass = adminservice.getClassList();

				mv.addObject("listclass", listclass);
				mv.setViewName("view/deleteclassname.jsp");
				
			}
			
			return mv;
			
		}
		
		@RequestMapping("/saveattendance")
		public ModelAndView saveAttendance(HttpServletRequest request, @RequestParam(name = "name",required = false)ArrayList<String> arr) {
			
			
			arr1=arr;
			
			if(arr1==null) {
				return new ModelAndView("redirect:/");
			}
			
			ModelAndView mv = new ModelAndView();
			List<Teachers> listteachers = adminservice.getTeachersList();
			List<Subjects> listsubject = adminservice.getSubjectsList();
			List<Classname> listclass = adminservice.getClassList();

			
			mv.addObject("listteachers", listteachers);
			mv.addObject("listsubject", listsubject);
			mv.addObject("listclass", listclass);
		
			mv.setViewName("view/saveattendance.jsp");
			return mv;
		}
		
		@RequestMapping("/saveattendance1")
		public ModelAndView saveAttendance1(HttpServletRequest request, @RequestParam(name = "name",required = false)ArrayList<String> arr) {
			ModelAndView mv = new ModelAndView();
			String comments,tname,password,classname,subject;


			if(request.getMethod().equals("POST")) {
				//id
				comments = request.getParameter("comment");
				tname = request.getParameter("teachername");
				password = request.getParameter("password");//extra
				classname = request.getParameter("classname");
				subject = request.getParameter("subject");
				//date and time
				System.out.println(subject);
				Teachers teacher = teacherService.validateTeacher(tname, password);
				if (teacher != null && tname.equals(teacher.getName()) && password.equals(teacher.getPassword())) {
					
					
					Date date = new Date();
					Timestamp ts = new Timestamp(date.getTime());
					Lectures l = new Lectures( comments, tname, ts, classname, subject);
					System.out.println(subject);
					adminservice.saveLecture(l);
					Lectures la =lrepo.getLastLecture();
					LectureAttendance lecatt =new LectureAttendance();
					adminservice.saveLectureAttendance(la.getLectureid(), arr1);
					
					
					return new ModelAndView("redirect:/success");

				}
				else {
					mv.addObject("faillogin", "itd");
					mv.setViewName("index.jsp");
					return mv;
				}
				
			}
			arr1=null;
			if(arr1==null) {
				return new ModelAndView("redirect:/");
			}
			
//			mv.addObject("listarr", json);
			mv.setViewName("view/saveattendance.jsp");
			return mv;
		}
		
		@RequestMapping("/success")
		public ModelAndView success() {
			ModelAndView mv = new ModelAndView();
			mv.setViewName("view/success.jsp");
			return mv;
			
		}
					
	@RequestMapping(path = "/logout")
	public ModelAndView logout(HttpServletRequest request) {
		request.getSession().removeAttribute("username");
		request.getSession().removeAttribute("password");
		return new ModelAndView("redirect:/");
	}

}
