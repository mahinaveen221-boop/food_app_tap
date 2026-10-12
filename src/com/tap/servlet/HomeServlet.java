package com.tap.servlet;

import com.tap.DAO.RestaurantDAO;
import com.tap.DAOImpl.RestaurantDAOImpl;
import com.tap.model.Restaurant;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.util.List;

@WebServlet("/home")
public class HomeServlet extends HttpServlet {
    private RestaurantDAO restaurantDAO;

    @Override
    public void init() throws ServletException {
        restaurantDAO = new RestaurantDAOImpl();
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String searchQuery = request.getParameter("search");
        String stateFilter = request.getParameter("state");
        String cityFilter = request.getParameter("city");

        List<Restaurant> restaurantList = restaurantDAO.filterRestaurants(searchQuery, stateFilter, cityFilter);

        request.setAttribute("restaurantList", restaurantList);
        request.setAttribute("searchQuery", searchQuery);
        request.setAttribute("selectedState", stateFilter != null ? stateFilter : "All");
        request.setAttribute("selectedCity", cityFilter != null ? cityFilter : "All");

        request.getRequestDispatcher("home.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
    }
}
