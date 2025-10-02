package com.jobportal.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.List;

import com.jobportal.model.User;
import com.jobportal.util.DBConnection;

public class UserDAO implements JobPortalDAO
{
	Connection conn;
	
	public UserDAO() {
		conn = DBConnection.getConnection();
	}

	@Override
	public void add(Object obj) {
		User user = (User) obj;
		try 
		{
			String query = "insert into user(name,email,password,gender,city,fields) values(?,?,?,?,?,?)";
			PreparedStatement ps = conn.prepareStatement(query);
			ps.setString(1, user.getName());
			ps.setString(2, user.getEmail());
			ps.setString(3, user.getPassword());
			ps.setString(4, user.getGender());
			ps.setString(5, user.getCity());
			ps.setString(6, user.getFields());
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
		Object obj=null;
		try 
		{
			String query = "select * from user where email=?";
			PreparedStatement ps = conn.prepareStatement(query);
			ps.setString(1, email);
			ResultSet rs = ps.executeQuery();
			if(rs.next())
			{
				User user = new User();
	            user.setId(rs.getInt("id"));
	            user.setName(rs.getString("name"));
	            user.setGender(rs.getString("gender"));
	            user.setDob(rs.getString("dob"));  
	            user.setEmail(rs.getString("email"));
	            user.setPhone(rs.getString("phone"));
	            user.setPassword(rs.getString("password"));
	            user.setCity(rs.getString("city"));
	            user.setFields(rs.getString("fields"));
	            user.setTitle(rs.getString("title"));
	            user.setNationality(rs.getString("nationality"));
	            user.setMaritalStatus(rs.getString("maritalStatus"));
	            user.setFatherName(rs.getString("fatherName"));
	            user.setMotherName(rs.getString("motherName"));
	            user.setLanguage(rs.getString("language"));
	            user.setHeading(rs.getString("heading"));
	            user.setPhoto(rs.getString("photo"));
	            user.setResume(rs.getString("resume"));
	            obj = (Object) user;
			}
		} 
		catch (Exception e) 
		{
			e.printStackTrace();
		}
		return obj;
	}

	@Override
	public List<Object> getAll(String email) {
		
		return null;
	}

	@Override
	public void delete(Object obj) {
		User user = (User) obj;
		try 
		{
			String query = "delete from user where email=?";
			PreparedStatement ps = conn.prepareStatement(query);
			ps.setString(1, user.getEmail());
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
		User user = (User) obj;
		try 
		{
			String query = "update user set name=?,gender=?,dob=?,phone=?,city=?,fields=?,title=?,nationality=?,maritalStatus=?,fatherName=?,motherName=?,language=?,heading=? where email=?";
			PreparedStatement ps = conn.prepareStatement(query);
			ps.setString(1,  user.getName());
			ps.setString(2,  user.getGender());
			ps.setString(3,  user.getDob());
			ps.setString(4,  user.getPhone());
			ps.setString(5,  user.getCity());
			ps.setString(6,  user.getFields());
			ps.setString(7,  user.getTitle());
			ps.setString(8,  user.getNationality());
			ps.setString(9,  user.getMaritalStatus());
			ps.setString(10, user.getFatherName());
			ps.setString(11, user.getMotherName());
			ps.setString(12, user.getLanguage());
			ps.setString(13, user.getHeading());
			ps.setString(14, user.getEmail());
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
	
	public User checkUser(User user)
	{
		User user2=null;
		try 
		{
			String query = "select * from user where email=? and password=?";
			PreparedStatement ps = conn.prepareStatement(query);
			ps.setString(1, user.getEmail());
			ps.setString(2, user.getPassword());
			ResultSet rs = ps.executeQuery();
			if(rs.next())
			{
				user2 = new User();
				user2.setId(rs.getInt("id"));
	            user2.setName(rs.getString("name"));
	            user2.setGender(rs.getString("gender"));
	            user2.setDob(rs.getString("dob"));   // java.sql.Date map hoga
	            user2.setEmail(rs.getString("email"));
	            user2.setPhone(rs.getString("phone"));
	            user2.setPassword(rs.getString("password"));
	            user2.setCity(rs.getString("city"));
	            user2.setFields(rs.getString("fields"));
	            user2.setTitle(rs.getString("title"));
	            user2.setNationality(rs.getString("nationality"));
	            user2.setMaritalStatus(rs.getString("maritalStatus"));
	            user2.setFatherName(rs.getString("fatherName"));
	            user2.setMotherName(rs.getString("motherName"));
	            user2.setLanguage(rs.getString("language"));
	            user2.setHeading(rs.getString("heading"));
	            user2.setPhoto(rs.getString("photo"));
	            user2.setResume(rs.getString("resume"));
			}
		} 
		catch (Exception e) 
		{
			e.printStackTrace();
		}
		return user2;
	}
	
	public void updateProfile(String email, String photo)
	{
		try 
		{
			String query = "update user set photo=? where email=?";
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
	public void uploadResume(String email,String name)
	{
		try 
		{
			String query = "update user set resume=? where email=?";
			PreparedStatement ps = conn.prepareStatement(query);
			ps.setString(1, name);
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
