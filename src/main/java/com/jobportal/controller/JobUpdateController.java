package com.jobportal.controller;

import java.io.File;
import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;

import com.jobportal.model.Employer;
import com.jobportal.model.Job;
import com.jobportal.service.JobsService;

@MultipartConfig
@WebServlet("/JobUpdateController")
public class JobUpdateController extends HttpServlet
{
private static final String UPLOAD_PATH = "C:\\Users\\Ritesh\\Desktop\\Ritesh-Job-Portal\\JOB_PORTAL\\src\\main\\webapp\\images\\jobs_pics\\";
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		Job job = new Job();
		
		HttpSession session = req.getSession();
		Employer emp = (Employer) session.getAttribute("currentEmployer");
		
		job.setEmail(emp.getEmail());
		job.setEmployeeId(emp.getId());
		
		try
		{
			DiskFileItemFactory factory = new DiskFileItemFactory();
			ServletFileUpload upload = new ServletFileUpload(factory);
			List<FileItem> list = upload.parseRequest(req);
			
			if(list!=null && !list.isEmpty())
			{
				for(FileItem item : list)
				{
					if(item.isFormField())
					{
						String inputName = item.getFieldName();
						String inputValue = item.getString("UTF-8");
						
						switch(inputName)
						{
							case "id":
								job.setId(Integer.parseInt(inputValue));
								break;
		                    case "job_title":  
		                    	job.setJob_title(inputValue);
		                    	break;
		                    case "description": 
		                    	job.setDescription(inputValue);
		                    	break;
		                    case "skills_required":  
		                    	job.setSkills_required(inputValue);
		                    	break;
		                    case "experience_required":  
		                    	job.setExperience_required(inputValue);
		                    	break;
		                    case "location": 
		                    	job.setLocation(inputValue);
		                    	break;
		                    case "salary_range": 
		                    	job.setSalary_range(inputValue);
		                    	break;
		                    case "job_type":  
		                    	job.setJob_type(inputValue);
		                    	break;
		                    case "expire_date": 
		                    	job.setExpire_date(inputValue);
		                    	break;
						}
					}
					else
					{
						String filename = item.getName();
						String ext = filename.substring(filename.lastIndexOf("."));
						String name = System.currentTimeMillis()+ext;
						File f = new File(UPLOAD_PATH+name);
						item.write(f);
						
						job.setPhoto(name);
					}
					
				}
			}
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		
		JobsService service = new JobsService();
		if(job.getPhoto()==null)
		{
			Job job2 = service.getJob(job.getId());
			job.setPhoto(job2.getPhoto());
		}
		
		service.updateJob(job);
		
		List<Job> list = service.getJobs(job.getEmail());
		session.setAttribute("jobs", list);
		
		resp.sendRedirect(req.getContextPath()+"/employer/profile.jsp");
	}
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		if(req.getParameter("method")==null)
		{
			
		}
		else if(req.getParameter("method").equals("DELETE"))
		{
			doDelete(req, resp);
		}
	}
	@Override
	protected void doDelete(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		int id = Integer.parseInt(req.getParameter("id"));
		
		JobsService service = new JobsService();
		
		Job job = service.getJob(id);
		service.deleteJob(job);
		
		HttpSession session = req.getSession();
		List<Job> list = service.getJobs(job.getEmail());
		session.setAttribute("jobs", list);
		
		resp.sendRedirect(req.getContextPath()+"/employer/profile.jsp");
	}
}
