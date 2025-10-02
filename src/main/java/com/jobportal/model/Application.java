package com.jobportal.model;

public class Application 
{
	private int id;
	private String email;
	private int candidateId; 
    private String candidateCV; 
    private int jobId; 
    private int employerId; 
    private String status; 
    private String appliedAt;
    
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
	public int getCandidateId() {
		return candidateId;
	}
	public void setCandidateId(int candidateId) {
		this.candidateId = candidateId;
	}
	public String getCandidateCV() {
		return candidateCV;
	}
	public void setCandidateCV(String candidateCV) {
		this.candidateCV = candidateCV;
	}
	public int getJobId() {
		return jobId;
	}
	public void setJobId(int jobId) {
		this.jobId = jobId;
	}
	public int getEmployerId() {
		return employerId;
	}
	public void setEmployerId(int employerId) {
		this.employerId = employerId;
	}
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	}
	public String getAppliedAt() {
		return appliedAt;
	}
	public void setAppliedAt(String appliedAt) {
		this.appliedAt = appliedAt;
	}
}
