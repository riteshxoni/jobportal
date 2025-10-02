package com.jobportal.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.jobportal.model.Experience;
import com.jobportal.util.DBConnection;

public class ExperienceDAO implements JobPortalDAO
{
	Connection conn;
	
	public ExperienceDAO() {
		conn = DBConnection.getConnection();
	}

	@Override
	public void add(Object obj) {
		Experience experience = (Experience) obj;
		try 
		{
			String query = "INSERT INTO experience (email, job_title, company_name, location, start_date, end_date, description, skills_used) VALUES (?, ?, ?, ?, ?, ?, ?, ?)";
			PreparedStatement ps = conn.prepareStatement(query);
		 	ps.setString(1, experience.getEmail());
		    ps.setString(2, experience.getJobTitle());
		    ps.setString(3, experience.getCompanyName());
		    ps.setString(4, experience.getLocation());
		    ps.setString(5, experience.getStartDate()); 
		    ps.setString(6, experience.getEndDate());    
		    ps.setString(7, experience.getDescription());
		    ps.setString(8, experience.getSkillsUsed());
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
		
		return null;
	}

	@Override
	public List<Object> getAll(String email) 
	{
		List<Object> list = new ArrayList<Object>();
		try 
		{
			String query = "select * from experience where email=?";
			PreparedStatement ps = conn.prepareStatement(query);
			ps.setString(1, email);
			ResultSet rs = ps.executeQuery();
			while(rs.next())
			{
				Experience experience = new Experience();
				experience.setId(rs.getInt("id"));
				experience.setEmail(email);
				experience.setJobTitle(rs.getString("job_title"));
				experience.setCompanyName(rs.getString("company_name"));
				experience.setLocation(rs.getString("location"));
				experience.setStartDate(rs.getString("start_date"));
				experience.setEndDate(rs.getString("end_date"));
				experience.setDescription(rs.getString("description"));
				experience.setSkillsUsed(rs.getString("skills_used"));
				list.add(experience);
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
		Experience experience = (Experience)obj;
		try 
		{
			String query = "delete from experience where email=? and id=?";
			PreparedStatement ps = conn.prepareStatement(query);
			ps.setString(1, experience.getEmail());
			ps.setInt(2, experience.getId());
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
		Experience experience = (Experience) obj;
		try 
		{
			String query = "update experience set job_title=?,company_name=?,location=?,start_date=?,end_date=?,description=?,skills_used=? where email=? and id=?";
			PreparedStatement ps = conn.prepareStatement(query);
			ps.setString(1, experience.getJobTitle());
		    ps.setString(2, experience.getCompanyName());
		    ps.setString(3, experience.getLocation());
		    ps.setString(4, experience.getStartDate()); 
		    ps.setString(5, experience.getEndDate());    
		    ps.setString(6, experience.getDescription());
		    ps.setString(7, experience.getSkillsUsed());
		    ps.setString(8, experience.getEmail());
		    ps.setInt(9, experience.getId());
		    
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
