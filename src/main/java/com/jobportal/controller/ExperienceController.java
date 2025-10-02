package com.jobportal.controller;

import java.io.IOException;
import java.sql.Date;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.jobportal.model.Experience;
import com.jobportal.model.User;
import com.jobportal.service.ExperienceService;

@WebServlet("/ExperienceController")
public class ExperienceController extends HttpServlet
{
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		if(req.getParameter("method")==null)
		{
			HttpSession session = req.getSession();
			User user = (User) session.getAttribute("currentUser");
			
			Experience experience = new Experience();
			experience.setEmail(user.getEmail());
			experience.setCompanyName(req.getParameter("company"));
			experience.setLocation(req.getParameter("location"));
			experience.setStartDate(req.getParameter("start_date"));
			experience.setEndDate(req.getParameter("end_date"));
			experience.setJobTitle(req.getParameter("job_title"));
			experience.setSkillsUsed(req.getParameter("skills_used"));
			experience.setDescription(req.getParameter("description"));
			
			ExperienceService service = new ExperienceService();
			service.addExperience(experience);
			
			List<Experience> list =  service.getExperiences(user.getEmail());
			session.setAttribute("experience", list);
			
			
			resp.sendRedirect(req.getContextPath()+"/profile/profile.jsp");
		}
		else if(req.getParameter("method").equals("PUT"))
		{
			doPut(req, resp);
		}
	}
	@Override
	protected void doPut(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException 
	{
		HttpSession session = req.getSession();
		List<Experience> list = (List<Experience>) session.getAttribute("experience");
		
		Experience experience = list.get(Integer.parseInt(req.getParameter("index")));
		experience.setCompanyName(req.getParameter("company"));
		experience.setLocation(req.getParameter("location"));
		experience.setStartDate(req.getParameter("start_date"));
		experience.setEndDate(req.getParameter("end_date"));
		experience.setJobTitle(req.getParameter("job_title"));
		experience.setSkillsUsed(req.getParameter("skills_used"));
		experience.setDescription(req.getParameter("description"));
		
		ExperienceService service = new ExperienceService();
		service.updateExperience(experience);
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
		List<Experience> list = (List<Experience>) session.getAttribute("experience");
		
		Experience experience = list.get(Integer.parseInt(req.getParameter("index")));
		
		ExperienceService service = new ExperienceService();
		service.deleteExperience(experience);
		
		list.remove(experience);
		
		resp.sendRedirect(req.getContextPath()+"/profile/profile.jsp");
	}
}
