package com.jobportal.model;

import java.sql.Date;

public class User 
{
	private int id;
    private String name;
    private String gender;
    private String dob;   // Date SQL ke liye
    private String email;
    private String phone;
    private String password;
    private String city;
    private String fields;
    private String title;
    private String nationality;
    private String maritalStatus;
    private String fatherName;
    private String motherName;
    private String language;
    private String heading;
    private String photo;
    private String resume;
    
	public User() {
	}	
	
	public User(int id, String name, String gender, String dob, String email, String phone, String password, String city,
			String fields, String title, String nationality, String maritalStatus, String fatherName, String motherName,
			String language, String heading, String photo, String resume) {
		this.id = id;
		this.name = name;
		this.gender = gender;
		this.dob = dob;
		this.email = email;
		this.phone = phone;
		this.password = password;
		this.city = city;
		this.fields = fields;
		this.title = title;
		this.nationality = nationality;
		this.maritalStatus = maritalStatus;
		this.fatherName = fatherName;
		this.motherName = motherName;
		this.language = language;
		this.heading = heading;
		this.photo = photo;
		this.resume = resume;
	}



	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getGender() {
		return gender;
	}
	public void setGender(String gender) {
		this.gender = gender;
	}
	public String getDob() {
		return dob;
	}
	public void setDob(String dob) {
		this.dob = dob;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getCity() {
		return city;
	}
	public void setCity(String city) {
		this.city = city;
	}
	public String getFields() {
		return fields;
	}
	public void setFields(String fields) {
		this.fields = fields;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getNationality() {
		return nationality;
	}
	public void setNationality(String nationality) {
		this.nationality = nationality;
	}
	public String getMaritalStatus() {
		return maritalStatus;
	}
	public void setMaritalStatus(String maritalStatus) {
		this.maritalStatus = maritalStatus;
	}
	public String getFatherName() {
		return fatherName;
	}
	public void setFatherName(String fatherName) {
		this.fatherName = fatherName;
	}
	public String getMotherName() {
		return motherName;
	}
	public void setMotherName(String motherName) {
		this.motherName = motherName;
	}
	public String getLanguage() {
		return language;
	}
	public void setLanguage(String language) {
		this.language = language;
	}
	public String getHeading() {
		return heading;
	}
	public void setHeading(String heading) {
		this.heading = heading;
	}
	public String getPhoto() {
		return photo;
	}
	public void setPhoto(String photo) {
		this.photo = photo;
	}
	public String getResume() {
		return resume;
	}
	public void setResume(String resume) {
		this.resume = resume;
	}
}
