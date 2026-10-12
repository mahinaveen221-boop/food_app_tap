package com.tap.servlet;

import com.tap.DAO.UserDAO;
import com.tap.DAOImpl.UserDAOImpl;
import com.tap.model.User;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;

@WebServlet("/register")
public class RegisterServlet extends HttpServlet {
    private UserDAO userDAO;

    @Override
    public void init() throws ServletException {
        userDAO = new UserDAOImpl();
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.getRequestDispatcher("register.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String username = request.getParameter("username");
        String email = request.getParameter("email");
        String phone = request.getParameter("phone");
        String password = request.getParameter("password");
        String address = request.getParameter("address");

        User newUser = new User(username, email, phone, password, address);

        boolean success = userDAO.addUser(newUser);

        if (success) {
            HttpSession session = request.getSession();
            session.setAttribute("currentUser", newUser);
            session.setAttribute("successMessage", "Registration Successful! Welcome to TAP Foods.");
            response.sendRedirect("home");
        } else {
            request.setAttribute("errorMessage", "Email already registered! Please log in or use another email.");
            request.getRequestDispatcher("register.jsp").forward(request, response);
        }
    }
}
