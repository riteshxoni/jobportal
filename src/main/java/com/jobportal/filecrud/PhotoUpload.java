package com.jobportal.filecrud;

import java.io.File;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;

import com.jobportal.model.Employer;

public class PhotoUpload 
{
	public static String EMPLOYER_PATH = "C:\\Users\\Ritesh\\Desktop\\Ritesh-Job-Portal\\JOB_PORTAL\\src\\main\\webapp\\images\\employer_pics\\";
	DiskFileItemFactory factory;
	ServletFileUpload upload;
	List<FileItem> items;
	FileItem item;
	HttpSession session;
	
	public PhotoUpload(HttpServletRequest req) 
	{
		session = req.getSession();
		try 
		{
			factory = new DiskFileItemFactory();
			upload = new ServletFileUpload(factory);
			items = upload.parseRequest(req);
			item = items.get(0);			
		} 
		catch (Exception e) 
		{
			e.printStackTrace();
		}
	}
	
	public String upload()
	{
		String photo = generateUniqueName();
		
		File f1 = new File(EMPLOYER_PATH+photo);
		try {
			item.write(f1);
		} 
		catch (Exception e) {
			e.printStackTrace();
		}
		return photo;
	}
	
	public String generateUniqueName()
	{
		Employer emp = (Employer) session.getAttribute("currentEmployer");
		String cn = emp.getCompany_name();
		
		if(cn.indexOf(" ") != -1)
		{
			cn = cn.substring(0,cn.indexOf(" "));
		}
		
		String fileName = item.getName();
		String ext = fileName.substring(fileName.lastIndexOf("."));
		
		return cn + System.currentTimeMillis() + ext;
	}

}
