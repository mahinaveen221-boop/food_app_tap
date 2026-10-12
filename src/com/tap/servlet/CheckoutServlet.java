package com.tap.servlet;

import com.tap.DAO.OrderDAO;
import com.tap.DAO.OrderHistoryDAO;
import com.tap.DAO.OrderItemDAO;
import com.tap.DAO.RestaurantDAO;
import com.tap.DAOImpl.OrderDAOImpl;
import com.tap.DAOImpl.OrderHistoryDAOImpl;
import com.tap.DAOImpl.OrderItemDAOImpl;
import com.tap.DAOImpl.RestaurantDAOImpl;
import com.tap.model.CartItem;
import com.tap.model.Order;
import com.tap.model.OrderHistory;
import com.tap.model.OrderItem;
import com.tap.model.Restaurant;
import com.tap.model.User;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
import java.util.Map;

@WebServlet("/checkout")
public class CheckoutServlet extends HttpServlet {
    private OrderDAO orderDAO;
    private OrderItemDAO orderItemDAO;
    private OrderHistoryDAO orderHistoryDAO;
    private RestaurantDAO restaurantDAO;

    @Override
    public void init() throws ServletException {
        orderDAO = new OrderDAOImpl();
        orderItemDAO = new OrderItemDAOImpl();
        orderHistoryDAO = new OrderHistoryDAOImpl();
        restaurantDAO = new RestaurantDAOImpl();
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        User currentUser = (User) session.getAttribute("currentUser");

        if (currentUser == null) {
            session.setAttribute("redirectAfterLogin", "checkout");
            response.sendRedirect("login");
            return;
        }

        @SuppressWarnings("unchecked")
        Map<Integer, CartItem> cart = (Map<Integer, CartItem>) session.getAttribute("cart");
        if (cart == null || cart.isEmpty()) {
            response.sendRedirect("cart");
            return;
        }

        request.getRequestDispatcher("orderConfirmation.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        User currentUser = (User) session.getAttribute("currentUser");

        if (currentUser == null) {
            session.setAttribute("redirectAfterLogin", "checkout");
            response.sendRedirect("login");
            return;
        }

        @SuppressWarnings("unchecked")
        Map<Integer, CartItem> cart = (Map<Integer, CartItem>) session.getAttribute("cart");
        if (cart == null || cart.isEmpty()) {
            response.sendRedirect("cart");
            return;
        }

        String paymentMode = request.getParameter("paymentMode");
        String deliveryAddress = request.getParameter("deliveryAddress");

        if (deliveryAddress == null || deliveryAddress.trim().isEmpty()) {
            deliveryAddress = currentUser.getAddress();
        }

        double grandTotal = (Double) session.getAttribute("grandTotal");
        Integer restaurantIdObj = (Integer) session.getAttribute("currentRestaurantId");
        int restaurantId = (restaurantIdObj != null) ? restaurantIdObj : 1;

        Restaurant restaurant = restaurantDAO.getRestaurantById(restaurantId);
        String restaurantName = (restaurant != null) ? restaurant.getName() : "TAP Food Restaurant";

        // 1. Create and save Order
        Order newOrder = new Order(currentUser.getUserId(), restaurantId, grandTotal, "Placed", paymentMode != null ? paymentMode : "COD", deliveryAddress);
        orderDAO.addOrder(newOrder);

        // 2. Create and save OrderItems
        for (CartItem item : cart.values()) {
            OrderItem orderItem = new OrderItem(newOrder.getOrderId(), item.getItemId(), item.getName(), item.getPrice(), item.getQuantity());
            orderItemDAO.addOrderItem(orderItem);
        }

        // 3. Create and save OrderHistory record
        OrderHistory historyRecord = new OrderHistory(currentUser.getUserId(), newOrder.getOrderId(), restaurantName, grandTotal, "Placed");
        orderHistoryDAO.addOrderHistory(historyRecord);

        String orderIdStr = "TAP-" + newOrder.getOrderId();
        
        request.setAttribute("orderId", orderIdStr);
        request.setAttribute("paymentMode", paymentMode != null ? paymentMode : "Cash on Delivery");
        request.setAttribute("deliveryAddress", deliveryAddress);
        request.setAttribute("orderedItems", cart.values());
        request.setAttribute("totalAmount", grandTotal);

        // Clear cart after order placement
        session.removeAttribute("cart");
        session.removeAttribute("grandTotal");

        request.getRequestDispatcher("orderConfirmation.jsp").forward(request, response);
    }
}
