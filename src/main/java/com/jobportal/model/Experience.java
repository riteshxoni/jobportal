package com.jobportal.model;

public class Experience {
	
	private int id;  // Primary Key Auto Increment
    private String email;
    private String jobTitle;
    private String companyName;
    private String location;
    private String startDate;
    private String endDate;
    private String description;   // text -> String
    private String skillsUsed;
    
	public Experience() {
		super();
	}

	public Experience(int id, String email, String jobTitle, String companyName, String location, String startDate,
			String endDate, String description, String skillsUsed) {
		super();
		this.id = id;
		this.email = email;
		this.jobTitle = jobTitle;
		this.companyName = companyName;
		this.location = location;
		this.startDate = startDate;
		this.endDate = endDate;
		this.description = description;
		this.skillsUsed = skillsUsed;
	}
	
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getJobTitle() {
		return jobTitle;
	}
	public void setJobTitle(String jobTitle) {
		this.jobTitle = jobTitle;
	}
	public String getCompanyName() {
		return companyName;
	}
	public void setCompanyName(String companyName) {
		this.companyName = companyName;
	}
	public String getLocation() {
		return location;
	}
	public void setLocation(String location) {
		this.location = location;
	}
	public String getStartDate() {
		return startDate;
	}
	public void setStartDate(String startDate) {
		this.startDate = startDate;
	}
	public String getEndDate() {
		return endDate;
	}
	public void setEndDate(String endDate) {
		this.endDate = endDate;
	}
	public String getDescription() {
		return description;
	}
	public void setDescription(String description) {
		this.description = description;
	}
	public String getSkillsUsed() {
		return skillsUsed;
	}
	public void setSkillsUsed(String skillsUsed) {
		this.skillsUsed = skillsUsed;
	}
	
}
