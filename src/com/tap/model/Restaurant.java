package com.tap.model;

public class Restaurant {
    private int restaurantId;
    private String name;
    private String cuisineType;
    private String deliveryTime;
    private String address;
    private double rating;
    private String imagePath;
    private boolean isActive;
    private boolean isOpen;
    private String stateCuisine;
    private String cityLocation;

    public Restaurant() {}

    public Restaurant(int restaurantId, String name, String cuisineType, String deliveryTime, String address, double rating, String imagePath, boolean isActive, boolean isOpen, String stateCuisine, String cityLocation) {
        this.restaurantId = restaurantId;
        this.name = name;
        this.cuisineType = cuisineType;
        this.deliveryTime = deliveryTime;
        this.address = address;
        this.rating = rating;
        this.imagePath = imagePath;
        this.isActive = isActive;
        this.isOpen = isOpen;
        this.stateCuisine = stateCuisine;
        this.cityLocation = cityLocation;
    }

    public int getRestaurantId() { return restaurantId; }
    public void setRestaurantId(int restaurantId) { this.restaurantId = restaurantId; }

    public String getName() { return name; }
    public void setName(String name) { this.name = name; }

    public String getCuisineType() { return cuisineType; }
    public void setCuisineType(String cuisineType) { this.cuisineType = cuisineType; }

    public String getDeliveryTime() { return deliveryTime; }
    public void setDeliveryTime(String deliveryTime) { this.deliveryTime = deliveryTime; }

    public String getAddress() { return address; }
    public void setAddress(String address) { this.address = address; }

    public double getRating() { return rating; }
    public void setRating(double rating) { this.rating = rating; }

    public String getImagePath() { return imagePath; }
    public void setImagePath(String imagePath) { this.imagePath = imagePath; }

    public boolean isActive() { return isActive; }
    public void setActive(boolean active) { isActive = active; }

    public boolean isOpen() { return isOpen; }
    public void setOpen(boolean open) { isOpen = open; }

    public String getStateCuisine() { return stateCuisine; }
    public void setStateCuisine(String stateCuisine) { this.stateCuisine = stateCuisine; }

    public String getCityLocation() { return cityLocation; }
    public void setCityLocation(String cityLocation) { this.cityLocation = cityLocation; }
}
