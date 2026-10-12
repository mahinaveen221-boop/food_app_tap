<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.List, com.tap.model.Restaurant, com.tap.model.Menu, com.tap.model.User, com.tap.model.CartItem, java.util.Map" %>
<%
    Restaurant restaurant = (Restaurant) request.getAttribute("restaurant");
    List<Menu> menuList = (List<Menu>) request.getAttribute("menuList");
    User currentUser = (User) session.getAttribute("currentUser");
    Map<Integer, CartItem> cart = (Map<Integer, CartItem>) session.getAttribute("cart");
    
    String dietaryType = request.getParameter("type");
    if (dietaryType == null) dietaryType = "all";

    int cartCount = 0;
    if (cart != null) {
        for (CartItem item : cart.values()) {
            cartCount += item.getQuantity();
        }
    }
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title><%= restaurant != null ? restaurant.getName() : "Menu" %> - TASTE HAVEN</title>
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

    <% if (restaurant != null) { %>
        <!-- RESTAURANT HERO BANNER -->
        <div style="background: linear-gradient(135deg, rgba(7, 34, 26, 0.88), rgba(14, 56, 43, 0.95)), url('<%= restaurant.getImagePath() %>') center/cover no-repeat; padding: 2.5rem 1.5rem; color: #ffffff; border-bottom: 1px solid var(--border-subtle);">
            <div class="container" style="padding: 0;">
                <a href="home" style="color: var(--accent-gold); text-decoration: none; font-weight: 700; font-size: 0.85rem; display: inline-flex; align-items: center; gap: 0.4rem; margin-bottom: 0.85rem;">
                    <i class="fa-solid fa-arrow-left"></i> All Restaurants
                </a>
                
                <div style="display: flex; align-items: center; gap: 1rem; margin-bottom: 0.4rem;">
                    <h1 style="font-family: 'Cinzel', serif; font-size: 2.1rem; font-weight: 800;"><%= restaurant.getName() %></h1>
                    <% if (restaurant.isOpen()) { %>
                        <span class="status-open">OPEN</span>
                    <% } else { %>
                        <span class="status-closed">CLOSED</span>
                    <% } %>
                </div>

                <p style="color: rgba(255, 255, 255, 0.8); font-size: 0.95rem; margin-bottom: 1.25rem;"><%= restaurant.getCuisineType() %></p>
                
                <div style="display: flex; gap: 1.25rem; align-items: center; flex-wrap: wrap;">
                    <span style="background: rgba(212, 163, 89, 0.2); color: var(--accent-gold); border: 1px solid rgba(212, 163, 89, 0.4); padding: 0.35rem 0.75rem; border-radius: var(--radius-full); font-weight: 800; font-size: 0.85rem;">
                        <i class="fa-solid fa-star"></i> <%= restaurant.getRating() %>
                    </span>
                    <span style="color: rgba(255, 255, 255, 0.8); font-size: 0.85rem; font-weight: 600;">
                        <i class="fa-solid fa-clock" style="color: var(--accent-gold);"></i> <%= restaurant.getDeliveryTime() %>
                    </span>
                    <span style="color: rgba(255, 255, 255, 0.8); font-size: 0.85rem; font-weight: 600;">
                        <i class="fa-solid fa-location-dot" style="color: var(--accent-gold);"></i> <%= restaurant.getAddress() %>
                    </span>
                </div>
            </div>
        </div>
    <% } %>

    <!-- MENU ITEMS -->
    <main class="container">
        
        <!-- DIETARY FILTER TOGGLES -->
        <div class="section-header">
            <h2 class="section-title">Menu Cards</h2>
            
            <div style="display: flex; gap: 0.4rem; background: var(--bg-card); padding: 0.35rem; border-radius: var(--radius-full); border: 1px solid var(--border-subtle); box-shadow: var(--shadow-sm);">
                <a href="menu?restaurantId=<%= restaurant.getRestaurantId() %>&type=all" class="pill-item <%= "all".equals(dietaryType) ? "active" : "" %>" style="padding: 0.4rem 1rem; font-size: 0.8rem;">All Dishes</a>
                <a href="menu?restaurantId=<%= restaurant.getRestaurantId() %>&type=veg" class="pill-item <%= "veg".equals(dietaryType) ? "active" : "" %>" style="padding: 0.4rem 1rem; font-size: 0.8rem;">🟢 Veg Only</a>
                <a href="menu?restaurantId=<%= restaurant.getRestaurantId() %>&type=nonveg" class="pill-item <%= "nonveg".equals(dietaryType) ? "active" : "" %>" style="padding: 0.4rem 1rem; font-size: 0.8rem;">🔴 Non-Veg Only</a>
            </div>
        </div>

        <div class="grid">
            <% if (menuList != null && !menuList.isEmpty()) { 
                int displayCount = 0;
                for (Menu item : menuList) { 
                    if ("veg".equals(dietaryType) && !item.isVeg()) continue;
                    if ("nonveg".equals(dietaryType) && item.isVeg()) continue;
                    displayCount++;

                    boolean inCart = cart != null && cart.containsKey(item.getMenuId());
                    int cartQty = inCart ? cart.get(item.getMenuId()).getQuantity() : 0;
                %>
                    <div class="card <%= !item.isAvailable() ? "disabled-card" : "" %>">
                        <div class="card-img-wrapper">
                            <img src="<%= item.getImagePath() %>" alt="<%= item.getName() %>" class="card-img">
                            
                            <div style="position: absolute; top: 1rem; left: 1rem; background: rgba(14, 56, 43, 0.85); backdrop-filter: blur(8px); padding: 0.35rem 0.6rem; border-radius: var(--radius-sm); border: 1px solid rgba(212, 163, 89, 0.3); color: #ffffff; font-size: 0.72rem; font-weight: 800;">
                                <%= item.isVeg() ? "🟢 VEG" : "🔴 NON-VEG" %>
                            </div>

                            <div style="position: absolute; bottom: 1rem; right: 1rem;">
                                <% if (item.isAvailable()) { %>
                                    <span class="status-open" style="font-size: 0.7rem;"><i class="fa-solid fa-circle-check"></i> Available</span>
                                <% } else { %>
                                    <span class="status-closed" style="font-size: 0.7rem;"><i class="fa-solid fa-circle-xmark"></i> Out of Stock</span>
                                <% } %>
                            </div>
                        </div>

                        <div class="card-body">
                            <div style="display: flex; justify-content: space-between; align-items: start; margin-bottom: 0.25rem;">
                                <h3 class="card-title"><%= item.getName() %></h3>
                                <span style="color: var(--text-secondary); font-size: 0.75rem; font-weight: 700; background: var(--bg-card-alt); padding: 0.15rem 0.45rem; border-radius: var(--radius-sm);"><%= item.getCategory() %></span>
                            </div>

                            <p class="card-subtitle" style="margin-bottom: 1rem; flex: 1;"><%= item.getDescription() %></p>
                            
                            <div class="card-footer">
                                <span style="font-size: 1.15rem; font-weight: 800; color: var(--primary-green);">₹<%= (int)item.getPrice() %></span>
                                
                                <% if (item.isAvailable() && restaurant.isOpen()) { %>
                                    <form action="cart" method="post" style="display: flex; gap: 0.5rem; align-items: center;">
                                        <input type="hidden" name="action" value="add">
                                        <input type="hidden" name="itemId" value="<%= item.getMenuId() %>">
                                        <input type="hidden" name="redirect" value="menu">
                                        <input type="hidden" name="restaurantId" value="<%= restaurant.getRestaurantId() %>">
                                        
                                        <button type="submit" class="btn-primary">
                                            <i class="fa-solid fa-plus"></i> Add to Cart <%= cartQty > 0 ? "(" + cartQty + ")" : "" %>
                                        </button>
                                    </form>
                                <% } else { %>
                                    <button class="btn-disabled" disabled>
                                        <i class="fa-solid fa-ban"></i> <%= !restaurant.isOpen() ? "Closed" : "Not Available" %>
                                    </button>
                                <% } %>
                            </div>
                        </div>
                    </div>
                <% } 
                if (displayCount == 0) { %>
                    <div style="grid-column: 1 / -1; text-align: center; padding: 3rem; background: var(--bg-card); border-radius: var(--radius-lg);">
                        <p style="color: var(--text-secondary);">No <%= dietaryType %> dishes available for this restaurant.</p>
                    </div>
                <% }
            } else { %>
                <div style="grid-column: 1 / -1; text-align: center; padding: 3rem; background: var(--bg-card); border-radius: var(--radius-lg);">
                    <p style="color: var(--text-secondary);">No menu items currently available for this restaurant.</p>
                </div>
            <% } %>
        </div>
    </main>

    <!-- FLOATING BOTTOM NAVIGATION BAR -->
    <div class="bottom-nav">
        <a href="home" class="bottom-nav-item">
            <i class="fa-solid fa-house"></i>
            <span>Home</span>
        </a>
        <a href="home" class="bottom-nav-item active">
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
