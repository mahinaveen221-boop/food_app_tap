package com.tap.servlet;

import com.tap.DAO.MenuDAO;
import com.tap.DAOImpl.MenuDAOImpl;
import com.tap.model.CartItem;
import com.tap.model.Menu;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

@WebServlet("/cart")
public class CartServlet extends HttpServlet {
    private MenuDAO menuDAO;

    @Override
    public void init() throws ServletException {
        menuDAO = new MenuDAOImpl();
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.getRequestDispatcher("cart.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        
        @SuppressWarnings("unchecked")
        Map<Integer, CartItem> cart = (Map<Integer, CartItem>) session.getAttribute("cart");
        if (cart == null) {
            cart = new HashMap<>();
            session.setAttribute("cart", cart);
        }

        String action = request.getParameter("action");
        if (action == null) action = "add";

        String itemIdStr = request.getParameter("itemId");

        try {
            int itemId = Integer.parseInt(itemIdStr);

            if ("add".equalsIgnoreCase(action)) {
                int quantity = 1;
                String qtyStr = request.getParameter("quantity");
                if (qtyStr != null && !qtyStr.isEmpty()) {
                    quantity = Integer.parseInt(qtyStr);
                }

                Menu menu = menuDAO.getMenuItemById(itemId);
                // Ensure item is available before adding to cart
                if (menu != null && menu.isAvailable()) {
                    if (cart.containsKey(itemId)) {
                        CartItem existingItem = cart.get(itemId);
                        existingItem.setQuantity(existingItem.getQuantity() + quantity);
                    } else {
                        CartItem newItem = new CartItem(menu.getMenuId(), menu.getRestaurantId(), menu.getName(), menu.getPrice(), quantity, menu.isVeg(), menu.getImagePath());
                        cart.put(itemId, newItem);
                        session.setAttribute("currentRestaurantId", menu.getRestaurantId());
                    }
                }
            } else if ("update".equalsIgnoreCase(action)) {
                int quantity = Integer.parseInt(request.getParameter("quantity"));
                if (cart.containsKey(itemId)) {
                    if (quantity > 0) {
                        cart.get(itemId).setQuantity(quantity);
                    } else {
                        cart.remove(itemId);
                    }
                }
            } else if ("remove".equalsIgnoreCase(action)) {
                cart.remove(itemId);
            } else if ("clear".equalsIgnoreCase(action)) {
                cart.clear();
            }

            // Recalculate subtotal
            double grandTotal = 0.0;
            for (CartItem item : cart.values()) {
                grandTotal += item.getItemTotal();
            }
            session.setAttribute("grandTotal", grandTotal);

        } catch (Exception e) {
            e.printStackTrace();
        }

        String redirect = request.getParameter("redirect");
        if ("menu".equalsIgnoreCase(redirect)) {
            String restaurantId = request.getParameter("restaurantId");
            response.sendRedirect("menu?restaurantId=" + restaurantId);
        } else {
            response.sendRedirect("cart");
        }
    }
}
