package com.attendance.service;

import org.springframework.jdbc.core.JdbcTemplate;

public class AdminService {
	JdbcTemplate jdbctemplate;
	public void setJdbcTemplate(JdbcTemplate jdbctemplate) {
		this.jdbctemplate = jdbctemplate;
	}
	public void getteachers() {
		String sql = "Select * from ";
	}
}
