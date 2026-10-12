package com.tap.DAOImpl;

import com.tap.DAO.OrderDAO;
import com.tap.model.Order;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import java.util.concurrent.ConcurrentHashMap;
import java.util.concurrent.atomic.AtomicInteger;

public class OrderDAOImpl implements OrderDAO {
    private static final Map<Integer, Order> orderMap = new ConcurrentHashMap<>();
    private static final AtomicInteger idGenerator = new AtomicInteger(5000);

    @Override
    public boolean addOrder(Order order) {
        if (order == null) return false;
        if (order.getOrderId() == 0) {
            order.setOrderId(idGenerator.incrementAndGet());
        }
        orderMap.put(order.getOrderId(), order);
        return true;
    }

    @Override
    public Order getOrderById(int orderId) {
        return orderMap.get(orderId);
    }

    @Override
    public List<Order> getOrdersByUserId(int userId) {
        List<Order> userOrders = new ArrayList<>();
        for (Order o : orderMap.values()) {
            if (o.getUserId() == userId) {
                userOrders.add(o);
            }
        }
        return userOrders;
    }

    @Override
    public List<Order> getAllOrders() {
        return new ArrayList<>(orderMap.values());
    }
}
