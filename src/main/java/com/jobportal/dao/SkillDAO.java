package com.jobportal.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.jobportal.model.Skill;
import com.jobportal.util.DBConnection;

public class SkillDAO implements JobPortalDAO
{
	Connection conn;
	
	public SkillDAO() {
		conn = DBConnection.getConnection();
	}

	@Override
	public void add(Object obj) {
		Skill skill = (Skill) obj;
		try 
		{
			String query = "insert into skills(email, skill, proficiency) values(?,?,?)";
			PreparedStatement ps =  conn.prepareStatement(query);
			ps.setString(1, skill.getEmail());
			ps.setString(2, skill.getSkill());
			ps.setString(3, skill.getProficiency());
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
		List<Object> list = new ArrayList<Object>();
		try 
		{
			String query = "select * from skills where email=?";
			PreparedStatement ps = conn.prepareStatement(query);
			ps.setString(1, email);
			ResultSet rs = ps.executeQuery();
			while(rs.next())
			{
				Skill skill = new Skill();
				skill.setId(rs.getInt("id"));
				skill.setEmail(email);
				skill.setSkill(rs.getString("skill"));
				skill.setProficiency(rs.getString("proficiency"));
				
				list.add(skill);
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
		Skill skill = (Skill) obj;
		try 
		{
			String query = "delete from skills where email=? and id=?";
			PreparedStatement ps = conn.prepareStatement(query);
			ps.setString(1, skill.getEmail());
			ps.setInt(2, skill.getId());
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
		
		
	}

}
