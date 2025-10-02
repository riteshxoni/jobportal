package com.jobportal.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.jobportal.model.Project;
import com.jobportal.util.DBConnection;

public class ProjectDAO implements JobPortalDAO
{
	Connection conn;
	
	public ProjectDAO() {
		conn = DBConnection.getConnection();
	}

	@Override
	public void add(Object obj) {
		Project project = (Project) obj;
		try
		{
			String query = "insert into projects(email, project_title,description,technologies,role,project_url,github_url,start_date,end_date) values(?,?,?,?,?,?,?,?,?)";
			PreparedStatement ps = conn.prepareStatement(query);
			ps.setString(1, project.getEmail());
			ps.setString(2, project.getProjectTitle());
			ps.setString(3, project.getDescription());
			ps.setString(4, project.getTechnologies());
			ps.setString(5, project.getRole());
			ps.setString(6, project.getProjectUrl());
			ps.setString(7, project.getGithubUrl());
			ps.setString(8, project.getStartDate());
			ps.setString(9, project.getEndDate());
			int i = ps.executeUpdate();
			if(i>0)
			{
				conn.commit();
			}
		}
		catch (Exception e) {
			e.printStackTrace();
		}
		
	}

	@Override
	public Object get(String email) {
		
		return null;
	}

	@Override
	public List<Object> getAll(String email) {
		List<Object> list = new ArrayList<Object>();
		try 
		{
			String query = "select * from projects where email=?";
			PreparedStatement ps = conn.prepareStatement(query);
			ps.setString(1, email);
			ResultSet rs = ps.executeQuery();
			while(rs.next())
			{
				Project project = new Project();
				project.setId(rs.getInt("id"));
				project.setEmail(email);
				project.setProjectTitle(rs.getString("project_title"));
				project.setDescription(rs.getString("description"));
				project.setTechnologies(rs.getString("technologies"));
				project.setRole(rs.getString("role"));
				project.setStartDate(rs.getString("start_date"));
				project.setEndDate(rs.getString("end_date"));
				project.setProjectUrl(rs.getString("project_url"));
				project.setGithubUrl(rs.getString("github_url"));
				list.add(project);
			}
		} 
		catch (Exception e) 
		{
			e.printStackTrace();
		}
		return list;
	}

	@Override
	public void delete(Object obj) {
		Project project = (Project) obj;
		try 
		{
			String query = "delete from projects where email=? and id=?";
			PreparedStatement ps = conn.prepareStatement(query);
			ps.setString(1, project.getEmail());
			ps.setInt(2, project.getId());
			int i = ps.executeUpdate();
			if(i>0)
			{
				conn.commit();
			}
		} 
		catch (Exception e) 
		{
			e.printStackTrace();
		}

	}

	@Override
	public void update(Object obj) {
		Project project = (Project) obj;
		try 
		{
		String query = "UPDATE projects SET project_title = ?, description = ?, " +
		               "technologies = ?, role = ?, start_date = ?, end_date = ?, " +
		               "project_url = ?, github_url = ? WHERE email=? and id = ?";
		PreparedStatement ps = conn.prepareStatement(query);
		ps.setString(1, project.getProjectTitle());
		ps.setString(2, project.getDescription());
		ps.setString(3, project.getTechnologies());
		ps.setString(4, project.getRole());
		ps.setString(5, project.getStartDate());
		ps.setString(6, project.getEndDate());
		ps.setString(7, project.getProjectUrl());
		ps.setString(8, project.getGithubUrl());
		ps.setString(9, project.getEmail());  // email condition
		ps.setInt(10, project.getId());       // id condition
		int i = ps.executeUpdate();
		if(i>0)
		{
			conn.commit();
		}
		} 
		catch (Exception e) 
		{
			e.printStackTrace();
		}
	}

}
