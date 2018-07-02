package com.pojo;
// Generated 22 May, 2018 11:41:46 AM by Hibernate Tools 5.2.8.Final

import java.util.HashSet;
import java.util.Set;

/**
 * Farmer generated by hbm2java
 */
public class Farmer implements java.io.Serializable {

	private Integer farmerId;
	private String farmerName;
	private String farmerEmail;
	private String farmerUsername;
	private String farmerPassword;
	private String farmerMobile;
	private String gender;
	private Integer totalLand;
	private String soilType;
	private String crops;
	private String address;
	private String state;
	private String city;
	private String block;
	private String zip;
	private Set demos = new HashSet(0);
	private Set purchases = new HashSet(0);
	private Set soilTests = new HashSet(0);
	private Set carts = new HashSet(0);

	public Farmer() {
	}

	public Farmer(String farmerName, String farmerEmail, String farmerUsername, String farmerPassword,
			String farmerMobile, String gender, String address, String state, String city, String zip) {
		this.farmerName = farmerName;
		this.farmerEmail = farmerEmail;
		this.farmerUsername = farmerUsername;
		this.farmerPassword = farmerPassword;
		this.farmerMobile = farmerMobile;
		this.gender = gender;
		this.address = address;
		this.state = state;
		this.city = city;
		this.zip = zip;
	}

	public Farmer(String farmerName, String farmerEmail, String farmerUsername, String farmerPassword,
			String farmerMobile, String gender, Integer totalLand, String soilType, String crops, String address,
			String state, String city, String block, String zip, Set demos, Set purchases, Set soilTests, Set carts) {
		this.farmerName = farmerName;
		this.farmerEmail = farmerEmail;
		this.farmerUsername = farmerUsername;
		this.farmerPassword = farmerPassword;
		this.farmerMobile = farmerMobile;
		this.gender = gender;
		this.totalLand = totalLand;
		this.soilType = soilType;
		this.crops = crops;
		this.address = address;
		this.state = state;
		this.city = city;
		this.block = block;
		this.zip = zip;
		this.demos = demos;
		this.purchases = purchases;
		this.soilTests = soilTests;
		this.carts = carts;
	}

	public Integer getFarmerId() {
		return this.farmerId;
	}

	public void setFarmerId(Integer farmerId) {
		this.farmerId = farmerId;
	}

	public String getFarmerName() {
		return this.farmerName;
	}

	public void setFarmerName(String farmerName) {
		this.farmerName = farmerName;
	}

	public String getFarmerEmail() {
		return this.farmerEmail;
	}

	public void setFarmerEmail(String farmerEmail) {
		this.farmerEmail = farmerEmail;
	}

	public String getFarmerUsername() {
		return this.farmerUsername;
	}

	public void setFarmerUsername(String farmerUsername) {
		this.farmerUsername = farmerUsername;
	}

	public String getFarmerPassword() {
		return this.farmerPassword;
	}

	public void setFarmerPassword(String farmerPassword) {
		this.farmerPassword = farmerPassword;
	}

	public String getFarmerMobile() {
		return this.farmerMobile;
	}

	public void setFarmerMobile(String farmerMobile) {
		this.farmerMobile = farmerMobile;
	}

	public String getGender() {
		return this.gender;
	}

	public void setGender(String gender) {
		this.gender = gender;
	}

	public Integer getTotalLand() {
		return this.totalLand;
	}

	public void setTotalLand(Integer totalLand) {
		this.totalLand = totalLand;
	}

	public String getSoilType() {
		return this.soilType;
	}

	public void setSoilType(String soilType) {
		this.soilType = soilType;
	}

	public String getCrops() {
		return this.crops;
	}

	public void setCrops(String crops) {
		this.crops = crops;
	}

	public String getAddress() {
		return this.address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public String getState() {
		return this.state;
	}

	public void setState(String state) {
		this.state = state;
	}

	public String getCity() {
		return this.city;
	}

	public void setCity(String city) {
		this.city = city;
	}

	public String getBlock() {
		return this.block;
	}

	public void setBlock(String block) {
		this.block = block;
	}

	public String getZip() {
		return this.zip;
	}

	public void setZip(String zip) {
		this.zip = zip;
	}

	public Set getDemos() {
		return this.demos;
	}

	public void setDemos(Set demos) {
		this.demos = demos;
	}

	public Set getPurchases() {
		return this.purchases;
	}

	public void setPurchases(Set purchases) {
		this.purchases = purchases;
	}

	public Set getSoilTests() {
		return this.soilTests;
	}

	public void setSoilTests(Set soilTests) {
		this.soilTests = soilTests;
	}

	public Set getCarts() {
		return this.carts;
	}

	public void setCarts(Set carts) {
		this.carts = carts;
	}

}