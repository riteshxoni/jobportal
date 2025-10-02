package com.jobportal.service;

import com.jobportal.dao.EmployerDAO;
import com.jobportal.dao.JobPortalDAO;
import com.jobportal.model.Employer;

public class EmployerService 
{
	private JobPortalDAO dao;
	private EmployerDAO emp_dao;

	public EmployerService() {
		dao = new EmployerDAO();
		emp_dao = new EmployerDAO();
	}
	
	public void addEmployer(Employer emp)
	{
		dao.add(emp);
	}
	
	public Employer validate(String email,String password)
	{
		return emp_dao.validateEmployer(email, password);
	}
	
	public void uploadPhoto(String photo, String email)
	{
		emp_dao.uploadPhoto(photo, email);
	}
	 
	public void updateEmployer(Employer employer)
	{
		dao.update(employer);
	}
}
