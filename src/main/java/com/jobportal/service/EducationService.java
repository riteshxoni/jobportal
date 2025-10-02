package com.jobportal.service;

import java.util.ArrayList;
import java.util.List;

import com.jobportal.dao.EducationDAO;
import com.jobportal.dao.JobPortalDAO;
import com.jobportal.model.Education;

public class EducationService 
{
	JobPortalDAO dao;

	public EducationService() 
	{
		dao = new EducationDAO();
	}
	
	public void addEducation(Education education)
	{
		dao.add(education);
	}
	
	public List<Education> getEducations(String email)
	{
		List<Object> list = dao.getAll(email);
		
		List<Education> educationList = new ArrayList<Education>();
		
		for(Object obj : list)
		{
			educationList.add( (Education)obj );
		}
		return educationList;
	}
	
	public void updateEducation(Education education)
	{
		dao.update(education);
	}
	
	public void deleteEducation(Education education)
	{
		dao.delete(education);
	}
	
}
