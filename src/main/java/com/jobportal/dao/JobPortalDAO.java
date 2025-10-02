package com.jobportal.dao;

import java.util.List;

public interface JobPortalDAO 
{
	void add(Object obj);
	Object get(String email);
	List<Object> getAll(String email);
	void delete(Object obj);
	void update(Object obj);
}
