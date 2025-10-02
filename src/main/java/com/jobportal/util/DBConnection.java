package com.jobportal.util;

import java.io.InputStream;
import java.sql.Connection;
import java.util.Properties;

import com.mysql.cj.jdbc.MysqlDataSource;

public class DBConnection 
{
	static Connection conn = null;
	
	public static Connection getConnection()
	{
//		Resources Loading from application properties
		String url="",username="",password="";
		try 
		{
//			Agar same package me file hai
//			InputStream is = DBConnection.class.getResourceAsStream("application.properties");
//			Agar same package me file ni hai
			InputStream is = DBConnection.class.getClassLoader().getResourceAsStream("com/jobportal/resources/application.properties");
			Properties props = new Properties();
			props.load(is);
			url = props.getProperty("datasource.url");
			username = props.getProperty("datasource.username");
			password = props.getProperty("datasource.password");
			
		} 
		catch (Exception e) 
		{
			e.printStackTrace();
		}

		//		Create Connection
		try 
		{
			MysqlDataSource ds = new MysqlDataSource();
			ds.setUrl(url);
			ds.setUser(username);
			ds.setPassword(password);
			conn = ds.getConnection();
			conn.setAutoCommit(false);
		} 
		catch (Exception e) 
		{
			e.printStackTrace();
		}
		return conn;
	}
}
