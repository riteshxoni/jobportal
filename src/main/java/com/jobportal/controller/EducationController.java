package com.jobportal.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.jobportal.model.Education;
import com.jobportal.model.User;
import com.jobportal.service.EducationService;

@WebServlet("/EducationController")
public class EducationController extends HttpServlet
{
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		if(req.getParameter("method")==null)
		{
			HttpSession session =  req.getSession();
			User user = (User) session.getAttribute("currentUser");
			
			Education education = new Education();
			education.setEmail(user.getEmail());
			education.setSchoolUniversity(req.getParameter("school"));
			education.setCourseDegree(req.getParameter("degree"));
			education.setYear(req.getParameter("passingyear"));
			education.setResult(req.getParameter("grade"));
			
			EducationService service = new EducationService();
			service.addEducation(education);
			
			if(session.getAttribute("education")!=null)
			{
				List<Education> educationList = (List<Education>) session.getAttribute("education");
				educationList.add(education);
				session.setAttribute("education", educationList);
			}
			else
			{
				List<Education> educationList = new ArrayList<Education>();
				educationList.add(education);
				session.setAttribute("education", educationList);
			}
			
			resp.sendRedirect(req.getContextPath()+"/profile/profile.jsp");
		}
		else if(req.getParameter("method").equals("PUT"))
		{
			doPut(req, resp);
		}
	}
	
	@Override
	protected void doPut(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		HttpSession session = req.getSession();
		List<Education> list = (List<Education>) session.getAttribute("education");
		
		Education education = list.get(Integer.parseInt(req.getParameter("index")));
		education.setSchoolUniversity(req.getParameter("school"));
		education.setCourseDegree(req.getParameter("degree"));
		education.setYear(req.getParameter("passingyear"));
		education.setResult(req.getParameter("grade"));
		
		EducationService service = new EducationService();
		service.updateEducation(education);
		resp.sendRedirect(req.getContextPath()+"/profile/profile.jsp");
	}
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		if(req.getParameter("method")==null)
		{
			
		}
		else if(req.getParameter("method").equals("DELETE"))
		{
			doDelete(req, resp);
		}
	}
	
	@Override
	protected void doDelete(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		HttpSession session = req.getSession();
		List<Education> list = (List<Education>) session.getAttribute("education");
		
		Education education = list.get(Integer.parseInt(req.getParameter("index")));
		EducationService service = new EducationService();
		service.deleteEducation(education);
		
		list.remove(education);
		resp.sendRedirect(req.getContextPath()+"/profile/profile.jsp");
	}
	
}
