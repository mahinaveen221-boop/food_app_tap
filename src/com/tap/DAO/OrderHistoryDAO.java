package com.tap.DAO;

import com.tap.model.OrderHistory;
import java.util.List;

public interface OrderHistoryDAO {
    boolean addOrderHistory(OrderHistory orderHistory);
    List<OrderHistory> getOrderHistoryByUserId(int userId);
    List<OrderHistory> getAllOrderHistory();
}
