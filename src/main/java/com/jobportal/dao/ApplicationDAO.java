package com.jobportal.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.jobportal.model.Application;
import com.jobportal.util.DBConnection;

public class ApplicationDAO implements JobPortalDAO
{
	Connection conn;
	
	public ApplicationDAO() {
		conn = DBConnection.getConnection();
	}

	@Override
	public void add(Object obj) 
	{
		Application application = (Application) obj;
		try 
		{
			String query = "insert into applications(candidateId,email,candidateCV,jobId,employerId) values(?,?,?,?,?)";
			
			PreparedStatement ps = conn.prepareStatement(query);
			
			ps.setInt(1, application.getCandidateId());
			ps.setString(2, application.getEmail());
			ps.setString(3, application.getCandidateCV());
			ps.setInt(4, application.getJobId());
			ps.setInt(5, application.getEmployerId());
			
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
	public Object get(String email) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<Object> getAll(String email) 
	{
		List<Object> list = new ArrayList<Object>();
		
		try 
		{
			String query = "select * from applications where email=?";
			PreparedStatement ps =  conn.prepareStatement(query);
			ps.setString(1, email);
			ResultSet rs = ps.executeQuery();
			while(rs.next())
			{
				Application application = new Application();
				application.setId(rs.getInt("id"));
				application.setEmail(rs.getString("email"));
				application.setCandidateId(rs.getInt("candidateId"));
				application.setCandidateCV(rs.getString("candidateCV"));
				application.setJobId(rs.getInt("jobId"));
				application.setEmployerId(rs.getInt("employerId"));
				application.setAppliedAt(rs.getString("appliedAt"));
				application.setStatus(rs.getString("status"));
				list.add(application);
			}
		} 
		catch (Exception e) 
		{
			e.printStackTrace();
		}
		
		return list;
	}

	public List<Object> getAllApplications(int id) 
	{
		List<Object> list = new ArrayList<Object>();
		
		try 
		{
			String query = "select * from applications where employerId=?";
			PreparedStatement ps =  conn.prepareStatement(query);
			ps.setInt(1, id);
			ResultSet rs = ps.executeQuery();
			while(rs.next())
			{
				Application application = new Application();
				application.setId(rs.getInt("id"));
				application.setEmail(rs.getString("email"));
				application.setCandidateId(rs.getInt("candidateId"));
				application.setCandidateCV(rs.getString("candidateCV"));
				application.setJobId(rs.getInt("jobId"));
				application.setEmployerId(rs.getInt("employerId"));
				application.setAppliedAt(rs.getString("appliedAt"));
				application.setStatus(rs.getString("status"));
				list.add(application);
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
		// TODO Auto-generated method stub
		
	}

	@Override
	public void update(Object obj) {
		Application application = (Application) obj;
		try 
		{
			String query = "update applications set status=? where jobId=?";
			PreparedStatement ps = conn.prepareStatement(query);
			ps.setString(1, application.getStatus());
			ps.setInt(2, application.getJobId());
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
