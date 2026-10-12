package com.tap.model;

public class OrderItem {
    private int orderItemId;
    private int orderId;
    private int menuId;
    private String itemName;
    private double price;
    private int quantity;
    private double itemTotal;

    public OrderItem() {}

    public OrderItem(int orderItemId, int orderId, int menuId, String itemName, double price, int quantity, double itemTotal) {
        this.orderItemId = orderItemId;
        this.orderId = orderId;
        this.menuId = menuId;
        this.itemName = itemName;
        this.price = price;
        this.quantity = quantity;
        this.itemTotal = itemTotal;
    }

    public OrderItem(int orderId, int menuId, String itemName, double price, int quantity) {
        this.orderId = orderId;
        this.menuId = menuId;
        this.itemName = itemName;
        this.price = price;
        this.quantity = quantity;
        this.itemTotal = price * quantity;
    }

    public int getOrderItemId() { return orderItemId; }
    public void setOrderItemId(int orderItemId) { this.orderItemId = orderItemId; }

    public int getOrderId() { return orderId; }
    public void setOrderId(int orderId) { this.orderId = orderId; }

    public int getMenuId() { return menuId; }
    public void setMenuId(int menuId) { this.menuId = menuId; }

    public String getItemName() { return itemName; }
    public void setItemName(String itemName) { this.itemName = itemName; }

    public double getPrice() { return price; }
    public void setPrice(double price) { 
        this.price = price; 
        this.itemTotal = price * quantity;
    }

    public int getQuantity() { return quantity; }
    public void setQuantity(int quantity) { 
        this.quantity = quantity; 
        this.itemTotal = price * quantity;
    }

    public double getItemTotal() { return itemTotal; }
    public void setItemTotal(double itemTotal) { this.itemTotal = itemTotal; }
}
