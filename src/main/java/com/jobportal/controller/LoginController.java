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

import com.jobportal.model.Address;
import com.jobportal.model.Application;
import com.jobportal.model.Education;
import com.jobportal.model.Experience;
import com.jobportal.model.Project;
import com.jobportal.model.Skill;
import com.jobportal.model.User;
import com.jobportal.service.AddressService;
import com.jobportal.service.ApplicationService;
import com.jobportal.service.EducationService;
import com.jobportal.service.ExperienceService;
import com.jobportal.service.JobsService;
import com.jobportal.service.ProjectService;
import com.jobportal.service.SkillService;
import com.jobportal.service.UserService;

@WebServlet("/LoginController")
public class LoginController extends HttpServlet
{
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		User user = new User();
		user.setEmail(req.getParameter("email"));
		user.setPassword(req.getParameter("password"));
		
		UserService service = new UserService();
		User user2 = service.checkCredentials(user);
		
		HttpSession session = req.getSession();
		if(user2!=null)
		{
			session.setAttribute("currentUser", user2);
			
			AddressService addressService = new AddressService();
			List<Address> addressList =  addressService.getAddresses(user.getEmail());
	
			if(!addressList.isEmpty())
			{
				session.setAttribute("address", addressList);
			}
			
			SkillService skillService = new SkillService();
			List<Skill> skillList = skillService.getSkills(user.getEmail());
			
			if(!skillList.isEmpty())
			{
				session.setAttribute("skills", skillList);
			}
			
			EducationService educationService = new EducationService();
			List<Education> educationList =  educationService.getEducations(user.getEmail());
			if(!educationList.isEmpty())
			{
				session.setAttribute("education", educationList);
			}
			
			ExperienceService experienceService = new ExperienceService();
			List<Experience> experienceList = experienceService.getExperiences(user.getEmail());
			if(!experienceList.isEmpty())
			{
				session.setAttribute("experience", experienceList);
			}
			
			ProjectService projectService = new ProjectService();
			List<Project> projectList = projectService.getProjects(user.getEmail());
			if(!projectList.isEmpty())
			{
				session.setAttribute("project", projectList);
			}
			
			ApplicationService applicationService = new ApplicationService();
			List<Application> applications = applicationService.getAllApplications(user.getEmail());
			if(!applications.isEmpty())
			{
				session.setAttribute("applied", applications);
			}
			
			JobsService jobsService = new JobsService();
			Map<Integer, String> jobTitles = jobsService.getTitles();
			if(!jobTitles.isEmpty())
			{
				session.setAttribute("titles", jobTitles);
			}
			
			resp.sendRedirect(req.getContextPath()+"/profile/profile.jsp");
		}
		else
		{
			session.setAttribute("error", "Invalid Email or Password!");
			resp.sendRedirect(req.getContextPath()+"/view/login.jsp");
		}
	}
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		HttpSession session = req.getSession();
		if(session!=null)
		{
			session.invalidate();
		}
		resp.sendRedirect(req.getContextPath()+"/view/login.jsp");
	}
}
