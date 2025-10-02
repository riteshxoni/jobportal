package com.jobportal.model;

public class Skill {
	
	private int id;
    private String email;
    private String skill;
    private String proficiency;
    
	public Skill() {
		super();
	}

	public Skill(int id, String email, String skill, String proficiency) {
		super();
		this.id = id;
		this.email = email;
		this.skill = skill;
		this.proficiency = proficiency;
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

	public String getSkill() {
		return skill;
	}

	public void setSkill(String skill) {
		this.skill = skill;
	}

	public String getProficiency() {
		return proficiency;
	}

	public void setProficiency(String proficiency) {
		this.proficiency = proficiency;
	}
	
	
}
