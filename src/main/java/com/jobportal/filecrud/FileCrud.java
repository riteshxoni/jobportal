package com.jobportal.filecrud;

import java.io.File;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;

import com.jobportal.model.User;

public class FileCrud 
{
	private DiskFileItemFactory factory;
	private ServletFileUpload upload;
	private List<FileItem> items;
	private FileItem item;
	public static String PROFILE_PATH  = "C:\\Users\\Ritesh\\Desktop\\Ritesh-Job-Portal\\JOB_PORTAL\\src\\main\\webapp\\images\\profile_pics\\";
	public static String RESUME_PATH = "C:\\Users\\Ritesh\\Desktop\\Ritesh-Job-Portal\\JOB_PORTAL\\src\\main\\webapp\\Uploads\\resumes\\";
	HttpSession session;
	public FileCrud(HttpServletRequest req)
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

	public String insertFile()
	{
		File file = new File(item.getName());
		String profile = generateUniqueName(file);
		
		File f1 = new File(PROFILE_PATH  + profile);
		try 
		{
			item.write(f1);
		} 
		catch (Exception e) 
		{
			e.printStackTrace();
		}
		return profile;
	}
	
	public String generateUniqueName(File file)
	{
		User user = (User) session.getAttribute("currentUser");
		int index = user.getName().indexOf(" ");
		String name="";
		if(index == -1)
		{
			name = user.getName();
		}
		else 
		{
			name = user.getName().substring(0, index);
		}
		
		String fileExtention = file.getName().substring(file.getName().lastIndexOf('.'));
		
		name = user.getId() + name + System.currentTimeMillis() + fileExtention;
		
		return name;
		
	}
	
	public String uploadResume()
	{
		File file = new File(item.getName());
		String resume = generateUniqueResume(file);
		File f1 = new File(RESUME_PATH + resume);
		try 
		{
			item.write(f1);
		} 
		catch (Exception e) 
		{
			e.printStackTrace();
		}
		return resume;
	}
	
	public String generateUniqueResume(File file)
	{
		String name = "";
		User user = (User) session.getAttribute("currentUser");
		int index = user.getName().indexOf(" ");
		if(index==-1)
		{
			name = user.getName();
		}
		else
		{
			name = user.getName().substring(0,index);
		}
		String fileExtention = file.getName().substring(file.getName().lastIndexOf("."));
		name = user.getId()+name+"Resume"+System.currentTimeMillis()+fileExtention;
		return name;
	}
	
	
}

