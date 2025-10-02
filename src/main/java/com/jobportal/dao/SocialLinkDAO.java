package com.jobportal.dao;

import java.sql.Connection;
import java.util.List;

import com.jobportal.util.DBConnection;

public class SocialLinkDAO implements JobPortalDAO
{
	Connection conn;
	

	public SocialLinkDAO() {
		conn = DBConnection.getConnection();
	}

	@Override
	public void add(Object obj) {
		
		
	}

	@Override
	public Object get(String email) {
		
		return null;
	}

	@Override
	public List<Object> getAll(String email) {
		
		return null;
	}

	@Override
	public void delete(Object obj) {
		
		
	}

	@Override
	public void update(Object obj) {
		
		
	}

}
