<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.List, com.tap.model.Restaurant, com.tap.model.User, com.tap.model.CartItem, java.util.Map" %>
<%
    List<Restaurant> restaurantList = (List<Restaurant>) request.getAttribute("restaurantList");
    String searchQuery = (String) request.getAttribute("searchQuery");
    String selectedState = (String) request.getAttribute("selectedState");
    String selectedCity = (String) request.getAttribute("selectedCity");
    String categoryParam = request.getParameter("category");
    if (categoryParam == null) categoryParam = "All";

    User currentUser = (User) session.getAttribute("currentUser");
    Map<Integer, CartItem> cart = (Map<Integer, CartItem>) session.getAttribute("cart");
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
    <title>TASTE HAVEN RESTAURANT - TAP Foods Regional Delivery</title>
    <link rel="stylesheet" href="css/style.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
</head>
<body>

    <!-- TOP NAVBAR HEADER (Top Left Three-Lines Icon Removed) -->
    <nav class="navbar">
        <div class="nav-left">
            <!-- Three lines icon removed as requested -->
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

    <!-- MAIN CONTENT -->
    <main class="container">

        <!-- SEARCH BAR & DISTRICT SELECTOR -->
        <form action="home" method="get" class="search-wrapper">
            <div class="search-box">
                <i class="fa-solid fa-magnifying-glass"></i>
                
                <select name="city" class="city-select" onchange="this.form.submit()">
                    <option value="All" <%= "All".equalsIgnoreCase(selectedCity) ? "selected" : "" %>>📍 All Districts</option>
                    <!-- TAMIL NADU -->
                    <option value="Chennai" <%= "Chennai".equalsIgnoreCase(selectedCity) ? "selected" : "" %>>📍 Chennai (TN)</option>
                    <option value="Madurai" <%= "Madurai".equalsIgnoreCase(selectedCity) ? "selected" : "" %>>📍 Madurai (TN)</option>
                    <option value="Trichy" <%= "Trichy".equalsIgnoreCase(selectedCity) ? "selected" : "" %>>📍 Trichy (TN)</option>
                    <option value="Salem" <%= "Salem".equalsIgnoreCase(selectedCity) ? "selected" : "" %>>📍 Salem (TN)</option>
                    <option value="Tirunelveli" <%= "Tirunelveli".equalsIgnoreCase(selectedCity) ? "selected" : "" %>>📍 Tirunelveli (TN)</option>
                    <option value="Erode" <%= "Erode".equalsIgnoreCase(selectedCity) ? "selected" : "" %>>📍 Erode (TN)</option>
                    <option value="Vellore" <%= "Vellore".equalsIgnoreCase(selectedCity) ? "selected" : "" %>>📍 Vellore (TN)</option>
                    <option value="Thanjavur" <%= "Thanjavur".equalsIgnoreCase(selectedCity) ? "selected" : "" %>>📍 Thanjavur (TN)</option>
                    <option value="Kanyakumari" <%= "Kanyakumari".equalsIgnoreCase(selectedCity) ? "selected" : "" %>>📍 Kanyakumari (TN)</option>
                    <option value="Dindigul" <%= "Dindigul".equalsIgnoreCase(selectedCity) ? "selected" : "" %>>📍 Dindigul (TN)</option>
                    <option value="Karaikudi" <%= "Karaikudi".equalsIgnoreCase(selectedCity) ? "selected" : "" %>>📍 Karaikudi (TN)</option>
                    <option value="Coimbatore" <%= "Coimbatore".equalsIgnoreCase(selectedCity) ? "selected" : "" %>>📍 Coimbatore (TN)</option>
                    <!-- KERALA -->
                    <option value="Kochi" <%= "Kochi".equalsIgnoreCase(selectedCity) ? "selected" : "" %>>📍 Kochi (Kerala)</option>
                    <option value="Kozhikode" <%= "Kozhikode".equalsIgnoreCase(selectedCity) ? "selected" : "" %>>📍 Kozhikode (Kerala)</option>
                    <option value="Alleppey" <%= "Alleppey".equalsIgnoreCase(selectedCity) ? "selected" : "" %>>📍 Alleppey (Kerala)</option>
                    <option value="Trivandrum" <%= "Trivandrum".equalsIgnoreCase(selectedCity) ? "selected" : "" %>>📍 Trivandrum (Kerala)</option>
                    <!-- ANDHRA -->
                    <option value="Hyderabad" <%= "Hyderabad".equalsIgnoreCase(selectedCity) ? "selected" : "" %>>📍 Hyderabad (Telangana)</option>
                    <option value="Vijayawada" <%= "Vijayawada".equalsIgnoreCase(selectedCity) ? "selected" : "" %>>📍 Vijayawada (Andhra)</option>
                    <option value="Vizag" <%= "Vizag".equalsIgnoreCase(selectedCity) ? "selected" : "" %>>📍 Vizag (Andhra)</option>
                    <option value="Tirupati" <%= "Tirupati".equalsIgnoreCase(selectedCity) ? "selected" : "" %>>📍 Tirupati (Andhra)</option>
                    <!-- KARNATAKA -->
                    <option value="Bangalore" <%= "Bangalore".equalsIgnoreCase(selectedCity) ? "selected" : "" %>>📍 Bangalore (Karnataka)</option>
                    <option value="Mysore" <%= "Mysore".equalsIgnoreCase(selectedCity) ? "selected" : "" %>>📍 Mysore (Karnataka)</option>
                    <option value="Mangalore" <%= "Mangalore".equalsIgnoreCase(selectedCity) ? "selected" : "" %>>📍 Mangalore (Karnataka)</option>
                    <!-- NORTH INDIA & MAHARASHTRA -->
                    <option value="Delhi" <%= "Delhi".equalsIgnoreCase(selectedCity) ? "selected" : "" %>>📍 Delhi / Punjab</option>
                    <option value="Mumbai" <%= "Mumbai".equalsIgnoreCase(selectedCity) ? "selected" : "" %>>📍 Mumbai (Maharashtra)</option>
                    <option value="Pune" <%= "Pune".equalsIgnoreCase(selectedCity) ? "selected" : "" %>>📍 Pune (Maharashtra)</option>
                    <option value="Kolkata" <%= "Kolkata".equalsIgnoreCase(selectedCity) ? "selected" : "" %>>📍 Kolkata (West Bengal)</option>
                </select>

                <input type="text" name="search" class="search-input" placeholder="Search for dishes, desserts, offers..." value="<%= searchQuery != null ? searchQuery : "" %>">
            </div>

            <button type="submit" class="filter-circle-btn" title="Search & Filter">
                <i class="fa-solid fa-sliders"></i>
            </button>
        </form>

        <!-- HERO BANNER CAROUSEL CARD -->
        <div class="hero-card">
            <div class="hero-content">
                <div class="hero-subhead">Good Food 🍃</div>
                <h1 class="hero-title">GOOD FOOD.<br>GOOD MOOD.<br>GREAT MEMORIES.</h1>
                <p class="hero-desc">Fresh ingredients, unique flavors and unforgettable experiences from top regional kitchens.</p>
                <a href="#restaurants-section" class="hero-btn">
                    EXPLORE MENU <i>➔</i>
                </a>
            </div>

            <div class="hero-img-wrapper">
                <img src="https://images.unsplash.com/photo-1544025162-d76694265947?w=600&q=80" alt="Delicious Roasted Salmon & Dish" class="hero-img">
            </div>

            <div class="hero-dots">
                <span class="dot active"></span>
                <span class="dot"></span>
                <span class="dot"></span>
                <span class="dot"></span>
            </div>
        </div>

        <!-- CATEGORY CIRCLE ROW (All Menu, Desserts & Offers) -->
        <div class="category-row">
            <a href="home?category=All" class="category-item <%= "All".equalsIgnoreCase(categoryParam) ? "active" : "" %>">
                <div class="category-circle"><i class="fa-solid fa-utensils"></i></div>
                <span class="category-label">All Menu</span>
            </a>

            <a href="home?category=Desserts" class="category-item <%= "Desserts".equalsIgnoreCase(categoryParam) ? "active" : "" %>">
                <div class="category-circle"><i class="fa-solid fa-cake-candles"></i></div>
                <span class="category-label">Desserts</span>
            </a>

            <a href="home?category=Offers" class="category-item <%= "Offers".equalsIgnoreCase(categoryParam) ? "active" : "" %>">
                <div class="category-circle"><i class="fa-solid fa-percent"></i></div>
                <span class="category-label">Offers</span>
            </a>
        </div>

        <% if ("Offers".equalsIgnoreCase(categoryParam)) { %>
            <!-- OFFERS & DISCOUNT PROMO DEALS SECTION -->
            <div style="background: linear-gradient(135deg, #0e382b 0%, #061f17 100%); border-radius: var(--radius-xl); padding: 2rem; color: #ffffff; margin-bottom: 2rem; box-shadow: var(--shadow-lg);">
                <div style="display: flex; align-items: center; justify-content: space-between; flex-wrap: wrap; gap: 1rem; border-bottom: 1px solid rgba(255,255,255,0.15); padding-bottom: 1rem; margin-bottom: 1.5rem;">
                    <div>
                        <span style="background: var(--accent-gold); color: #07221a; font-size: 0.75rem; font-weight: 800; padding: 0.3rem 0.75rem; border-radius: var(--radius-full); text-transform: uppercase; letter-spacing: 1px;">🔥 EXCLUSIVE TODAY DEALS</span>
                        <h2 style="font-family: 'Cinzel', serif; font-size: 1.85rem; font-weight: 800; margin-top: 0.5rem; color: #ffffff;">Special Discount Food Combos</h2>
                        <p style="color: rgba(255,255,255,0.8); font-size: 0.9rem;">Order your favorite regional dishes at 20% to 50% discount prices!</p>
                    </div>

                    <div style="display: flex; gap: 0.75rem; flex-wrap: wrap;">
                        <div style="background: rgba(255,255,255,0.1); border: 1px dashed var(--accent-gold); padding: 0.5rem 1rem; border-radius: var(--radius-md); text-align: center;">
                            <span style="font-size: 0.7rem; color: var(--accent-gold); font-weight: 700; display: block;">CODE: TAP20</span>
                            <span style="font-weight: 800; font-size: 0.85rem;">20% OFF ALL DISHES</span>
                        </div>
                        <div style="background: rgba(255,255,255,0.1); border: 1px dashed #22c55e; padding: 0.5rem 1rem; border-radius: var(--radius-md); text-align: center;">
                            <span style="font-size: 0.7rem; color: #86efac; font-weight: 700; display: block;">CODE: FREEDEL</span>
                            <span style="font-weight: 800; font-size: 0.85rem;">FREE DELIVERY > ₹300</span>
                        </div>
                    </div>
                </div>

                <!-- DISCOUNTED OFFER DISHES GRID -->
                <div class="dishes-grid">
                    <!-- OFFER ITEM 1: BIRYANI FEAST -->
                    <div class="dish-card" style="background: rgba(255,255,255,0.06); border: 1px solid rgba(212,163,89,0.3); color: #ffffff;">
                        <span class="dish-badge badge-bestseller" style="background: var(--accent-gold); color: #07221a;">SAVE 20% OFF</span>
                        <div class="dish-img-box">
                            <img src="https://images.unsplash.com/photo-1563379091339-03b21ab4a4f8?w=500&q=80" alt="Chettinad Biryani Combo" class="dish-img">
                        </div>
                        <h3 class="dish-title" style="color: #ffffff;">Chettinad Biryani + Nattu Kozhi Roast</h3>
                        <p class="dish-desc" style="color: rgba(255,255,255,0.7);">Special Combo: Seeraga Samba Biryani with pepper chicken roast & raita</p>
                        <div class="dish-rating" style="color: rgba(255,255,255,0.8);">
                            <i class="fa-solid fa-star" style="color: var(--accent-gold);"></i> 4.9 <span>(Code: TAP20)</span>
                        </div>
                        <div class="dish-bottom">
                            <div>
                                <span style="text-decoration: line-through; color: rgba(255,255,255,0.5); font-size: 0.85rem; margin-right: 0.4rem;">₹350</span>
                                <span class="dish-price" style="color: var(--accent-gold);">₹280</span>
                            </div>
                            <form action="cart" method="post">
                                <input type="hidden" name="action" value="add">
                                <input type="hidden" name="itemId" value="101">
                                <input type="hidden" name="redirect" value="home?category=Offers">
                                <button type="submit" class="add-plus-btn" style="background: var(--accent-gold); color: #07221a;" title="Claim Offer & Add">
                                    <i class="fa-solid fa-plus"></i>
                                </button>
                            </form>
                        </div>
                    </div>

                    <!-- OFFER ITEM 2: MADURAI KARIKADAI FEAST -->
                    <div class="dish-card" style="background: rgba(255,255,255,0.06); border: 1px solid rgba(212,163,89,0.3); color: #ffffff;">
                        <span class="dish-badge badge-chef" style="background: var(--accent-gold); color: #07221a;">SAVE ₹60 OFF</span>
                        <div class="dish-img-box">
                            <img src="https://images.unsplash.com/photo-1610192244261-3f33de3f55e4?w=500&q=80" alt="Madurai Kari Dosa Combo" class="dish-img">
                        </div>
                        <h3 class="dish-title" style="color: #ffffff;">Konar Kari Dosa + Bun Parotta Combo</h3>
                        <p class="dish-desc" style="color: rgba(255,255,255,0.7);">Madurai Special: 3-layer mutton kari dosa served with bun parotta & salna</p>
                        <div class="dish-rating" style="color: rgba(255,255,255,0.8);">
                            <i class="fa-solid fa-star" style="color: var(--accent-gold);"></i> 4.9 <span>(Code: TAP20)</span>
                        </div>
                        <div class="dish-bottom">
                            <div>
                                <span style="text-decoration: line-through; color: rgba(255,255,255,0.5); font-size: 0.85rem; margin-right: 0.4rem;">₹280</span>
                                <span class="dish-price" style="color: var(--accent-gold);">₹220</span>
                            </div>
                            <form action="cart" method="post">
                                <input type="hidden" name="action" value="add">
                                <input type="hidden" name="itemId" value="401">
                                <input type="hidden" name="redirect" value="home?category=Offers">
                                <button type="submit" class="add-plus-btn" style="background: var(--accent-gold); color: #07221a;" title="Claim Offer & Add">
                                    <i class="fa-solid fa-plus"></i>
                                </button>
                            </form>
                        </div>
                    </div>

                    <!-- OFFER ITEM 3: DESSERT TREAT COMBO -->
                    <div class="dish-card" style="background: rgba(255,255,255,0.06); border: 1px solid rgba(212,163,89,0.3); color: #ffffff;">
                        <span class="dish-badge badge-popular" style="background: #22c55e; color: #ffffff;">FLAT 50% OFF</span>
                        <div class="dish-img-box">
                            <img src="https://images.unsplash.com/photo-1572490122747-3968b75cc699?w=500&q=80" alt="Jigarthanda + Halwa Treat" class="dish-img">
                        </div>
                        <h3 class="dish-title" style="color: #ffffff;">Madurai Jigarthanda + Wheat Halwa Combo</h3>
                        <p class="dish-desc" style="color: rgba(255,255,255,0.7);">Cooling Madurai Jigarthanda paired with rich Tirunelveli ghee halwa</p>
                        <div class="dish-rating" style="color: rgba(255,255,255,0.8);">
                            <i class="fa-solid fa-star" style="color: var(--accent-gold);"></i> 5.0 <span>(Code: SWEET50)</span>
                        </div>
                        <div class="dish-bottom">
                            <div>
                                <span style="text-decoration: line-through; color: rgba(255,255,255,0.5); font-size: 0.85rem; margin-right: 0.4rem;">₹220</span>
                                <span class="dish-price" style="color: #86efac;">₹110</span>
                            </div>
                            <form action="cart" method="post">
                                <input type="hidden" name="action" value="add">
                                <input type="hidden" name="itemId" value="203">
                                <input type="hidden" name="redirect" value="home?category=Offers">
                                <button type="submit" class="add-plus-btn" style="background: #22c55e; color: #ffffff;" title="Claim Offer & Add">
                                    <i class="fa-solid fa-plus"></i>
                                </button>
                            </form>
                        </div>
                    </div>
                </div>
            </div>

        <% } else if ("Desserts".equalsIgnoreCase(categoryParam)) { %>
            <!-- DESSERTS SPECIAL SECTION -->
            <div class="section-header">
                <h2 class="section-title">🎂 Famous Desserts & Regional Sweets</h2>
                <a href="home" class="view-all-link">View All Dishes ➔</a>
            </div>

            <div class="dishes-grid">
                <!-- DESSERT 1: JIGARTHANDA -->
                <div class="dish-card">
                    <span class="dish-badge badge-bestseller">MADURAI SPECIAL</span>
                    <div class="dish-img-box">
                        <img src="https://images.unsplash.com/photo-1572490122747-3968b75cc699?w=500&q=80" alt="Special Madurai Jigarthanda" class="dish-img">
                    </div>
                    <h3 class="dish-title">Special Madurai Jigarthanda</h3>
                    <p class="dish-desc">Cooling drink made with almond gum, nannari syrup & cream ice cream</p>
                    <div class="dish-rating">
                        <i class="fa-solid fa-star"></i> 5.0 <span>(2.1k+)</span>
                    </div>
                    <div class="dish-bottom">
                        <span class="dish-price">₹90</span>
                        <form action="cart" method="post">
                            <input type="hidden" name="action" value="add">
                            <input type="hidden" name="itemId" value="203">
                            <input type="hidden" name="redirect" value="home?category=Desserts">
                            <button type="submit" class="add-plus-btn" title="Quick Add">
                                <i class="fa-solid fa-plus"></i>
                            </button>
                        </form>
                    </div>
                </div>

                <!-- DESSERT 2: WHEAT HALWA -->
                <div class="dish-card">
                    <span class="dish-badge badge-chef">NELLAI SPECIAL</span>
                    <div class="dish-img-box">
                        <img src="https://images.unsplash.com/photo-1572490122747-3968b75cc699?w=500&q=80" alt="Tirunelveli Wheat Halwa" class="dish-img">
                    </div>
                    <h3 class="dish-title">Tirunelveli Wheat Halwa (250g)</h3>
                    <p class="dish-desc">World famous ghee-loaded dark Tirunelveli wheat halwa</p>
                    <div class="dish-rating">
                        <i class="fa-solid fa-star"></i> 5.0 <span>(1.8k+)</span>
                    </div>
                    <div class="dish-bottom">
                        <span class="dish-price">₹130</span>
                        <form action="cart" method="post">
                            <input type="hidden" name="action" value="add">
                            <input type="hidden" name="itemId" value="701">
                            <input type="hidden" name="redirect" value="home?category=Desserts">
                            <button type="submit" class="add-plus-btn" title="Quick Add">
                                <i class="fa-solid fa-plus"></i>
                            </button>
                        </form>
                    </div>
                </div>

                <!-- DESSERT 3: BLACK HALWA -->
                <div class="dish-card">
                    <span class="dish-badge badge-popular">KERALA SPECIAL</span>
                    <div class="dish-img-box">
                        <img src="https://images.unsplash.com/photo-1572490122747-3968b75cc699?w=500&q=80" alt="Kozhikode Black Halwa" class="dish-img">
                    </div>
                    <h3 class="dish-title">Kozhikode Black Halwa (250g)</h3>
                    <p class="dish-desc">Authentic Kozhikode coconut oil black halwa</p>
                    <div class="dish-rating">
                        <i class="fa-solid fa-star"></i> 4.9 <span>(1.4k+)</span>
                    </div>
                    <div class="dish-bottom">
                        <span class="dish-price">₹140</span>
                        <form action="cart" method="post">
                            <input type="hidden" name="action" value="add">
                            <input type="hidden" name="itemId" value="1602">
                            <input type="hidden" name="redirect" value="home?category=Desserts">
                            <button type="submit" class="add-plus-btn" title="Quick Add">
                                <i class="fa-solid fa-plus"></i>
                            </button>
                        </form>
                    </div>
                </div>

                <!-- DESSERT 4: MYSORE PAK -->
                <div class="dish-card">
                    <span class="dish-badge badge-bestseller">MYSORE SPECIAL</span>
                    <div class="dish-img-box">
                        <img src="https://images.unsplash.com/photo-1572490122747-3968b75cc699?w=500&q=80" alt="Mysore Pak" class="dish-img">
                    </div>
                    <h3 class="dish-title">Original Mysore Pak Sweet (4 Pcs)</h3>
                    <p class="dish-desc">Melt-in-mouth pure ghee Mysore pak</p>
                    <div class="dish-rating">
                        <i class="fa-solid fa-star"></i> 5.0 <span>(1.5k+)</span>
                    </div>
                    <div class="dish-bottom">
                        <span class="dish-price">₹120</span>
                        <form action="cart" method="post">
                            <input type="hidden" name="action" value="add">
                            <input type="hidden" name="itemId" value="2502">
                            <input type="hidden" name="redirect" value="home?category=Desserts">
                            <button type="submit" class="add-plus-btn" title="Quick Add">
                                <i class="fa-solid fa-plus"></i>
                            </button>
                        </form>
                    </div>
                </div>

                <!-- DESSERT 5: DOUBLE KA MEETHA -->
                <div class="dish-card">
                    <span class="dish-badge badge-chef">HYDERABADI SPECIAL</span>
                    <div class="dish-img-box">
                        <img src="https://images.unsplash.com/photo-1572490122747-3968b75cc699?w=500&q=80" alt="Double Ka Meetha" class="dish-img">
                    </div>
                    <h3 class="dish-title">Double Ka Meetha Saffron Dessert</h3>
                    <p class="dish-desc">Fried bread dessert soaked in saffron syrup & condensed milk</p>
                    <div class="dish-rating">
                        <i class="fa-solid fa-star"></i> 4.8 <span>(980+)</span>
                    </div>
                    <div class="dish-bottom">
                        <span class="dish-price">₹120</span>
                        <form action="cart" method="post">
                            <input type="hidden" name="action" value="add">
                            <input type="hidden" name="itemId" value="1903">
                            <input type="hidden" name="redirect" value="home?category=Desserts">
                            <button type="submit" class="add-plus-btn" title="Quick Add">
                                <i class="fa-solid fa-plus"></i>
                            </button>
                        </form>
                    </div>
                </div>

                <!-- DESSERT 6: BENGALI RASGULLA -->
                <div class="dish-card">
                    <span class="dish-badge badge-popular">KOLKATA SPECIAL</span>
                    <div class="dish-img-box">
                        <img src="https://images.unsplash.com/photo-1572490122747-3968b75cc699?w=500&q=80" alt="Bengali Rasgulla" class="dish-img">
                    </div>
                    <h3 class="dish-title">Soft Sponge Bengali Rasgulla (4 Pcs)</h3>
                    <p class="dish-desc">Cottage cheese balls soaked in cardamom sugar syrup</p>
                    <div class="dish-rating">
                        <i class="fa-solid fa-star"></i> 4.9 <span>(1.6k+)</span>
                    </div>
                    <div class="dish-bottom">
                        <span class="dish-price">₹90</span>
                        <form action="cart" method="post">
                            <input type="hidden" name="action" value="add">
                            <input type="hidden" name="itemId" value="3003">
                            <input type="hidden" name="redirect" value="home?category=Desserts">
                            <button type="submit" class="add-plus-btn" title="Quick Add">
                                <i class="fa-solid fa-plus"></i>
                            </button>
                        </form>
                    </div>
                </div>
            </div>

        <% } else { %>
            <!-- POPULAR DISHES FEATURED SECTION -->
            <div class="section-header">
                <h2 class="section-title">Popular Dishes</h2>
                <a href="#restaurants-section" class="view-all-link">View All ➔</a>
            </div>

            <div class="dishes-grid">
                <!-- DISH CARD 1 -->
                <div class="dish-card">
                    <span class="dish-badge badge-bestseller">BESTSELLER</span>
                    <div class="dish-img-box">
                        <img src="https://images.unsplash.com/photo-1563379091339-03b21ab4a4f8?w=500&q=80" alt="Chettinad Special Biryani" class="dish-img">
                    </div>
                    <h3 class="dish-title">Chettinad Chicken Biryani</h3>
                    <p class="dish-desc">Seeraga Samba rice cooked with fresh herbs & spices</p>
                    <div class="dish-rating">
                        <i class="fa-solid fa-star"></i> 4.9 <span>(1.2k+)</span>
                    </div>
                    <div class="dish-bottom">
                        <span class="dish-price">₹280</span>
                        <form action="cart" method="post">
                            <input type="hidden" name="action" value="add">
                            <input type="hidden" name="itemId" value="101">
                            <input type="hidden" name="redirect" value="home">
                            <button type="submit" class="add-plus-btn" title="Quick Add">
                                <i class="fa-solid fa-plus"></i>
                            </button>
                        </form>
                    </div>
                </div>

                <!-- DISH CARD 2 -->
                <div class="dish-card">
                    <span class="dish-badge badge-chef">CHEF'S PICK</span>
                    <div class="dish-img-box">
                        <img src="https://images.unsplash.com/photo-1610192244261-3f33de3f55e4?w=500&q=80" alt="Crispy Benne Masala Dosa" class="dish-img">
                    </div>
                    <h3 class="dish-title">Crispy Benne Masala Dosa</h3>
                    <p class="dish-desc">Golden butter dosa with potato palya & coconut chutney</p>
                    <div class="dish-rating">
                        <i class="fa-solid fa-star"></i> 4.9 <span>(950+)</span>
                    </div>
                    <div class="dish-bottom">
                        <span class="dish-price">₹120</span>
                        <form action="cart" method="post">
                            <input type="hidden" name="action" value="add">
                            <input type="hidden" name="itemId" value="108">
                            <input type="hidden" name="redirect" value="home">
                            <button type="submit" class="add-plus-btn" title="Quick Add">
                                <i class="fa-solid fa-plus"></i>
                            </button>
                        </form>
                    </div>
                </div>

                <!-- DISH CARD 3 -->
                <div class="dish-card">
                    <span class="dish-badge badge-popular">POPULAR</span>
                    <div class="dish-img-box">
                        <img src="https://images.unsplash.com/photo-1525755662778-989d0524087e?w=500&q=80" alt="Karimeen Pollichathu" class="dish-img">
                    </div>
                    <h3 class="dish-title">Karimeen Pollichathu</h3>
                    <p class="dish-desc">Fresh Pearlspot fish grilled in banana leaf</p>
                    <div class="dish-rating">
                        <i class="fa-solid fa-star"></i> 4.8 <span>(740+)</span>
                    </div>
                    <div class="dish-bottom">
                        <span class="dish-price">₹380</span>
                        <form action="cart" method="post">
                            <input type="hidden" name="action" value="add">
                            <input type="hidden" name="itemId" value="1701">
                            <input type="hidden" name="redirect" value="home">
                            <button type="submit" class="add-plus-btn" title="Quick Add">
                                <i class="fa-solid fa-plus"></i>
                            </button>
                        </form>
                    </div>
                </div>
            </div>
        <% } %>

        <!-- WEEKEND SPECIAL OFFER PROMO CARD -->
        <div class="promo-card" id="offers-section">
            <div>
                <div class="promo-tag">WEEKEND SPECIAL</div>
                <h2 class="promo-title">ENJOY 20% OFF<br>ON ALL ORDERS</h2>
                <a href="home?category=Offers" class="hero-btn" style="padding: 0.6rem 1.2rem; font-size: 0.78rem;">
                    CLAIM OFFERS NOW <i>➔</i>
                </a>
            </div>
            <img src="https://images.unsplash.com/photo-1606313564200-e75d5e30476c?w=400&q=80" alt="Chocolate Lava Dessert Offer" class="promo-img">
        </div>

        <!-- STATE CUISINE PILL FILTER BAR -->
        <div class="pill-bar">
            <a href="home?state=All" class="pill-item <%= "All".equalsIgnoreCase(selectedState) ? "active" : "" %>">All States</a>
            <a href="home?state=Tamil Nadu" class="pill-item <%= "Tamil Nadu".equalsIgnoreCase(selectedState) ? "active" : "" %>">🌴 Tamil Nadu</a>
            <a href="home?state=Kerala" class="pill-item <%= "Kerala".equalsIgnoreCase(selectedState) ? "active" : "" %>">🥥 Kerala</a>
            <a href="home?state=Andhra" class="pill-item <%= "Andhra".equalsIgnoreCase(selectedState) ? "active" : "" %>">🌶️ Andhra & Telangana</a>
            <a href="home?state=Karnataka" class="pill-item <%= "Karnataka".equalsIgnoreCase(selectedState) ? "active" : "" %>">💛 Karnataka</a>
            <a href="home?state=North Indian" class="pill-item <%= "North Indian".equalsIgnoreCase(selectedState) ? "active" : "" %>">🫓 Delhi & Punjab</a>
            <a href="home?state=Maharashtra" class="pill-item <%= "Maharashtra".equalsIgnoreCase(selectedState) ? "active" : "" %>">🌊 Mumbai & Pune</a>
            <a href="home?state=West Bengal" class="pill-item <%= "West Bengal".equalsIgnoreCase(selectedState) ? "active" : "" %>">🍨 Kolkata</a>
        </div>

        <!-- FAMOUS REGIONAL RESTAURANTS SECTION -->
        <div class="section-header" id="restaurants-section">
            <h2 class="section-title">
                <%= searchQuery != null && !searchQuery.isEmpty() ? "Search Results for \"" + searchQuery + "\"" : "Famous Regional Kitchens" %>
            </h2>
            <% if ((searchQuery != null && !searchQuery.isEmpty()) || (selectedState != null && !"All".equals(selectedState)) || (selectedCity != null && !"All".equals(selectedCity))) { %>
                <a href="home" class="view-all-link">Reset Filters</a>
            <% } %>
        </div>

        <div class="grid">
            <% if (restaurantList != null && !restaurantList.isEmpty()) { 
                for (Restaurant r : restaurantList) { %>
                    <div class="card <%= !r.isOpen() ? "disabled-card" : "" %>">
                        <div class="card-img-wrapper">
                            <img src="<%= r.getImagePath() %>" alt="<%= r.getName() %>" class="card-img">
                            
                            <div style="position: absolute; top: 1rem; left: 1rem;">
                                <% if (r.isOpen()) { %>
                                    <span class="status-open">OPEN</span>
                                <% } else { %>
                                    <span class="status-closed">CLOSED</span>
                                <% } %>
                            </div>

                            <div class="badge-rating">
                                <i class="fa-solid fa-star"></i> <%= r.getRating() %>
                            </div>
                        </div>
                        
                        <div class="card-body">
                            <div style="display: flex; justify-content: space-between; align-items: start; margin-bottom: 0.25rem;">
                                <h3 class="card-title"><%= r.getName() %></h3>
                                <span style="background: rgba(14, 56, 43, 0.08); color: var(--primary-green); font-size: 0.72rem; font-weight: 800; padding: 0.2rem 0.55rem; border-radius: var(--radius-sm); border: 1px solid var(--border-green);">
                                    <%= r.getStateCuisine() %>
                                </span>
                            </div>

                            <p class="card-subtitle"><%= r.getCuisineType() %></p>
                            <p class="card-subtitle" style="margin-bottom: 0.75rem;"><i class="fa-solid fa-location-dot" style="color: var(--accent-gold);"></i> <%= r.getAddress() %></p>
                            
                            <div class="card-footer">
                                <span style="color: var(--text-secondary); font-size: 0.85rem; font-weight: 600;">
                                    <i class="fa-solid fa-clock"></i> <%= r.getDeliveryTime() %>
                                </span>
                                
                                <% if (r.isOpen()) { %>
                                    <a href="menu?restaurantId=<%= r.getRestaurantId() %>" class="btn-primary">
                                        View Menu <i class="fa-solid fa-arrow-right"></i>
                                    </a>
                                <% } else { %>
                                    <button class="btn-disabled" disabled>
                                        <i class="fa-solid fa-lock"></i> Closed
                                    </button>
                                <% } %>
                            </div>
                        </div>
                    </div>
                <% } 
            } else { %>
                <div style="grid-column: 1 / -1; text-align: center; padding: 3rem; background: var(--bg-card); border-radius: var(--radius-lg);">
                    <i class="fa-solid fa-utensils" style="font-size: 3rem; color: var(--text-muted); margin-bottom: 1rem;"></i>
                    <h3>No Restaurants Found</h3>
                    <p style="color: var(--text-secondary); margin-top: 0.5rem;">Try resetting filters or searching for another district name (e.g. Trichy, Salem, Tirunelveli, Erode, Vellore, Thanjavur, Kanyakumari, Kozhikode, Mysore, Pune).</p>
                </div>
            <% } %>
        </div>

    </main>

    <!-- FLOATING BOTTOM NAVIGATION BAR -->
    <div class="bottom-nav">
        <a href="home" class="bottom-nav-item active">
            <i class="fa-solid fa-house"></i>
            <span>Home</span>
        </a>
        <a href="#restaurants-section" class="bottom-nav-item">
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
