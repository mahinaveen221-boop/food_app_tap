<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.tap.model.User, com.tap.model.CartItem, java.util.Collection" %>
<%
    User currentUser = (User) session.getAttribute("currentUser");
    String orderId = (String) request.getAttribute("orderId");
    String paymentMode = (String) request.getAttribute("paymentMode");
    String deliveryAddress = (String) request.getAttribute("deliveryAddress");
    Double totalAmount = (Double) request.getAttribute("totalAmount");
    Collection<CartItem> orderedItems = (Collection<CartItem>) request.getAttribute("orderedItems");
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Order Placed Successfully! - TAP Foods</title>
    <link rel="stylesheet" href="css/style.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
    <style>
        .success-checkmark {
            width: 80px;
            height: 80px;
            margin: 0 auto 1.5rem;
            background: linear-gradient(135deg, #22c55e, #16a34a);
            border-radius: 50%;
            display: flex;
            align-items: center;
            justify-content: center;
            color: #fff;
            font-size: 2.5rem;
            box-shadow: 0 10px 25px rgba(34, 197, 94, 0.4);
            animation: pulse 2s infinite;
        }
        @keyframes pulse {
            0% { transform: scale(1); }
            50% { transform: scale(1.08); }
            100% { transform: scale(1); }
        }
    </style>
</head>
<body>

    <!-- NAVBAR -->
    <nav class="navbar">
        <a href="home" class="brand">
            <div class="brand-icon"><i class="fa-solid fa-utensils"></i></div>
            <span>TAP Foods</span>
        </a>
        <ul class="nav-links">
            <li><a href="home" class="nav-link"><i class="fa-solid fa-house"></i> Home</a></li>
            <% if (currentUser != null) { %>
                <li style="color: #ff9800; font-weight: 600;"><i class="fa-solid fa-user-circle"></i> Hi, <%= currentUser.getUsername() %></li>
                <li><a href="logout" class="user-btn"><i class="fa-solid fa-right-from-bracket"></i> Logout</a></li>
            <% } %>
        </ul>
    </nav>

    <main class="container">
        <div style="max-width: 680px; margin: 0 auto; background: var(--bg-card); border: 1px solid var(--border-color); border-radius: var(--radius-lg); padding: 3rem 2rem; text-align: center; box-shadow: var(--shadow-card);">
            
            <div class="success-checkmark">
                <i class="fa-solid fa-check"></i>
            </div>

            <h1 style="font-size: 2rem; font-weight: 800; margin-bottom: 0.5rem;">Order Confirmed!</h1>
            <p style="color: var(--text-muted); font-size: 1.1rem; margin-bottom: 2rem;">
                Thank you! Your order <strong style="color: var(--accent-amber);"><%= orderId != null ? orderId : "TAP-89241" %></strong> has been received by the kitchen.
            </p>

            <!-- DELIVERY STATUS BADGE -->
            <div style="background: rgba(255, 152, 0, 0.1); border: 1px solid rgba(255, 152, 0, 0.3); padding: 1.25rem; border-radius: var(--radius-md); margin-bottom: 2rem; display: flex; align-items: center; justify-content: space-around;">
                <div>
                    <div style="color: var(--text-muted); font-size: 0.85rem; font-weight: 600;">ESTIMATED DELIVERY</div>
                    <div style="font-size: 1.35rem; font-weight: 800; color: #fff; margin-top: 0.25rem;">
                        <i class="fa-solid fa-clock" style="color: #ff9800;"></i> 25 - 35 Mins
                    </div>
                </div>
                <div style="width: 1px; height: 40px; background: var(--border-color);"></div>
                <div>
                    <div style="color: var(--text-muted); font-size: 0.85rem; font-weight: 600;">PAYMENT MODE</div>
                    <div style="font-size: 1.1rem; font-weight: 700; color: #fff; margin-top: 0.25rem;">
                        <%= paymentMode != null ? paymentMode : "Cash on Delivery" %>
                    </div>
                </div>
            </div>

            <!-- ORDER SUMMARY LIST -->
            <% if (orderedItems != null && !orderedItems.isEmpty()) { %>
                <div style="text-align: left; background: var(--bg-dark); border: 1px solid var(--border-color); border-radius: var(--radius-md); padding: 1.25rem; margin-bottom: 2rem;">
                    <h4 style="font-weight: 700; margin-bottom: 1rem; border-bottom: 1px solid var(--border-color); padding-bottom: 0.5rem;">Order Summary</h4>
                    <% for (CartItem item : orderedItems) { %>
                        <div style="display: flex; justify-content: space-between; margin-bottom: 0.5rem; font-size: 0.95rem;">
                            <span><%= item.getQuantity() %>x <%= item.getName() %></span>
                            <span style="font-weight: 600;">₹<%= (int)item.getItemTotal() %></span>
                        </div>
                    <% } %>
                    <div style="display: flex; justify-content: space-between; padding-top: 0.75rem; margin-top: 0.75rem; border-top: 1px dashed var(--border-color); font-weight: 800; font-size: 1.1rem;">
                        <span>Total Paid</span>
                        <span style="color: var(--accent-amber);">₹<%= totalAmount != null ? String.format("%.2f", totalAmount) : "0.00" %></span>
                    </div>
                </div>
            <% } %>

            <p style="color: var(--text-muted); font-size: 0.9rem; margin-bottom: 2rem;">
                <i class="fa-solid fa-location-dot" style="color: #ff9800;"></i> Delivering to: <strong><%= deliveryAddress != null ? deliveryAddress : "User Address" %></strong>
            </p>

            <a href="home" class="btn-primary" style="display: inline-flex; padding: 0.85rem 2rem; font-size: 1.05rem;">
                <i class="fa-solid fa-utensils"></i> Order Something Else
            </a>
        </div>
    </main>

    <footer>
        <p>&copy; 2026 TAP Foods Delivery Application. All Rights Reserved.</p>
    </footer>

</body>
</html>
