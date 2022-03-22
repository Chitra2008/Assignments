package com.mastek.demo.model;

public class Bike {
	
	private int BikeId;
	private String BikeName;
	private String brand;
	private static int counter = 1001;
	
	
	public Bike() {
		this.BikeId = counter++;
	}


	public Bike(int bikeId, String bikeName, String brand) {
		super();
		BikeId = bikeId;
		BikeName = bikeName;
		this.brand = brand;
	}


	public Bike(String bikeName, String brand) {
		this();
		BikeName = bikeName;
		this.brand = brand;
	}


	public int getBikeId() {
		return BikeId;
	}


	public void setBikeId(int bikeId) {
		BikeId = bikeId;
	}


	public String getBikeName() {
		return BikeName;
	}


	public void setBikeName(String bikeName) {
		BikeName = bikeName;
	}


	public String getBrand() {
		return brand;
	}


	public void setBrand(String brand) {
		this.brand = brand;
	}


	@Override
	public String toString() {
		return "BikeId=" + BikeId + ", BikeName=" + BikeName + ", brand=" + brand;
	}
	
	
	
	

}
