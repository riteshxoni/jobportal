package com.jobportal.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.List;

import com.jobportal.model.Employer;
import com.jobportal.util.DBConnection;

public class EmployerDAO implements JobPortalDAO
{
	Connection conn;
	
	public EmployerDAO() {
		conn = DBConnection.getConnection();
	}

	@Override
	public void add(Object obj) {
		Employer emp = (Employer) obj;
		
		try 
		{
			String query = "insert into employer(email,password,company_name,industry_type,location,website) values(?,?,?,?,?,?)";
			PreparedStatement ps = conn.prepareStatement(query);
			ps.setString(1, emp.getEmail());
			ps.setString(2, emp.getPassword());
			ps.setString(3, emp.getCompany_name());
			ps.setString(4, emp.getIndustry_type());
			ps.setString(5, emp.getLocation());
			ps.setString(6, emp.getWebsite());
			
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
	public List<Object> getAll(String email) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public void delete(Object obj) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void update(Object obj) {
		
		Employer emp = (Employer) obj;
		try 
		{
			String query = "update employer set company_name=?,industry_type=?,location=?,"
					+ "website=?,about=?,hr_name=?,hr_email=?,hr_phone=? where email=? and id=?";
			PreparedStatement ps = conn.prepareStatement(query);
			ps.setString(1, emp.getCompany_name());
			ps.setString(2, emp.getIndustry_type());
			ps.setString(3, emp.getLocation());
			ps.setString(4, emp.getWebsite());
			ps.setString(5, emp.getAbout());
			ps.setString(6, emp.getHr_name());
			ps.setString(7, emp.getHr_email());
			ps.setString(8, emp.getHr_phone());
			ps.setString(9, emp.getEmail());
			ps.setInt(10, emp.getId());
			
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
	
	public Employer validateEmployer(String email, String password)
	{
		Employer emp = null;
		
		try 
		{
			String query = "select * from employer where email=? and password=?";
			PreparedStatement ps = conn.prepareStatement(query);
			ps.setString(1, email);
			ps.setString(2, password);
			ResultSet rs = ps.executeQuery();
			if(rs.next())
			{
				emp = new Employer();
				emp.setId(rs.getInt("id"));
				emp.setCompany_name(rs.getString("company_name"));
				emp.setEmail(rs.getString("email"));
				emp.setPassword(rs.getString("password"));
				emp.setIndustry_type(rs.getString("industry_type"));
				emp.setLocation(rs.getString("location"));
				emp.setWebsite(rs.getString("website"));
				emp.setLogo(rs.getString("logo"));
				emp.setCreated_at(rs.getString("create_at"));
				emp.setAbout(rs.getString("about"));
				emp.setHr_name(rs.getString("hr_name"));
				emp.setHr_email(rs.getString("hr_email"));
				emp.setHr_phone(rs.getString("hr_phone"));
			}
		} 
		catch (Exception e) 
		{
			e.printStackTrace();
		}
		return emp;
	}
	
	public void uploadPhoto(String photo, String email)
	{
		try 
		{
			String query = "update employer set logo=? where email=?";
			PreparedStatement ps = conn.prepareStatement(query);
			ps.setString(1, photo);
			ps.setString(2, email);
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
