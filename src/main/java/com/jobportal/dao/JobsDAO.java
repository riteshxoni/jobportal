package com.jobportal.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.jobportal.model.Job;
import com.jobportal.util.DBConnection;

public class JobsDAO implements JobPortalDAO
{
	Connection conn;
	public JobsDAO() 
	{
		conn = DBConnection.getConnection();
	}

	@Override
	public void add(Object obj) {
		Job job = (Job) obj;
		try 
		{
			String query = "INSERT INTO jobs (employerId, job_title, description, skills_required, experience_required,location, salary_range, job_type, expire_date, photo, email) VALUES (?,?,?,?,?,?,?,?,?,?,?)";
			PreparedStatement ps = conn.prepareStatement(query);
			ps.setInt(1, job.getEmployeeId());
            ps.setString(2, job.getJob_title());
            ps.setString(3, job.getDescription());
            ps.setString(4, job.getSkills_required());
            ps.setString(5, job.getExperience_required());
            ps.setString(6, job.getLocation());
            ps.setString(7, job.getSalary_range());
            ps.setString(8, job.getJob_type());
            ps.setString(9, job.getExpire_date());
            ps.setString(10, job.getPhoto());
            ps.setString(11, job.getEmail());
            
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
	public List<Object> getAll(String email) {
		
		List<Object> list = new ArrayList<Object>();
		
		try 
		{
			String query = "select * from jobs where email=?";
			PreparedStatement ps = conn.prepareStatement(query);
			ps.setString(1, email);
			ResultSet rs = ps.executeQuery();
			
			while(rs.next())
			{
				Job job = new Job();
				job.setId(rs.getInt("id"));
				job.setEmployeeId(rs.getInt("employerId"));
				job.setEmail(rs.getString("email"));
				job.setJob_title(rs.getString("job_title"));
				job.setDescription(rs.getString("description"));
				job.setSkills_required(rs.getString("skills_required"));
				job.setExperience_required(rs.getString("experience_required"));
				job.setLocation(rs.getString("location"));
				job.setSalary_range(rs.getString("salary_range"));
				job.setJob_type(rs.getString("job_type"));
				job.setExpire_date(rs.getString("expire_date"));
				job.setPhoto(rs.getString("photo"));
				job.setCreated_at(rs.getString("created_at"));
				list.add(job);
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
		Job job = (Job) obj;
		try 
		{
			String query = "delete from jobs where email=? and id=?";
			PreparedStatement ps = conn.prepareStatement(query);
			ps.setString(1, job.getEmail());
			ps.setInt(2, job.getId());
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
		Job job = (Job) obj;
		try 
		{
			String query = "update jobs set job_title=?, description=?, skills_required=?, experience_required=?,"+
							"location=?, salary_range=?, job_type=?, expire_date=?, photo=? where email=? and id=?";
			
			PreparedStatement ps = conn.prepareStatement(query);
			ps.setString(1, job.getJob_title());
            ps.setString(2, job.getDescription());
            ps.setString(3, job.getSkills_required());
            ps.setString(4, job.getExperience_required());
            ps.setString(5, job.getLocation());
            ps.setString(6, job.getSalary_range());
            ps.setString(7, job.getJob_type());
            ps.setString(8, job.getExpire_date());
            ps.setString(9, job.getPhoto());
            ps.setString(10, job.getEmail());
            ps.setInt(11, job.getId());
            
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
	
	public Job getJob(int id)
	{
		Job job = null;
		try 
		{
			String query = "select * from jobs where id=?";
			PreparedStatement ps = conn.prepareStatement(query);
			ps.setInt(1, id);
			ResultSet rs = ps.executeQuery();
			
			if(rs.next())
			{
				job = new Job();
				job.setId(rs.getInt("id"));
				job.setEmployeeId(rs.getInt("employerId"));
				job.setEmail(rs.getString("email"));
				job.setJob_title(rs.getString("job_title"));
				job.setDescription(rs.getString("description"));
				job.setSkills_required(rs.getString("skills_required"));
				job.setExperience_required(rs.getString("experience_required"));
				job.setLocation(rs.getString("location"));
				job.setSalary_range(rs.getString("salary_range"));
				job.setJob_type(rs.getString("job_type"));
				job.setExpire_date(rs.getString("expire_date"));
				job.setPhoto(rs.getString("photo"));
				job.setCreated_at(rs.getString("created_at"));
			}
		} 
		catch (Exception e) 
		{
			e.printStackTrace();
		}
		return job;
	}
	
	public List<Job> getAllJobs()
	{
		List<Job> list = new ArrayList<Job>();
		try 
		{
			String query = "select * from jobs";
			PreparedStatement ps = conn.prepareStatement(query);
			ResultSet rs = ps.executeQuery();
			
			while(rs.next())
			{
				Job job = new Job();
				job.setId(rs.getInt("id"));
				job.setEmployeeId(rs.getInt("employerId"));
				job.setEmail(rs.getString("email"));
				job.setJob_title(rs.getString("job_title"));
				job.setDescription(rs.getString("description"));
				job.setSkills_required(rs.getString("skills_required"));
				job.setExperience_required(rs.getString("experience_required"));
				job.setLocation(rs.getString("location"));
				job.setSalary_range(rs.getString("salary_range"));
				job.setJob_type(rs.getString("job_type"));
				job.setExpire_date(rs.getString("expire_date"));
				job.setPhoto(rs.getString("photo"));
				job.setCreated_at(rs.getString("created_at"));
				list.add(job);
			}
		} 
		catch (Exception e) 
		{
			e.printStackTrace();
		}
		
		return list;
	}
	
	public Map<Integer, String> getCompanyNames()
	{
		Map<Integer, String> names = new HashMap<Integer, String>();
		try 
		{
			String query = "select id, company_name from employer";
			PreparedStatement ps = conn.prepareStatement(query);
			ResultSet rs = ps.executeQuery();
			while(rs.next())
			{
				names.put(rs.getInt("id"), rs.getString("company_name"));
			}
		} 
		catch (Exception e) 
		{
			e.printStackTrace();
		}
		return names;		
	}
	
	public Map<Integer, String> getJobsTitles()
	{
		Map<Integer, String> titles = new HashMap<Integer, String>();
		
		try 
		{
			String query = "select id,job_title from jobs";
			PreparedStatement ps = conn.prepareStatement(query);
			ResultSet rs = ps.executeQuery();
			while(rs.next())
			{
				titles.put(rs.getInt("id"), rs.getString("job_title"));
			}
		} 
		catch (Exception e) 
		{
			e.printStackTrace();
		}
		return titles;
	}
	
	
}
