<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.List, com.tap.model.OrderHistory, com.tap.model.User, com.tap.model.CartItem, java.util.Map, java.text.SimpleDateFormat" %>
<%
    List<OrderHistory> historyList = (List<OrderHistory>) request.getAttribute("historyList");
    User currentUser = (User) session.getAttribute("currentUser");
    Map<Integer, CartItem> cart = (Map<Integer, CartItem>) session.getAttribute("cart");
    
    int cartCount = 0;
    if (cart != null) {
        for (CartItem item : cart.values()) {
            cartCount += item.getQuantity();
        }
    }
    SimpleDateFormat sdf = new SimpleDateFormat("dd MMM yyyy, hh:mm a");
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Order History - TASTE HAVEN</title>
    <link rel="stylesheet" href="css/style.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
</head>
<body>

    <!-- TOP NAVBAR HEADER -->
    <nav class="navbar">
        <div class="nav-left">
            <a href="home" class="nav-toggle-btn" title="Back to Home">
                <i class="fa-solid fa-arrow-left"></i>
            </a>
        </div>

        <a href="home" class="brand-logo">
            <i class="fa-solid fa-seedling"></i>
            <div class="brand-title">TASTE HAVEN</div>
            <div class="brand-subtitle">RESTAURANT</div>
        </a>

        <div class="nav-right">
            <% if (currentUser != null) { %>
                <a href="orderHistory" class="nav-icon-btn" title="<%= currentUser.getUsername() %>">
                    <i class="fa-solid fa-user-check"></i>
                </a>
                <a href="logout" class="nav-icon-btn" title="Logout">
                    <i class="fa-solid fa-right-from-bracket"></i>
                </a>
            <% } else { %>
                <a href="login" class="nav-icon-btn" title="Login / Register">
                    <i class="fa-regular fa-user"></i>
                </a>
            <% } %>

            <a href="cart" class="nav-icon-btn" title="View Cart">
                <i class="fa-solid fa-basket-shopping"></i>
                <% if (cartCount > 0) { %>
                    <span class="cart-badge"><%= cartCount %></span>
                <% } %>
            </a>
        </div>
    </nav>

    <main class="container">
        <div class="section-header" style="margin-bottom: 1.5rem;">
            <h1 class="section-title"><i class="fa-solid fa-clock-rotate-left" style="color: var(--accent-gold);"></i> Your Order History</h1>
            <a href="home" class="btn-primary"><i class="fa-solid fa-plus"></i> Order More Food</a>
        </div>

        <% if (historyList != null && !historyList.isEmpty()) { %>
            <div style="display: flex; flex-direction: column; gap: 1.25rem;">
                <% for (OrderHistory h : historyList) { 
                    String statusClass = "status-open";
                    if ("Delivered".equalsIgnoreCase(h.getStatus())) statusClass = "status-open";
                %>
                    <div style="background: var(--bg-card); border: 1px solid var(--border-subtle); border-radius: var(--radius-lg); padding: 1.25rem 1.5rem; display: flex; justify-content: space-between; align-items: center; box-shadow: var(--shadow-sm);">
                        
                        <div>
                            <div style="display: flex; align-items: center; gap: 0.75rem; margin-bottom: 0.35rem;">
                                <h3 style="font-size: 1.15rem; font-weight: 800; color: var(--text-primary);"><%= h.getRestaurantName() %></h3>
                                <span class="<%= statusClass %>"><%= h.getStatus() %></span>
                            </div>
                            
                            <p style="color: var(--text-secondary); font-size: 0.88rem; margin-bottom: 0.2rem;">
                                <strong>Order ID:</strong> TAP-<%= h.getOrderId() %>
                            </p>
                            <p style="color: var(--text-muted); font-size: 0.82rem;">
                                <i class="fa-solid fa-calendar-days" style="color: var(--accent-gold);"></i> <%= h.getOrderDate() != null ? sdf.format(h.getOrderDate()) : "Recently" %>
                            </p>
                        </div>

                        <div style="text-align: right;">
                            <div style="font-size: 1.35rem; font-weight: 800; color: var(--primary-green); margin-bottom: 0.35rem;">
                                ₹<%= String.format("%.2f", h.getTotalAmount()) %>
                            </div>
                            <span style="color: #166534; font-size: 0.82rem; font-weight: 700;">
                                <i class="fa-solid fa-circle-check"></i> Payment Completed
                            </span>
                        </div>

                    </div>
                <% } %>
            </div>
        <% } else { %>
            <div style="text-align: center; padding: 4rem 2rem; background: var(--bg-card); border-radius: var(--radius-lg); border: 1px solid var(--border-subtle); max-width: 550px; margin: 0 auto; box-shadow: var(--shadow-sm);">
                <i class="fa-solid fa-receipt" style="font-size: 3.5rem; color: var(--text-muted); margin-bottom: 1rem;"></i>
                <h2 style="font-family: 'Cinzel', serif; font-size: 1.5rem; font-weight: 700;">No Past Orders Found</h2>
                <p style="color: var(--text-secondary); margin: 0.5rem 0 1.5rem; font-size: 0.9rem;">You haven't placed any orders yet with this account.</p>
                <a href="home" class="btn-primary" style="display: inline-flex;"><i class="fa-solid fa-utensils"></i> Order Now</a>
            </div>
        <% } %>
    </main>

    <!-- FLOATING BOTTOM NAVIGATION BAR -->
    <div class="bottom-nav">
        <a href="home" class="bottom-nav-item">
            <i class="fa-solid fa-house"></i>
            <span>Home</span>
        </a>
        <a href="home" class="bottom-nav-item">
            <i class="fa-solid fa-utensils"></i>
            <span>Menu</span>
        </a>
        <a href="home" class="bottom-nav-center" title="Order Online">
            <i class="fa-solid fa-bag-shopping"></i>
        </a>
        <a href="orderHistory" class="bottom-nav-item active">
            <i class="fa-solid fa-calendar-days"></i>
            <span>Reservations</span>
        </a>
        <a href="cart" class="bottom-nav-item">
            <i class="fa-solid fa-ellipsis"></i>
            <span>More</span>
        </a>
    </div>

    <!-- FOOTER -->
    <footer>
        <p>&copy; 2026 TASTE HAVEN RESTAURANT (TAP Foods Delivery Application). All Rights Reserved.</p>
    </footer>

</body>
</html>
