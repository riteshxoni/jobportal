package com.jobportal.model;

public class Project {
	 	private int id;  // Primary Key Auto Increment
	    private String email;
	    private String projectTitle;
	    private String description;     
	    private String technologies;
	    private String role;
	    private String startDate;
	    private String endDate;
	    private String projectUrl;
	    private String githubUrl;
	   
		public Project() {
			super();
		}
		
		public Project(int id, String email, String projectTitle, String description, String technologies, String role,
				String startDate, String endDate, String projectUrl, String githubUrl) {
			super();
			this.id = id;
			this.email = email;
			this.projectTitle = projectTitle;
			this.description = description;
			this.technologies = technologies;
			this.role = role;
			this.startDate = startDate;
			this.endDate = endDate;
			this.projectUrl = projectUrl;
			this.githubUrl = githubUrl;
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
		public String getProjectTitle() {
			return projectTitle;
		}
		public void setProjectTitle(String projectTitle) {
			this.projectTitle = projectTitle;
		}
		public String getDescription() {
			return description;
		}
		public void setDescription(String description) {
			this.description = description;
		}
		public String getTechnologies() {
			return technologies;
		}
		public void setTechnologies(String technologies) {
			this.technologies = technologies;
		}
		public String getRole() {
			return role;
		}
		public void setRole(String role) {
			this.role = role;
		}
		public String getStartDate() {
			return startDate;
		}
		public void setStartDate(String string) {
			this.startDate = string;
		}
		public String getEndDate() {
			return endDate;
		}
		public void setEndDate(String string) {
			this.endDate = string;
		}
		public String getProjectUrl() {
			return projectUrl;
		}
		public void setProjectUrl(String projectUrl) {
			this.projectUrl = projectUrl;
		}
		public String getGithubUrl() {
			return githubUrl;
		}
		public void setGithubUrl(String githubUrl) {
			this.githubUrl = githubUrl;
		}
	    
	    

}
