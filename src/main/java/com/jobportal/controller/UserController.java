package com.jobportal.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.jobportal.model.User;
import com.jobportal.service.UserService;

@WebServlet("/UserController")
public class UserController extends HttpServlet
{
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		if(req.getParameter("method")==null)
		{
			User user = new User();
			user.setName(req.getParameter("name"));
			user.setEmail(req.getParameter("email"));
			user.setPassword(req.getParameter("password"));
			user.setGender(req.getParameter("gender"));
			user.setCity(req.getParameter("city"));
			user.setFields(req.getParameter("fields"));
			
			UserService service = new UserService();
			if(service.getSingleUser(user.getEmail())==null)
			{
				service.addUser(user);
				resp.sendRedirect(req.getContextPath()+"/view/RegisterSuccess.jsp");
			}
			else
			{
				HttpSession session = req.getSession();
				session.setAttribute("existingUser", user.getEmail());
				resp.sendRedirect(req.getContextPath()+"/view/register.jsp");
			}
			
		}
		else if(req.getParameter("method").equals("PUT"))
		{
			doPut(req,resp);
		}
	}
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// TODO Auto-generated method stub
		super.doGet(req, resp);
	}
	@Override
	protected void doPut(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		HttpSession session =  req.getSession();
		User user = (User) session.getAttribute("currentUser");
		
        user.setName(req.getParameter("name"));
        user.setFatherName(req.getParameter("father_name"));
        user.setMotherName(req.getParameter("mother_name"));
        user.setGender(req.getParameter("gender"));
        user.setDob(req.getParameter("dob"));
        user.setPhone(req.getParameter("phone"));
        user.setNationality(req.getParameter("nationality"));
        user.setCity(req.getParameter("city"));
        user.setMaritalStatus(req.getParameter("marital_Status"));
        user.setLanguage(req.getParameter("language"));
        user.setHeading(req.getParameter("heading"));
        user.setFields(req.getParameter("fields"));
        user.setTitle(req.getParameter("title"));
        UserService service = new UserService();
        service.updateUser(user);
        session.setAttribute("currentUser", user);
        resp.sendRedirect(req.getContextPath()+"/profile/profile.jsp");
	}
	@Override
	protected void doDelete(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// TODO Auto-generated method stub
		super.doDelete(req, resp);
	}
}
