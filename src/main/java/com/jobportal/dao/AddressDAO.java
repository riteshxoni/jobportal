package com.jobportal.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.jobportal.model.Address;
import com.jobportal.util.DBConnection;

public class AddressDAO implements JobPortalDAO
{
	Connection conn;
	
	public AddressDAO() 
	{
		conn = DBConnection.getConnection();
	}

	@Override
	public void add(Object obj) 
	{
		Address address = (Address) obj;
		try 
		{
			String query = "insert into address(email, address_type, street, city, state, pin_code, country, landmark) values(?,?,?,?,?,?,?,?)";
			PreparedStatement ps = conn.prepareStatement(query);
			ps.setString(1, address.getEmail());
			ps.setString(2, address.getAddressType());
			ps.setString(3, address.getStreet());
			ps.setString(4, address.getCity());
			ps.setString(5, address.getState());
			ps.setString(6, address.getPinCode());
			ps.setString(7, address.getCountry());
			ps.setString(8, address.getLandmark());
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
			String query = "select * from address where email=?";
			PreparedStatement ps = conn.prepareStatement(query);
			ps.setString(1, email);
			ResultSet rs = ps.executeQuery();
			
			while(rs.next())
			{
				Address address = new Address();
				address.setId(rs.getInt("id"));
				address.setEmail(email);
				address.setAddressType(rs.getString("address_type"));
				address.setStreet(rs.getString("street"));
				address.setCity(rs.getString("city"));
				address.setState(rs.getString("state"));
				address.setPinCode(rs.getString("pin_code"));
				address.setCountry(rs.getString("country"));
				address.setLandmark(rs.getString("landmark"));
				list.add(address);
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
		Address address = (Address) obj;
		try
		{
			String query = "delete from address where email=? and id=?";
			PreparedStatement ps = conn.prepareStatement(query);
			ps.setString(1, address.getEmail());
			ps.setInt(2, address.getId());
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
		Address address = (Address) obj;
		try 
		{
			String query = "update address set address_type=?, street=?, city=?, state=?, pin_code=?, country=?, landmark=? where email=? and id=?";
			PreparedStatement ps = conn.prepareStatement(query);
			ps.setString(1, address.getAddressType());
			ps.setString(2, address.getStreet());
			ps.setString(3, address.getCity());
			ps.setString(4, address.getState());
			ps.setString(5, address.getPinCode());
			ps.setString(6, address.getCountry());
			ps.setString(7, address.getLandmark());
			ps.setString(8, address.getEmail());
			ps.setInt(9, address.getId());
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
