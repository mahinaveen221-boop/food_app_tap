package com.tap.model;

import java.sql.Timestamp;

public class OrderHistory {
    private int orderHistoryId;
    private int userId;
    private int orderId;
    private String restaurantName;
    private double totalAmount;
    private String status;
    private Timestamp orderDate;

    public OrderHistory() {}

    public OrderHistory(int orderHistoryId, int userId, int orderId, String restaurantName, double totalAmount, String status, Timestamp orderDate) {
        this.orderHistoryId = orderHistoryId;
        this.userId = userId;
        this.orderId = orderId;
        this.restaurantName = restaurantName;
        this.totalAmount = totalAmount;
        this.status = status;
        this.orderDate = orderDate;
    }

    public OrderHistory(int userId, int orderId, String restaurantName, double totalAmount, String status) {
        this.userId = userId;
        this.orderId = orderId;
        this.restaurantName = restaurantName;
        this.totalAmount = totalAmount;
        this.status = status;
        this.orderDate = new Timestamp(System.currentTimeMillis());
    }

    public int getOrderHistoryId() { return orderHistoryId; }
    public void setOrderHistoryId(int orderHistoryId) { this.orderHistoryId = orderHistoryId; }

    public int getUserId() { return userId; }
    public void setUserId(int userId) { this.userId = userId; }

    public int getOrderId() { return orderId; }
    public void setOrderId(int orderId) { this.orderId = orderId; }

    public String getRestaurantName() { return restaurantName; }
    public void setRestaurantName(String restaurantName) { this.restaurantName = restaurantName; }

    public double getTotalAmount() { return totalAmount; }
    public void setTotalAmount(double totalAmount) { this.totalAmount = totalAmount; }

    public String getStatus() { return status; }
    public void setStatus(String status) { this.status = status; }

    public Timestamp getOrderDate() { return orderDate; }
    public void setOrderDate(Timestamp orderDate) { this.orderDate = orderDate; }
}
