package com.jobportal.controller;

import java.io.File;
import java.io.IOException;
import java.time.LocalDate;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.itextpdf.io.image.ImageData;
import com.itextpdf.io.image.ImageDataFactory;
import com.itextpdf.kernel.colors.ColorConstants;
import com.itextpdf.kernel.pdf.PdfDocument;
import com.itextpdf.kernel.pdf.PdfWriter;
import com.itextpdf.kernel.pdf.canvas.draw.ILineDrawer;
import com.itextpdf.kernel.pdf.canvas.draw.SolidLine;
import com.itextpdf.layout.Document;
import com.itextpdf.layout.borders.Border;
import com.itextpdf.layout.element.Cell;
import com.itextpdf.layout.element.Image;
import com.itextpdf.layout.element.LineSeparator;
import com.itextpdf.layout.element.Paragraph;
import com.itextpdf.layout.element.Table;
import com.itextpdf.layout.properties.TextAlignment;
import com.itextpdf.layout.element.List;
import com.itextpdf.layout.element.ListItem;
import com.jobportal.filecrud.FileCrud;
import com.jobportal.model.Education;
import com.jobportal.model.Experience;
import com.jobportal.model.Project;
import com.jobportal.model.Skill;
import com.jobportal.model.User;

@WebServlet("/ResumeBuilder")
public class ResumeBuilder extends HttpServlet 
{
	@SuppressWarnings("unchecked")
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		HttpSession session = req.getSession();
		User user = (User) session.getAttribute("currentUser");
		ArrayList<Skill> skills = (ArrayList<Skill>) session.getAttribute("skills");
		ArrayList<Experience> experiences = (ArrayList<Experience>) session.getAttribute("experience");
		ArrayList<Project> projects = (ArrayList<Project>) session.getAttribute("project");
		ArrayList<Education> educations = (ArrayList<Education>) session.getAttribute("education");
		
		resp.setContentType("application/pdf");
		resp.setHeader("Content-Disposition", "attachment; filename="+user.getName()+"_CV.pdf");
		
//		1. Create PDF Writer and Document
		PdfWriter writer = new PdfWriter(resp.getOutputStream());
		PdfDocument pdfDoc = new PdfDocument(writer);
		Document document = new Document(pdfDoc);
		
//		Add Photo
		File photoPath = new File(FileCrud.PROFILE_PATH+user.getPhoto());
		if(photoPath.exists())
		{
			ImageData imgData = ImageDataFactory.create(FileCrud.PROFILE_PATH+user.getPhoto());
			Image image = new Image(imgData);
			image.scaleToFit(50, 50);
			image.setMarginBottom(10);
			document.add(image);
		}
		
//		Name, Title, Email, Phone , City
		if(user.getName()!=null)
		{
			Paragraph name = new Paragraph(user.getName());
			name.setFontSize(15);
			name.setBold();
			document.add(name);
		}
		
		if(user.getTitle()!=null)
		{
			Paragraph title = new Paragraph(user.getTitle());
			document.add(title);
		}
		
		if(user.getEmail()!=null)
		{
			Paragraph email = new Paragraph(user.getEmail());
			document.add(email);
		}
		
		if(user.getPhone()!=null)
		{
			Paragraph phone = new Paragraph(user.getPhone());
			document.add(phone);
		}
		
		
		
		if(user.getCity()!=null)
		{
			Paragraph city = new Paragraph(user.getCity());
			document.add(city);
		}
		
		
//		Add Line
		ILineDrawer drawer = new SolidLine();
		LineSeparator line = new LineSeparator(drawer);
		document.add(line);
		
//		Add Objective
		Paragraph objectiveTitle = new Paragraph("Objective");
		objectiveTitle.setBold();
		objectiveTitle.setFontSize(15);
		objectiveTitle.setUnderline();
		document.add(objectiveTitle);
		
		if(user.getHeading()!=null)
		{
			Paragraph objective = new Paragraph(user.getHeading());
			document.add(objective);
		}
		document.add(line);
		
//		Add Skills
		Paragraph skillTitle = new Paragraph("Skills");
		skillTitle.setBold();
		skillTitle.setFontSize(15);
		skillTitle.setUnderline();
		document.add(skillTitle);
		
		if(skills!=null && !skills.isEmpty())
		{
			List skillData = new List();
			for(Skill skill : skills)
			{
				skillData.add(skill.getSkill() +" | "+ skill.getProficiency());
			}
			document.add(skillData);
		}
		
		document.add(line);
		
//		Add Experience
		Paragraph experienceTitle = new Paragraph("Experience");
		experienceTitle.setBold();
		experienceTitle.setFontSize(15);
		experienceTitle.setUnderline();
		document.add(experienceTitle);
		
		Table experience = new Table(6);
		experience.useAllAvailableWidth();
		String[] expHeading = {"Job Title","Company Name","Location","Duration","Skills Used","Description"};
		for(String heading : expHeading)
		{
			Paragraph h = new Paragraph(heading);
			h.setBold();
			h.setFontColor(ColorConstants.DARK_GRAY);
			experience.addCell(h).setTextAlignment(TextAlignment.CENTER);
		}
		if(experiences!=null && !experiences.isEmpty())
		{
			for(Experience exp : experiences)
			{
				experience.addCell(exp.getJobTitle());
				experience.addCell(exp.getCompanyName());
				experience.addCell(exp.getLocation());
				experience.addCell(exp.getStartDate()+" - "+exp.getEndDate());
				experience.addCell(exp.getSkillsUsed());
				experience.addCell(exp.getDescription());
			}
			document.add(experience);
		}
		document.add(line);
		
		
//		Add Projects
		Paragraph projectTitle = new Paragraph("Projects");
		projectTitle.setBold();
		projectTitle.setFontSize(15);
		projectTitle.setUnderline();
		document.add(projectTitle);
		
