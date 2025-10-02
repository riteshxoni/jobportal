package com.jobportal.service;

import java.util.ArrayList;
import java.util.List;

import com.jobportal.dao.ExperienceDAO;
import com.jobportal.dao.JobPortalDAO;
import com.jobportal.model.Experience;

public class ExperienceService {
	JobPortalDAO dao;

	public ExperienceService() {
		dao = new ExperienceDAO();
	}
	
	public void addExperience(Experience experience)
	{
		dao.add(experience);
	}
	
	public List<Experience> getExperiences(String email)
	{
		List<Object> list = dao.getAll(email);
		List<Experience> experiences = new ArrayList<Experience>();
		for(Object obj : list)
		{
			experiences.add((Experience)obj);
		}
		return experiences;
	}
	
	public void updateExperience(Experience experience)
	{
		dao.update(experience);
	}
	public void deleteExperience(Experience experience)
	{
		dao.delete(experience);
	}
}
