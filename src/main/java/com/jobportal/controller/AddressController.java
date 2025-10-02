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

import com.jobportal.model.Address;
import com.jobportal.model.User;
import com.jobportal.service.AddressService;

@WebServlet("/AddressController")
public class AddressController extends HttpServlet
{
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		if(req.getParameter("method")==null)
		{
			HttpSession session = req.getSession();
			User user = (User) session.getAttribute("currentUser");
			
			Address address = new Address();
			address.setEmail(user.getEmail());
			address.setAddressType(req.getParameter("address_type"));
			address.setStreet(req.getParameter("street"));
			address.setCity(req.getParameter("city"));
			address.setState(req.getParameter("state"));
			address.setPinCode(req.getParameter("pin_code"));
			address.setCountry(req.getParameter("country"));
			address.setLandmark(req.getParameter("landmark"));
			
			AddressService service = new AddressService();
			service.addAddress(address);
			
			if(session.getAttribute("address")!=null)
			{
				List<Address> list = (List<Address>) session.getAttribute("address");
				list.add(address);
				session.setAttribute("address", list);
			}
			else
			{
				List<Address> list = new ArrayList<Address>();
				list.add(address);
				session.setAttribute("address", list);
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
		List<Address> list = (List<Address>) session.getAttribute("address");
		
		Address address = list.get(Integer.parseInt(req.getParameter("index")));
		
		address.setAddressType(req.getParameter("address_type"));
		address.setStreet(req.getParameter("street"));
		address.setCity(req.getParameter("city"));
		address.setState(req.getParameter("state"));
		address.setPinCode(req.getParameter("pin_code"));
		address.setCountry(req.getParameter("country"));
		address.setLandmark(req.getParameter("landmark"));
		
		AddressService service = new AddressService();
		try 
		{
			service.updateAddress(address);
			resp.sendRedirect(req.getContextPath()+"/profile/profile.jsp");
		} 
		catch (Exception e) 
		{
			e.printStackTrace();
		}
	}
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		if(req.getParameter("method") == null)
		{
			
		}
		else if(req.getParameter("method").equals("DELETE"))
		{
			doDelete(req,resp);
		}
		
	}
	
	@Override
	protected void doDelete(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		HttpSession session = req.getSession();
		List<Address> list = (List<Address>) session.getAttribute("address");
		Address address = list.get(Integer.parseInt(req.getParameter("index")));
		
		AddressService service = new AddressService();
		service.deleteAddress(address);
		list.remove(Integer.parseInt(req.getParameter("index")));
		resp.sendRedirect(req.getContextPath()+"/profile/profile.jsp");
	}
}
