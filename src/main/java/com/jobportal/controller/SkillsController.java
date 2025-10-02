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

import com.jobportal.model.Skill;
import com.jobportal.model.User;
import com.jobportal.service.SkillService;

@WebServlet("/SkillsController")
public class SkillsController extends HttpServlet
{
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		HttpSession session = req.getSession();
		User user = (User) session.getAttribute("currentUser");
		
		Skill skill = new Skill(0, user.getEmail(), req.getParameter("skill"), req.getParameter("proficiency"));
		SkillService service =  new SkillService();
		service.addSkill(skill);
		
		if(session.getAttribute("skills")!=null)
		{
			List<Skill> skillList = (List<Skill>) session.getAttribute("skills");
			skillList.add(skill);
		}
		else
		{
			List<Skill> skillList = new ArrayList<Skill>();
			skillList.add(skill);
			session.setAttribute("skills", skillList);
		}
		
		
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
		
		List<Skill> skillList = (List<Skill>) session.getAttribute("skills");
		
		Skill skill = skillList.get(Integer.parseInt(req.getParameter("index")));
		
		SkillService service = new SkillService();
		service.deleteSkill(skill);
		
//		skillList.remove(skill);
		skillList.remove(Integer.parseInt(req.getParameter("index")));
		resp.sendRedirect(req.getContextPath()+"/profile/profile.jsp");
		
	}
}
