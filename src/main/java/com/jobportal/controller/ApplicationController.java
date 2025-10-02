package com.jobportal.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.jobportal.model.Application;
import com.jobportal.model.Employer;
import com.jobportal.model.User;
import com.jobportal.service.ApplicationService;

@WebServlet("/ApplicationController")
public class ApplicationController extends HttpServlet
{
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		HttpSession session = req.getSession();
		User user = (User) session.getAttribute("currentUser");
		
		Application application = new Application();
		application.setCandidateId(Integer.parseInt(req.getParameter("user_id")));
		application.setEmail(user.getEmail());
		application.setCandidateCV(req.getParameter("resume"));
		application.setJobId(Integer.parseInt(req.getParameter("job_id")));
		application.setEmployerId(Integer.parseInt(req.getParameter("emp_id")));
		
		ApplicationService service = new ApplicationService();
		service.addAppliation(application);
		
		List<Application> applications = service.getAllApplications(user.getEmail());
		session.setAttribute("applied", applications);
		
		resp.sendRedirect(req.getContextPath()+"/profile/profile.jsp");
		
	}
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		Application application = new Application();
		application.setJobId(Integer.parseInt(req.getParameter("id")));
		application.setStatus(req.getParameter("status"));
		
		ApplicationService service = new ApplicationService();
		service.updateApplication(application);
		
		HttpSession session = req.getSession();
		Employer emp = (Employer) session.getAttribute("currentEmployer");
		
		session.setAttribute("applications", service.getApplications(emp.getId()));
		
		resp.sendRedirect(req.getContextPath()+"/employer/profile.jsp");
		
	}
}
