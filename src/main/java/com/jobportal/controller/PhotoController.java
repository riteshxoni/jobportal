package com.jobportal.controller;
import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.jobportal.filecrud.PhotoUpload;
import com.jobportal.model.Employer;
import com.jobportal.service.EmployerService;

@WebServlet("/PhotoController")
public class PhotoController extends HttpServlet
{
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		HttpSession session = req.getSession();
		Employer emp = (Employer) session.getAttribute("currentEmployer");
		
		PhotoUpload upload = new PhotoUpload(req);
		String photo = upload.upload();
		emp.setLogo(photo);
		
		EmployerService service = new EmployerService();
		service.uploadPhoto(photo, emp.getEmail());
		
		resp.sendRedirect(req.getContextPath()+"/employer/profile.jsp");
	}
}
