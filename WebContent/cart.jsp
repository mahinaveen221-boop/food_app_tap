<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.Map, com.tap.model.CartItem, com.tap.model.User" %>
<%
    Map<Integer, CartItem> cart = (Map<Integer, CartItem>) session.getAttribute("cart");
    User currentUser = (User) session.getAttribute("currentUser");
    
    double subtotal = 0.0;
    int cartCount = 0;
    if (cart != null) {
        for (CartItem item : cart.values()) {
            subtotal += item.getItemTotal();
            cartCount += item.getQuantity();
        }
    }
    double deliveryFee = (subtotal > 0 && subtotal < 500) ? 40.0 : 0.0;
    double tax = subtotal * 0.05; // 5% GST
    double grandTotal = subtotal + deliveryFee + tax;
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Shopping Cart - TASTE HAVEN</title>
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
            <h1 class="section-title"><i class="fa-solid fa-basket-shopping" style="color: var(--accent-gold);"></i> Your Food Basket</h1>
        </div>

        <% if (cart != null && !cart.isEmpty()) { %>
            <div style="display: grid; grid-template-columns: 2fr 1fr; gap: 1.5rem;">
                
                <!-- CART ITEMS LIST -->
                <div style="background: var(--bg-card); border: 1px solid var(--border-subtle); border-radius: var(--radius-lg); padding: 1.25rem; box-shadow: var(--shadow-sm);">
                    <div style="display: flex; flex-direction: column; gap: 1rem; margin-bottom: 1.5rem;">
                        <% for (CartItem item : cart.values()) { %>
                            <div style="display: flex; align-items: center; justify-content: space-between; padding-bottom: 1rem; border-bottom: 1px solid var(--border-subtle);">
                                <div style="display: flex; align-items: center; gap: 0.85rem;">
                                    <div style="width: 12px; height: 12px; border-radius: 50%; background: <%= item.isVeg() ? "#166534" : "#991b1b" %>;"></div>
                                    <div>
                                        <div style="font-weight: 800; font-size: 1rem; color: var(--text-primary);"><%= item.getName() %></div>
                                        <div style="color: var(--primary-green); font-weight: 700; font-size: 0.9rem; margin-top: 2px;">₹<%= (int)item.getPrice() %></div>
                                    </div>
                                </div>

                                <div style="display: flex; align-items: center; gap: 1.25rem;">
                                    <div style="display: flex; align-items: center; background: var(--bg-card-alt); border-radius: var(--radius-full); padding: 0.25rem 0.6rem; border: 1px solid var(--border-subtle);">
                                        <form action="cart" method="post" style="display: inline;">
                                            <input type="hidden" name="action" value="update">
                                            <input type="hidden" name="itemId" value="<%= item.getItemId() %>">
                                            <input type="hidden" name="quantity" value="<%= item.getQuantity() - 1 %>">
                                            <button type="submit" style="background: none; border: none; font-weight: 800; color: var(--primary-green); cursor: pointer; padding: 0 0.4rem;">-</button>
                                        </form>
                                        <span style="font-weight: 800; font-size: 0.9rem; min-width: 24px; text-align: center;"><%= item.getQuantity() %></span>
                                        <form action="cart" method="post" style="display: inline;">
                                            <input type="hidden" name="action" value="add">
                                            <input type="hidden" name="itemId" value="<%= item.getItemId() %>">
                                            <input type="hidden" name="quantity" value="1">
                                            <button type="submit" style="background: none; border: none; font-weight: 800; color: var(--primary-green); cursor: pointer; padding: 0 0.4rem;">+</button>
                                        </form>
                                    </div>

                                    <div style="font-weight: 800; font-size: 1.05rem; color: var(--primary-green); min-width: 70px; text-align: right;">
                                        ₹<%= (int)item.getItemTotal() %>
                                    </div>

                                    <form action="cart" method="post" style="display: inline;">
                                        <input type="hidden" name="action" value="remove">
                                        <input type="hidden" name="itemId" value="<%= item.getItemId() %>">
                                        <button type="submit" style="background: none; border: none; color: #dc2626; cursor: pointer; font-size: 1rem;" title="Delete Item">
                                            <i class="fa-solid fa-trash-can"></i>
                                        </button>
                                    </form>
                                </div>
                            </div>
                        <% } %>
                    </div>

                    <div style="display: flex; justify-content: space-between; align-items: center;">
                        <a href="home" style="color: var(--primary-green); text-decoration: none; font-weight: 700; font-size: 0.85rem; display: flex; align-items: center; gap: 0.4rem;">
                            <i class="fa-solid fa-plus"></i> Add More Items
                        </a>
                        <form action="cart" method="post">
                            <input type="hidden" name="action" value="clear">
                            <button type="submit" style="background: none; border: none; color: #dc2626; font-weight: 700; font-size: 0.85rem; cursor: pointer;">
                                Clear Cart
                            </button>
                        </form>
                    </div>
                </div>

                <!-- ORDER SUMMARY & CHECKOUT -->
                <div style="background: var(--bg-card); border: 1px solid var(--border-subtle); padding: 1.5rem; border-radius: var(--radius-lg); height: fit-content; box-shadow: var(--shadow-sm);">
                    <h3 style="font-weight: 800; margin-bottom: 1rem; border-bottom: 1px solid var(--border-subtle); padding-bottom: 0.75rem; color: var(--text-primary);">Bill Details</h3>
                    
                    <div style="display: flex; justify-content: space-between; margin-bottom: 0.65rem; color: var(--text-secondary); font-size: 0.9rem;">
                        <span>Item Subtotal</span>
                        <span style="color: var(--text-primary); font-weight: 700;">₹<%= String.format("%.2f", subtotal) %></span>
                    </div>
                    <div style="display: flex; justify-content: space-between; margin-bottom: 0.65rem; color: var(--text-secondary); font-size: 0.9rem;">
                        <span>Delivery Fee</span>
                        <span style="color: var(--text-primary); font-weight: 700;"><%= deliveryFee == 0 ? "FREE" : "₹" + (int)deliveryFee %></span>
                    </div>
                    <div style="display: flex; justify-content: space-between; margin-bottom: 1rem; color: var(--text-secondary); font-size: 0.9rem;">
                        <span>GST & Taxes (5%)</span>
                        <span style="color: var(--text-primary); font-weight: 700;">₹<%= String.format("%.2f", tax) %></span>
                    </div>
                    
                    <div style="display: flex; justify-content: space-between; padding-top: 1rem; border-top: 1px dashed var(--border-subtle); font-size: 1.15rem; font-weight: 800; margin-bottom: 1.5rem;">
                        <span>To Pay</span>
                        <span style="color: var(--primary-green);">₹<%= String.format("%.2f", grandTotal) %></span>
                    </div>

                    <form action="checkout" method="post">
                        <div style="margin-bottom: 1rem;">
                            <label style="display: block; font-size: 0.8rem; font-weight: 700; margin-bottom: 0.35rem; color: var(--text-secondary);">Delivery Address</label>
                            <input type="text" name="deliveryAddress" style="width: 100%; padding: 0.7rem; border-radius: var(--radius-sm); border: 1px solid var(--border-subtle); background: var(--bg-card-alt); font-size: 0.88rem; outline: none;" placeholder="Enter delivery address" value="<%= currentUser != null ? currentUser.getAddress() : "" %>" required>
                        </div>
                        
                        <div style="margin-bottom: 1.25rem;">
                            <label style="display: block; font-size: 0.8rem; font-weight: 700; margin-bottom: 0.35rem; color: var(--text-secondary);">Payment Mode</label>
                            <select name="paymentMode" style="width: 100%; padding: 0.7rem; border-radius: var(--radius-sm); border: 1px solid var(--border-subtle); background: var(--bg-card-alt); font-size: 0.88rem; outline: none;">
                                <option value="UPI / GPay / PhonePe">UPI / GPay / PhonePe</option>
                                <option value="Credit / Debit Card">Credit / Debit Card</option>
                                <option value="Cash on Delivery">Cash on Delivery (COD)</option>
                            </select>
                        </div>

                        <% session.setAttribute("grandTotal", grandTotal); %>

                        <button type="submit" class="btn-primary" style="width: 100%; justify-content: center; padding: 0.8rem; font-size: 0.95rem;">
                            Proceed to Checkout <i class="fa-solid fa-arrow-right"></i>
                        </button>
                    </form>
                </div>

            </div>
        <% } else { %>
            <div style="text-align: center; padding: 4rem 2rem; background: var(--bg-card); border-radius: var(--radius-lg); border: 1px solid var(--border-subtle); max-width: 550px; margin: 0 auto; box-shadow: var(--shadow-sm);">
                <i class="fa-solid fa-basket-shopping" style="font-size: 3.5rem; color: var(--text-muted); margin-bottom: 1rem;"></i>
                <h2 style="font-family: 'Cinzel', serif; font-size: 1.5rem; font-weight: 700;">Your Cart is Empty</h2>
                <p style="color: var(--text-secondary); margin: 0.5rem 0 1.5rem; font-size: 0.9rem;">Looks like you haven't added anything to your cart yet.</p>
                <a href="home" class="btn-primary">
                    <i class="fa-solid fa-utensils"></i> Browse Menu Dishes
                </a>
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
        <a href="orderHistory" class="bottom-nav-item">
            <i class="fa-solid fa-calendar-days"></i>
            <span>Reservations</span>
        </a>
        <a href="cart" class="bottom-nav-item active">
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
