package com.tap.DAOImpl;

import com.tap.DAO.OrderHistoryDAO;
import com.tap.model.OrderHistory;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import java.util.concurrent.ConcurrentHashMap;
import java.util.concurrent.atomic.AtomicInteger;

public class OrderHistoryDAOImpl implements OrderHistoryDAO {
    private static final Map<Integer, OrderHistory> historyMap = new ConcurrentHashMap<>();
    private static final AtomicInteger idGenerator = new AtomicInteger(9000);

    static {
        // Pre-seeded sample order history for user 1 (Naveen Kumar)
        long now = System.currentTimeMillis();
        OrderHistory h1 = new OrderHistory(9001, 1, 5001, "Aalishan Biryani & Grill", 560.0, "Delivered", new Timestamp(now - 86400000L));
        OrderHistory h2 = new OrderHistory(9002, 1, 5002, "Madurai Amma Mess", 420.0, "Delivered", new Timestamp(now - 172800000L));
        historyMap.put(h1.getOrderHistoryId(), h1);
        historyMap.put(h2.getOrderHistoryId(), h2);
    }

    @Override
    public boolean addOrderHistory(OrderHistory orderHistory) {
        if (orderHistory == null) return false;
        if (orderHistory.getOrderHistoryId() == 0) {
            orderHistory.setOrderHistoryId(idGenerator.incrementAndGet());
        }
        historyMap.put(orderHistory.getOrderHistoryId(), orderHistory);
        return true;
    }

    @Override
    public List<OrderHistory> getOrderHistoryByUserId(int userId) {
        List<OrderHistory> result = new ArrayList<>();
        for (OrderHistory h : historyMap.values()) {
            if (h.getUserId() == userId) {
                result.add(h);
            }
        }
        // Sort descending by order date
        result.sort((a, b) -> b.getOrderDate().compareTo(a.getOrderDate()));
        return result;
    }

    @Override
    public List<OrderHistory> getAllOrderHistory() {
        return new ArrayList<>(historyMap.values());
    }
}
