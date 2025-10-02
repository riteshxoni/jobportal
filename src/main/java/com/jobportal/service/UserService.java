package com.jobportal.service;

import java.util.ArrayList;
import java.util.List;

import com.jobportal.dao.JobPortalDAO;
import com.jobportal.dao.UserDAO;
import com.jobportal.model.User;

public class UserService 
{
	JobPortalDAO dao;
	UserDAO dao2;
	
	public UserService() {
		dao = new UserDAO();
		dao2 = new UserDAO();
	}
	
	public User checkCredentials(User user)
	{
		UserDAO userDAO = new UserDAO();
		return userDAO.checkUser(user);
	}
	
	public void addUser(User user)
	{
		dao.add(user);
	}
	
	public void deleteUser(User user)
	{
		dao.delete(user);
	}
	public void updateUser(User user)
	{
		dao.update(user);
	}
	public User getSingleUser(String email)
	{
		User user = (User) dao.get(email);
		return user;
	}
	public List<User> getAllUser(String email)
	{
		List<Object> list = dao.getAll(email);
		
		List<User> userList = new ArrayList<User>();
		
		for(Object obj:list)
		{
			userList.add((User)obj);
		}
		
		return userList;
	}
	public void updateProfile(String email,String imageName)
	{
		
		dao2.updateProfile(email, imageName);
	}
	public void uploadResume(String email,String name)
	{
		dao2.uploadResume(email, name);
	}
}
