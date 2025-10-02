package com.jobportal.service;

import java.util.ArrayList;
import java.util.List;

import com.jobportal.dao.AddressDAO;
import com.jobportal.dao.JobPortalDAO;
import com.jobportal.model.Address;

public class AddressService 
{
	private JobPortalDAO dao;
	
	public AddressService() {
		dao = new AddressDAO();
	}

	public void addAddress(Address address)
	{
		dao.add(address);
	}
	
	public List<Address> getAddresses(String email)
	{
		List<Address> addressList = new ArrayList<Address>();
		
		List<Object> list = dao.getAll(email);
		
		for(Object obj : list)
		{
			addressList.add((Address)obj);
		}
		return addressList;
	}
	
	public void updateAddress(Address address)
	{
		dao.update(address);
	}
	public void deleteAddress(Address address)
	{
		dao.delete(address);
	}
}

