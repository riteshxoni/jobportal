package com.jobportal.service;

import java.util.ArrayList;
import java.util.List;

import com.jobportal.dao.ApplicationDAO;
import com.jobportal.model.Application;

public class ApplicationService 
{
	ApplicationDAO dao;

	public ApplicationService() {
		dao = new ApplicationDAO();
	}
	
	public void addAppliation(Application application)
	{
		dao.add(application);
	}
	
	public List<Application> getAllApplications(String email)
	{
		List<Object> list = dao.getAll(email);
		List<Application> applications = new ArrayList<Application>();
		for(Object obj : list)
		{
			applications.add((Application)obj);
		}
		return applications;
	}
	
	public List<Application> getApplications(int id)
	{
		List<Object> list = dao.getAllApplications(id);
		List<Application> applications = new ArrayList<Application>();
		for(Object obj : list)
		{
			applications.add((Application)obj);
		}
		return applications;
	}
	
	public void updateApplication(Application application)
	{
		dao.update(application);
	}
}
