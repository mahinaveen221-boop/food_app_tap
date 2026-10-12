package com.tap.servlet;

import com.tap.DAO.OrderHistoryDAO;
import com.tap.DAOImpl.OrderHistoryDAOImpl;
import com.tap.model.OrderHistory;
import com.tap.model.User;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
import java.util.List;

@WebServlet("/orderHistory")
public class OrderHistoryServlet extends HttpServlet {
    private OrderHistoryDAO orderHistoryDAO;

    @Override
    public void init() throws ServletException {
        orderHistoryDAO = new OrderHistoryDAOImpl();
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        User currentUser = (User) session.getAttribute("currentUser");

        if (currentUser == null) {
            session.setAttribute("redirectAfterLogin", "orderHistory");
            response.sendRedirect("login");
            return;
        }

        List<OrderHistory> historyList = orderHistoryDAO.getOrderHistoryByUserId(currentUser.getUserId());
        request.setAttribute("historyList", historyList);
        request.getRequestDispatcher("orderHistory.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
    }
}
