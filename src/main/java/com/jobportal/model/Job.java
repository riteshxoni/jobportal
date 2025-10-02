package com.jobportal.model;

public class Job 
{
	private int id;
	private int employeeId;
	private String email;
	private String job_title;
	private String description;
	private String skills_required;
	private String experience_required;
	private String location;
	private String salary_range;
	private String job_type;
	private String expire_date;
	private String photo;
	private String created_at;
	
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public int getEmployeeId() {
		return employeeId;
	}
	public void setEmployeeId(int employeeId) {
		this.employeeId = employeeId;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getJob_title() {
		return job_title;
	}
	public void setJob_title(String job_title) {
		this.job_title = job_title;
	}
	public String getDescription() {
		return description;
	}
	public void setDescription(String description) {
		this.description = description;
	}
	public String getSkills_required() {
		return skills_required;
	}
	public void setSkills_required(String skills_required) {
		this.skills_required = skills_required;
	}
	public String getExperience_required() {
		return experience_required;
	}
	public void setExperience_required(String experience_required) {
		this.experience_required = experience_required;
	}
	public String getLocation() {
		return location;
	}
	public void setLocation(String location) {
		this.location = location;
	}
	public String getSalary_range() {
		return salary_range;
	}
	public void setSalary_range(String salary_range) {
		this.salary_range = salary_range;
	}
	public String getJob_type() {
		return job_type;
	}
	public void setJob_type(String job_type) {
		this.job_type = job_type;
	}
	public String getExpire_date() {
		return expire_date;
	}
	public void setExpire_date(String expire_date) {
		this.expire_date = expire_date;
	}
	public String getPhoto() {
		return photo;
	}
	public void setPhoto(String photo) {
		this.photo = photo;
	}
	public String getCreated_at() {
		return created_at;
	}
	public void setCreated_at(String created_at) {
		this.created_at = created_at;
	}
}
