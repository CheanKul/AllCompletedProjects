package com.pojo;
// Generated 22 May, 2018 11:41:46 AM by Hibernate Tools 5.2.8.Final

import java.util.HashSet;
import java.util.Set;

/**
 * Machinary generated by hbm2java
 */
public class Machinary implements java.io.Serializable {

	private Integer machineId;
	private Category category;
	private String machineName;
	private int engineHp;
	private String engineRpm;
	private String gears;
	private String speed;
	private String frontTyre;
	private String rearTyre;
	private String liftCapacity;
	private String fuelCapacity;
	private byte[] image;
	private Set demos = new HashSet(0);

	public Machinary() {
	}

	public Machinary(Category category, String machineName, int engineHp, String engineRpm, String gears, String speed,
			String frontTyre, String rearTyre, String liftCapacity, String fuelCapacity, byte[] image) {
		this.category = category;
		this.machineName = machineName;
		this.engineHp = engineHp;
		this.engineRpm = engineRpm;
		this.gears = gears;
		this.speed = speed;
		this.frontTyre = frontTyre;
		this.rearTyre = rearTyre;
		this.liftCapacity = liftCapacity;
		this.fuelCapacity = fuelCapacity;
		this.image = image;
	}

	public Machinary(Category category, String machineName, int engineHp, String engineRpm, String gears, String speed,
			String frontTyre, String rearTyre, String liftCapacity, String fuelCapacity, byte[] image, Set demos) {
		this.category = category;
		this.machineName = machineName;
		this.engineHp = engineHp;
		this.engineRpm = engineRpm;
		this.gears = gears;
		this.speed = speed;
		this.frontTyre = frontTyre;
		this.rearTyre = rearTyre;
		this.liftCapacity = liftCapacity;
		this.fuelCapacity = fuelCapacity;
		this.image = image;
		this.demos = demos;
	}

	public Integer getMachineId() {
		return this.machineId;
	}

	public void setMachineId(Integer machineId) {
		this.machineId = machineId;
	}

	public Category getCategory() {
		return this.category;
	}

	public void setCategory(Category category) {
		this.category = category;
	}

	public String getMachineName() {
		return this.machineName;
	}

	public void setMachineName(String machineName) {
		this.machineName = machineName;
	}

	public int getEngineHp() {
		return this.engineHp;
	}

	public void setEngineHp(int engineHp) {
		this.engineHp = engineHp;
	}

	public String getEngineRpm() {
		return this.engineRpm;
	}

	public void setEngineRpm(String engineRpm) {
		this.engineRpm = engineRpm;
	}

	public String getGears() {
		return this.gears;
	}

	public void setGears(String gears) {
		this.gears = gears;
	}

	public String getSpeed() {
		return this.speed;
	}

	public void setSpeed(String speed) {
		this.speed = speed;
	}

	public String getFrontTyre() {
		return this.frontTyre;
	}

	public void setFrontTyre(String frontTyre) {
		this.frontTyre = frontTyre;
	}

	public String getRearTyre() {
		return this.rearTyre;
	}

	public void setRearTyre(String rearTyre) {
		this.rearTyre = rearTyre;
	}

	public String getLiftCapacity() {
		return this.liftCapacity;
	}

	public void setLiftCapacity(String liftCapacity) {
		this.liftCapacity = liftCapacity;
	}

	public String getFuelCapacity() {
		return this.fuelCapacity;
	}

	public void setFuelCapacity(String fuelCapacity) {
		this.fuelCapacity = fuelCapacity;
	}

	public byte[] getImage() {
		return this.image;
	}

	public void setImage(byte[] image) {
		this.image = image;
	}

	public Set getDemos() {
		return this.demos;
	}

	public void setDemos(Set demos) {
		this.demos = demos;
	}

}