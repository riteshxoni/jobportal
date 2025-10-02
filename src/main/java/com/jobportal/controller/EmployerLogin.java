package com.jobportal.controller;

import java.io.IOException;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.jobportal.model.Application;
import com.jobportal.model.Employer;
import com.jobportal.model.Job;
import com.jobportal.service.ApplicationService;
import com.jobportal.service.EmployerService;
import com.jobportal.service.JobsService;

@WebServlet("/EmployerLogin")
public class EmployerLogin extends HttpServlet
{
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String email = req.getParameter("email");
		String password = req.getParameter("password");
		
		EmployerService service = new EmployerService();		
		Employer emp = service.validate(email, password);
		
		HttpSession session = req.getSession();
		
		if(emp != null)
		{
			session.setAttribute("currentEmployer", emp);
			
			JobsService jobService = new JobsService();
			List<Job> jobList = jobService.getJobs(email);
			if(!jobList.isEmpty())
			{
				session.setAttribute("jobs", jobList);
			}
			
			Map<Integer, String> jobTitles = jobService.getTitles();
			if(!jobTitles.isEmpty())
			{
				session.setAttribute("titles", jobTitles);
			}
			
			ApplicationService applicationService = new ApplicationService();
			List<Application> applications = applicationService.getApplications(emp.getId());
			if(!applications.isEmpty())
			{
				session.setAttribute("applications", applications);
			}
			
			resp.sendRedirect(req.getContextPath()+"/employer/profile.jsp");
		}
		else
		{
			session.setAttribute("result", "Invalid Email or Password!");
			resp.sendRedirect(req.getContextPath()+"/employer/login.jsp");
		}
	}
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		HttpSession session = req.getSession();
		session.invalidate();
		resp.sendRedirect(req.getContextPath()+"/employer/login.jsp");
	}

}
