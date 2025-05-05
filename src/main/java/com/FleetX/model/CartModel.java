package com.FleetX.model;

import java.sql.Date;
import java.time.temporal.ChronoUnit;

public class CartModel {
    private int vehicleId;
    private String brand;
    private String model;
    private String imageUrl;
    private int dailyRate;
    private Date startDate;
    private Date endDate;
    private String pickupLocation;
    private int rentalDays;
    private int totalPrice;

    public CartModel() {
		// TODO Auto-generated constructor stub
	}

    public CartModel(int vehicleId, String brand, String model, String imageUrl, int dailyRate,
                    Date startDate, Date endDate, String pickupLocation) {
        this.vehicleId = vehicleId;
        this.brand = brand;
        this.model = model;
        this.imageUrl = imageUrl;
        this.dailyRate = dailyRate;
        this.startDate = startDate;
        this.endDate = endDate;
        this.pickupLocation = pickupLocation;
        calculateRentalInfo();
    }

    private void calculateRentalInfo() {
        this.rentalDays = (int) ChronoUnit.DAYS.between(startDate.toLocalDate(), endDate.toLocalDate());
        this.totalPrice = rentalDays * dailyRate;
    }

    // Getters and Setters

    public int getVehicleId() {
        return vehicleId;
    }

    public void setVehicleId(int vehicleId) {
        this.vehicleId = vehicleId;
    }

    public String getBrand() {
        return brand;
    }

    public void setBrand(String brand) {
        this.brand = brand;
    }

    public String getModel() {
        return model;
    }

    public void setModel(String model) {
        this.model = model;
    }

    public String getImageUrl() {
        return imageUrl;
    }

    public void setImageUrl(String imageUrl) {
        this.imageUrl = imageUrl;
    }

    public int getDailyRate() {
        return dailyRate;
    }

    public void setDailyRate(int dailyRate) {
        this.dailyRate = dailyRate;
    }

    public Date getStartDate() {
        return startDate;
    }

    public void setStartDate(Date startDate) {
        this.startDate = startDate;
    }

    public Date getEndDate() {
        return endDate;
    }

    public void setEndDate(Date endDate) {
        this.endDate = endDate;
    }

    public String getPickupLocation() {
        return pickupLocation;
    }

    public void setPickupLocation(String pickupLocation) {
        this.pickupLocation = pickupLocation;
    }

    public int getRentalDays() {
        return rentalDays;
    }

    public int getTotalPrice() {
        return totalPrice;
    }
}
