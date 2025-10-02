package com.jobportal.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.jobportal.model.Employer;
import com.jobportal.service.EmployerService;

@WebServlet("/EmployerController")
public class EmployerController extends HttpServlet
{
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		if(req.getParameter("method")==null)
		{
			Employer emp = new Employer();
			emp.setCompany_name(req.getParameter("company_name"));
			emp.setEmail(req.getParameter("email"));
			emp.setPassword(req.getParameter("password"));
			emp.setIndustry_type(req.getParameter("industry_type"));
			emp.setLocation(req.getParameter("location"));
			emp.setWebsite(req.getParameter("website"));
			
			EmployerService service = new EmployerService();
			service.addEmployer(emp);
			
			HttpSession session = req.getSession();
			session.setAttribute("result", true);
			
			resp.sendRedirect(req.getContextPath()+"/employer/signup.jsp");
		}
		else if(req.getParameter("method").equals("PUT"))
		{
			doPut(req, resp);
		}
	}
	
	@Override
	protected void doPut(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		HttpSession session = req.getSession();
		
		Employer emp = (Employer) session.getAttribute("currentEmployer");
		
		emp.setCompany_name(req.getParameter("company_name"));
		emp.setIndustry_type(req.getParameter("industry_type"));
		emp.setLocation(req.getParameter("location"));
		emp.setWebsite(req.getParameter("website"));
		emp.setAbout(req.getParameter("about"));
		emp.setHr_name(req.getParameter("hr_name"));
		emp.setHr_email(req.getParameter("hr_email"));
		emp.setHr_phone(req.getParameter("hr_phone"));
		
		EmployerService service = new EmployerService();
		service.updateEmployer(emp);
		
		session.setAttribute("currentEmployer", emp);
		
		resp.sendRedirect(req.getContextPath()+"/employer/profile.jsp");
		
	}
}
