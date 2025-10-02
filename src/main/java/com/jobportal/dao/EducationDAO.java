package com.jobportal.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.jobportal.model.Education;
import com.jobportal.util.DBConnection;

public class EducationDAO implements JobPortalDAO
{
	Connection conn;
	
	
	public EducationDAO() 
	{
		conn = DBConnection.getConnection();
	}

	@Override
	public void add(Object obj) 
	{
		Education education = (Education) obj;
		
		try 
		{
			String query = "insert into education(email,SchoolUniversity,CourseDegree,year,result) values(?,?,?,?,?)";
			PreparedStatement ps = conn.prepareStatement(query);
			ps.setString(1, education.getEmail());
			ps.setString(2, education.getSchoolUniversity());
			ps.setString(3, education.getCourseDegree());
			ps.setString(4, education.getYear());
			ps.setString(5, education.getResult());
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
			String query = "select * from education where email=?";
			PreparedStatement ps = conn.prepareStatement(query);
			ps.setString(1, email);
			ResultSet rs = ps.executeQuery();
			while(rs.next())
			{
				Education education =  new Education();
				education.setId(rs.getInt("id"));
				education.setEmail(email);
				education.setSchoolUniversity(rs.getString("SchoolUniversity"));
				education.setCourseDegree(rs.getString("CourseDegree"));
				education.setYear(rs.getString("year"));
				education.setResult(rs.getString("result"));
				list.add(education);
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
		Education education = (Education) obj;
		try 
		{
			String query = "delete from education where email=? and id=?";
			PreparedStatement ps = conn.prepareStatement(query);
			ps.setString(1, education.getEmail());
			ps.setInt(2, education.getId());
			int i = ps.executeUpdate();
			if (i>0)
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
		Education education = (Education)obj;
		try 
		{
			String query = "update education set SchoolUniversity=?,CourseDegree=?,year=?,result=? where email=? and id=?";
			PreparedStatement ps = conn.prepareStatement(query);
			// set values from Education object
		    ps.setString(1, education.getSchoolUniversity());
		    ps.setString(2, education.getCourseDegree());
		    ps.setString(3, education.getYear());
		    ps.setString(4, education.getResult());
		    ps.setString(5, education.getEmail());
		    ps.setInt(6, education.getId());
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