		if(projects!=null && !projects.isEmpty())
		{
			List projectData = new List();
			projectData.setSymbolIndent(10);
			for(Project pro : projects)
			{
				ListItem item1 = new ListItem("Project Title : " + pro.getProjectTitle());
				item1.setListSymbol("✔");
				
				List nested = new List();
				nested.setListSymbol("•");
				nested.setSymbolIndent(20);
				nested.add("Your Role : " + pro.getRole());
				nested.add("Technologies : " + pro.getTechnologies());
				nested.add("Duration : From " + pro.getStartDate() + " To " + pro.getEndDate());
				nested.add("Project Url : " + pro.getProjectUrl());
				nested.add("GithubUrl : " + pro.getGithubUrl());
				nested.add("Description : " + pro.getDescription()); 
				
				item1.add(nested).setMarginBottom(10);
				projectData.add(item1);
			
			}
			document.add(projectData);
		}
		document.add(line);
		
//		Add Education
		Paragraph educationTitle = new Paragraph("Education");
		educationTitle.setBold();
		educationTitle.setFontSize(15);
		educationTitle.setUnderline();
		document.add(educationTitle);
		
		Table education = new Table(4);
		education.useAllAvailableWidth();
		String[] eduHeading = {"School/University","Course/Degree","Year","Result"};
		for(String heading : eduHeading)
		{
			Paragraph h = new Paragraph(heading);
			h.setBold();
			h.setFontColor(ColorConstants.DARK_GRAY);
			education.addCell(h);
		}
		if(educations!=null && !educations.isEmpty())
		{
			for(Education edu : educations)
			{
				education.addCell(edu.getSchoolUniversity());
				education.addCell(edu.getCourseDegree());
				education.addCell(edu.getYear());
				education.addCell(edu.getResult());
			}
			document.add(education);
		}

		document.add(line);
		
//		Contact Details
		Paragraph contactTitle = new Paragraph("Contact Details");
		contactTitle.setBold();
		contactTitle.setFontSize(15);
		contactTitle.setUnderline();
		document.add(contactTitle);
		
		Table contact = new Table(2);
		contact.useAllAvailableWidth();
		Paragraph fullname = new Paragraph("Full Name").setBold().setFontColor(ColorConstants.GRAY);
		contact.addCell(fullname);
		contact.addCell(user.getName()!=null?user.getName():"");
		
		Paragraph gender = new Paragraph("Gender").setBold().setFontColor(ColorConstants.GRAY);
		contact.addCell(gender);
		contact.addCell(user.getGender()!=null?user.getGender():"");
		
		Paragraph dob = new Paragraph("Date Of Birth").setBold().setFontColor(ColorConstants.GRAY);
		contact.addCell(dob);
		contact.addCell(user.getDob()!=null?user.getDob():"");
		
		Paragraph nationality = new Paragraph("Nationality").setBold().setFontColor(ColorConstants.GRAY);
		contact.addCell(nationality);
		contact.addCell(user.getNationality()!=null?user.getNationality():"");
		
		Paragraph maritalStatus = new Paragraph("Marital Status").setBold().setFontColor(ColorConstants.GRAY);
		contact.addCell(maritalStatus);
		contact.addCell(user.getMaritalStatus()!=null?user.getMaritalStatus():"");
		
		Paragraph fatherName = new Paragraph("Father`s Name").setBold().setFontColor(ColorConstants.GRAY);
		contact.addCell(fatherName);
		contact.addCell(user.getFatherName()!=null?user.getFatherName():"");
		
		Paragraph motherName = new Paragraph("Mother`s Name").setBold().setFontColor(ColorConstants.GRAY);
		contact.addCell(motherName);
		contact.addCell(user.getMotherName()!=null?user.getMotherName():"");
		
		Paragraph language = new Paragraph("Language").setBold().setFontColor(ColorConstants.GRAY);
		contact.addCell(language);
		contact.addCell(user.getLanguage()!=null?user.getLanguage():"");
		
		document.add(contact);
		document.add(line);
		
//		Add Declaration
		Paragraph declarationTitle = new Paragraph("Declaration");
		declarationTitle.setBold();
		declarationTitle.setFontSize(15);
		declarationTitle.setUnderline();
		document.add(declarationTitle);
		
		Paragraph declaration = new Paragraph("I hereby declare that the above-mentioned information is true and correct to the best of my knowledge and belief.");
		document.add(declaration);
		
		Table dateSign = new Table(2);
		dateSign.useAllAvailableWidth();
		
		LocalDate date = LocalDate.now();
		
		dateSign.addCell(new Cell().add(new Paragraph("Date")).setBorder(Border.NO_BORDER));
		dateSign.addCell(new Cell().add(new Paragraph("Signature")).setBorder(Border.NO_BORDER).setTextAlignment(TextAlignment.CENTER));
		dateSign.addCell(new Cell().add(new Paragraph(""+date)).setBorder(Border.NO_BORDER));
		dateSign.addCell(new Cell().add(new Paragraph("")).setBorder(Border.NO_BORDER));
		document.add(dateSign);
//		1. Close PDF Writer and Document to create 
		document.close();
		pdfDoc.close();
		writer.close();
	}
}
