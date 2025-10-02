package com.jobportal.model;

public class Address {
	private int id;                // Primary Key Auto Increment
    private String email;
    private String addressType;
    private String street;
    private String city;
    private String state;
    private String pinCode;
    private String country;
    private String landmark;
    
	public Address() {
		super();
	}

	public Address(int id, String email, String addressType, String street, String city, String state, String pinCode,
			String country, String landmark) {
		super();
		this.id = id;
		this.email = email;
		this.addressType = addressType;
		this.street = street;
		this.city = city;
		this.state = state;
		this.pinCode = pinCode;
		this.country = country;
		this.landmark = landmark;
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
	public String getAddressType() {
		return addressType;
	}
	public void setAddressType(String addressType) {
		this.addressType = addressType;
	}
	public String getStreet() {
		return street;
	}
	public void setStreet(String street) {
		this.street = street;
	}
	public String getCity() {
		return city;
	}
	public void setCity(String city) {
		this.city = city;
	}
	public String getState() {
		return state;
	}
	public void setState(String state) {
		this.state = state;
	}
	public String getPinCode() {
		return pinCode;
	}
	public void setPinCode(String pinCode) {
		this.pinCode = pinCode;
	}
	public String getCountry() {
		return country;
	}
	public void setCountry(String country) {
		this.country = country;
	}
	public String getLandmark() {
		return landmark;
	}
	public void setLandmark(String landmark) {
		this.landmark = landmark;
	}

    
}
