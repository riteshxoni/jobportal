package com.jobportal.model;

public class Education {
	
	private int id;
    private String email;
    private String schoolUniversity;
    private String courseDegree;
    private String year;
    private String result;
    
	public Education() {
		super();
	}

	public Education(int id, String email, String schoolUniversity, String courseDegree, String year, String result) {
		super();
		this.id = id;
		this.email = email;
		this.schoolUniversity = schoolUniversity;
		this.courseDegree = courseDegree;
		this.year = year;
		this.result = result;
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
	public String getSchoolUniversity() {
		return schoolUniversity;
	}
	public void setSchoolUniversity(String schoolUniversity) {
		this.schoolUniversity = schoolUniversity;
	}
	public String getCourseDegree() {
		return courseDegree;
	}
	public void setCourseDegree(String courseDegree) {
		this.courseDegree = courseDegree;
	}
	public String getYear() {
		return year;
	}
	public void setYear(String year) {
		this.year = year;
	}
	public String getResult() {
		return result;
	}
	public void setResult(String result) {
		this.result = result;
	}
}
