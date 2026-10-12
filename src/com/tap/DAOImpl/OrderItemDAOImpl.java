package com.tap.DAOImpl;

import com.tap.DAO.OrderItemDAO;
import com.tap.model.OrderItem;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import java.util.concurrent.ConcurrentHashMap;
import java.util.concurrent.atomic.AtomicInteger;

public class OrderItemDAOImpl implements OrderItemDAO {
    private static final Map<Integer, List<OrderItem>> orderItemMap = new ConcurrentHashMap<>();
    private static final AtomicInteger idGenerator = new AtomicInteger(8000);

    @Override
    public boolean addOrderItem(OrderItem orderItem) {
        if (orderItem == null) return false;
        if (orderItem.getOrderItemId() == 0) {
            orderItem.setOrderItemId(idGenerator.incrementAndGet());
        }
        orderItemMap.computeIfAbsent(orderItem.getOrderId(), k -> new ArrayList<>()).add(orderItem);
        return true;
    }

    @Override
    public List<OrderItem> getOrderItemsByOrderId(int orderId) {
        return orderItemMap.getOrDefault(orderId, new ArrayList<>());
    }
}
