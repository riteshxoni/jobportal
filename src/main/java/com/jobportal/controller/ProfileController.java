package com.jobportal.controller;
import java.io.IOException;
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

@WebServlet("/ProfileController")
@MultipartConfig
public class ProfileController extends HttpServlet 
{
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException
	{
		HttpSession session=req.getSession();
		User user = (User) session.getAttribute("currentUser");
		UserService service = new UserService();
		
		FileCrud file = new FileCrud(req);
		String profile = file.insertFile();
		user.setPhoto(profile);
		service.updateProfile(user.getEmail(), profile);
		resp.sendRedirect(req.getContextPath()+"/profile/profile.jsp");
	}
}

