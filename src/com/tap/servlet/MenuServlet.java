package com.tap.servlet;

import com.tap.DAO.MenuDAO;
import com.tap.DAO.RestaurantDAO;
import com.tap.DAOImpl.MenuDAOImpl;
import com.tap.DAOImpl.RestaurantDAOImpl;
import com.tap.model.Menu;
import com.tap.model.Restaurant;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.util.List;

@WebServlet("/menu")
public class MenuServlet extends HttpServlet {
    private RestaurantDAO restaurantDAO;
    private MenuDAO menuDAO;

    @Override
    public void init() throws ServletException {
        restaurantDAO = new RestaurantDAOImpl();
        menuDAO = new MenuDAOImpl();
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String restaurantIdStr = request.getParameter("restaurantId");
        
        if (restaurantIdStr == null || restaurantIdStr.isEmpty()) {
            response.sendRedirect("home");
            return;
        }

        try {
            int restaurantId = Integer.parseInt(restaurantIdStr);
            Restaurant restaurant = restaurantDAO.getRestaurantById(restaurantId);
            List<Menu> menuList = menuDAO.getMenuByRestaurantId(restaurantId);

            request.setAttribute("restaurant", restaurant);
            request.setAttribute("menuList", menuList);
            request.getRequestDispatcher("menu.jsp").forward(request, response);
        } catch (NumberFormatException e) {
            response.sendRedirect("home");
        }
    }
}
