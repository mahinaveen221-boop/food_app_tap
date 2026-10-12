package com.tap.DAO;

import com.tap.model.Order;
import java.util.List;

public interface OrderDAO {
    boolean addOrder(Order order);
    Order getOrderById(int orderId);
    List<Order> getOrdersByUserId(int userId);
    List<Order> getAllOrders();
}
