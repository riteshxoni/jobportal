package com.jobportal.service;

import java.util.ArrayList;
import java.util.List;

import com.jobportal.dao.JobPortalDAO;
import com.jobportal.dao.SkillDAO;
import com.jobportal.model.Skill;

public class SkillService {
	
	private JobPortalDAO dao;

	public SkillService() {
		dao = new SkillDAO();
	}
	
	public void addSkill(Skill skill)
	{
		dao.add(skill);
	}
	public List<Skill> getSkills(String email)
	{
		List<Object> list = dao.getAll(email);
		
		List<Skill> list2 = new ArrayList<Skill>();
		
		for(Object obj : list)
		{
			list2.add((Skill)obj);
		}
		return list2;
	}
	
	public void deleteSkill(Skill skill)
	{
		dao.delete(skill);
	}

}
