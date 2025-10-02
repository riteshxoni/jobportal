package com.jobportal.controller;

import java.io.FileInputStream;
import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.jobportal.filecrud.FileCrud;
import com.jobportal.model.User;
import com.jobportal.service.UserService;

@WebServlet("/ResumeController")
@MultipartConfig
public class ResumeController extends HttpServlet
{
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		HttpSession session = req.getSession();
		User user = (User) session.getAttribute("currentUser");
		
		FileCrud crud = new FileCrud(req);
		String name = crud.uploadResume();
		
		user.setResume(name);
		
		UserService service = new UserService();
		service.uploadResume(user.getEmail(), name);
		
		resp.sendRedirect(req.getContextPath()+"/profile/profile.jsp");
				
	}
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException 
	{
		PrintWriter out = resp.getWriter();
		HttpSession session = req.getSession();
		User user = (User) session.getAttribute("currentUser");
		if(user.getResume()!=null)
		{
			resp.setHeader("Content-Disposition", "attachment;filename="+user.getResume());
			FileInputStream fis = new FileInputStream(FileCrud.RESUME_PATH+user.getResume());
			int i;
			while((i=fis.read()) != -1)
			{
				out.write(i);
			}
			fis.close();
		}
		out.close();
	}
}
