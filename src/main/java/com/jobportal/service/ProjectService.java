package com.jobportal.service;

import java.util.ArrayList;
import java.util.List;

import com.jobportal.dao.JobPortalDAO;
import com.jobportal.dao.ProjectDAO;
import com.jobportal.model.Project;

public class ProjectService 
{
	JobPortalDAO dao;

	public ProjectService() {
		dao = new ProjectDAO();
	}
	
	public void addProject(Project project)
	{
		dao.add(project);
	}
	
	public List<Project> getProjects(String email)
	{
		List<Project> projects = new ArrayList<Project>();
		
		List<Object> list = dao.getAll(email);
		
		for(Object obj : list)
		{
			projects.add((Project)obj);
		}
		return projects;
	}
	
	public void updateProject(Project project)
	{
		dao.update(project);
	}
	
	public void deleteProject(Project project)
	{
		dao.delete(project);
	}
	
}

