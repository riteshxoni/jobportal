package com.jobportal.model;

public class SocialLink {
	
	private String email;
    private String platform;
    private String url;
    private String icon;
    
	public SocialLink() {
		super();
	}
	
	public SocialLink(String email, String platform, String url, String icon) {
		super();
		this.email = email;
		this.platform = platform;
		this.url = url;
		this.icon = icon;
	}
	
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getPlatform() {
		return platform;
	}
	public void setPlatform(String platform) {
		this.platform = platform;
	}
	public String getUrl() {
		return url;
	}
	public void setUrl(String url) {
		this.url = url;
	}
	public String getIcon() {
		return icon;
	}
	public void setIcon(String icon) {
		this.icon = icon;
	}

}
