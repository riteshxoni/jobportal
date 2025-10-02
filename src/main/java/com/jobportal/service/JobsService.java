package com.jobportal.service;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import com.jobportal.dao.JobsDAO;
import com.jobportal.model.Job;

public class JobsService 
{
	JobsDAO dao;
	public JobsService() {
		dao = new JobsDAO();
	}
	
	public void addJob(Job job)
	{
		dao.add(job);
	}
	
	public List<Job> getJobs(String email)
	{
		List<Object> list = dao.getAll(email);
		
		List<Job> jobList = new ArrayList<Job>();
		
		for(Object obj : list)
		{
			jobList.add((Job)obj);
		}
		
		return jobList;
	}
	
	public void updateJob(Job job)
	{
		dao.update(job);
	}
	public void deleteJob(Job job)
	{
		dao.delete(job);
	}
	public Job getJob(int id)
	{
		return dao.getJob(id);
	}
	
	public void getAllJobs(HttpServletRequest req)
	{
		HttpSession session = req.getSession();
		List<Job> list = dao.getAllJobs();
		if(!list.isEmpty())
		{
			session.setAttribute("allJobs", list);
		}
		Map<Integer, String> names = dao.getCompanyNames();
		if(!names.isEmpty())
		{
			session.setAttribute("c_names", names);
		}
	}
	
	public Map<Integer, String> getTitles()
	{
		Map<Integer, String> titles = dao.getJobsTitles();
		return titles;
	}
}
