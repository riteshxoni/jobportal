package com.jobportal.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.jobportal.model.Project;
import com.jobportal.model.User;
import com.jobportal.service.ProjectService;

@WebServlet("/ProjectController")
public class ProjectController extends HttpServlet
{
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		if(req.getParameter("method")==null)
		{
			HttpSession session = req.getSession();
			User user = (User) session.getAttribute("currentUser");
			
			Project project = new Project();
			project.setEmail(user.getEmail());
			project.setProjectTitle(req.getParameter("project_title"));
			project.setRole(req.getParameter("role"));
			project.setTechnologies(req.getParameter("technologies"));
			project.setStartDate(req.getParameter("start_date"));
			project.setEndDate(req.getParameter("end_date"));
			project.setProjectUrl(req.getParameter("project_url"));
			project.setGithubUrl(req.getParameter("github_url"));
			project.setDescription(req.getParameter("description"));
			
			ProjectService service = new ProjectService();
			service.addProject(project);
			
			List<Project> list = service.getProjects(user.getEmail());
			session.setAttribute("project", list);
			
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
		List<Project> list = (List<Project>) session.getAttribute("project");
		
		Project project = list.get(Integer.parseInt(req.getParameter("index")));
		project.setProjectTitle(req.getParameter("project_title"));
		project.setRole(req.getParameter("role"));
		project.setTechnologies(req.getParameter("technologies"));
		project.setStartDate(req.getParameter("start_date"));
		project.setEndDate(req.getParameter("end_date"));
		project.setProjectUrl(req.getParameter("project_url"));
		project.setGithubUrl(req.getParameter("github_url"));
		project.setDescription(req.getParameter("description"));
		
		ProjectService service = new ProjectService();
		service.updateProject(project);
		
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
		List<Project> list =  (List<Project>) session.getAttribute("project"); 
		Project project = list.get(Integer.parseInt(req.getParameter("index")));
		
		ProjectService service = new ProjectService();
		service.deleteProject(project);
		
		list.remove(project);	
		resp.sendRedirect(req.getContextPath()+"/profile/profile.jsp");
	}
}
