-- TAP Academy Food App Database Schema & Seed Data
-- Database: food_app_db

CREATE DATABASE IF NOT EXISTS food_app_db;
USE food_app_db;

-- 1. Users Table
CREATE TABLE IF NOT EXISTS user (
    userId INT AUTO_INCREMENT PRIMARY KEY,
    username VARCHAR(100) NOT NULL UNIQUE,
    password VARCHAR(100) NOT NULL,
    email VARCHAR(100) NOT NULL UNIQUE,
    phone VARCHAR(20),
    address TEXT,
    role VARCHAR(20) DEFAULT 'Customer',
    createdDate TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- 2. Restaurant Table
CREATE TABLE IF NOT EXISTS restaurant (
    restaurantId INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    cuisineType VARCHAR(100),
    deliveryTime VARCHAR(50),
    address VARCHAR(255),
    rating DOUBLE DEFAULT 4.5,
    imagePath VARCHAR(255),
    isActive BOOLEAN DEFAULT TRUE,
    isVeg BOOLEAN DEFAULT FALSE,
    state VARCHAR(100),
    city VARCHAR(100)
);

-- 3. Menu Table
CREATE TABLE IF NOT EXISTS menu (
    menuId INT AUTO_INCREMENT PRIMARY KEY,
    restaurantId INT NOT NULL,
    itemName VARCHAR(100) NOT NULL,
    description TEXT,
    price DOUBLE NOT NULL,
    rating DOUBLE DEFAULT 4.5,
    isAvailable BOOLEAN DEFAULT TRUE,
    imagePath VARCHAR(255),
    FOREIGN KEY (restaurantId) REFERENCES restaurant(restaurantId) ON DELETE CASCADE
);

-- 4. Orders Table
CREATE TABLE IF NOT EXISTS orders (
    orderId INT AUTO_INCREMENT PRIMARY KEY,
    userId INT NOT NULL,
    restaurantId INT NOT NULL,
    totalAmount DOUBLE NOT NULL,
    status VARCHAR(50) DEFAULT 'Pending',
    paymentMode VARCHAR(50),
    orderDate TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (userId) REFERENCES user(userId),
    FOREIGN KEY (restaurantId) REFERENCES restaurant(restaurantId)
);

-- 5. Order Item Table
CREATE TABLE IF NOT EXISTS order_item (
    orderItemId INT AUTO_INCREMENT PRIMARY KEY,
    orderId INT NOT NULL,
    menuId INT NOT NULL,
    quantity INT NOT NULL,
    itemTotal DOUBLE NOT NULL,
    FOREIGN KEY (orderId) REFERENCES orders(orderId) ON DELETE CASCADE,
    FOREIGN KEY (menuId) REFERENCES menu(menuId)
);

-- 6. Order History Table
CREATE TABLE IF NOT EXISTS order_history (
    orderHistoryId INT AUTO_INCREMENT PRIMARY KEY,
    orderId INT NOT NULL,
    userId INT NOT NULL,
    totalAmount DOUBLE NOT NULL,
    status VARCHAR(50),
    orderDate TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (orderId) REFERENCES orders(orderId),
    FOREIGN KEY (userId) REFERENCES user(userId)
);

-- ==========================================
-- SEED DATA
-- ==========================================

-- Seed Sample User
INSERT INTO user (userId, username, password, email, phone, address, role) 
VALUES (1, 'tapuser', 'tap123', 'user@tapacademy.com', '9876543210', 'BTM Layout, Bangalore, Karnataka', 'Customer')
ON DUPLICATE KEY UPDATE username=VALUES(username);

-- Seed Restaurants (Tamil Nadu, Kerala, Karnataka, Andhra, Maharashtra, etc.)
INSERT INTO restaurant (restaurantId, name, cuisineType, deliveryTime, address, rating, imagePath, isActive, isVeg, state, city) VALUES
(1, 'Aalishan Biryani & Grill', 'Chicken Biryani, Mutton Chukka, Chettinad Spices', '25-35 mins', 'Anna Nagar, Chennai District, Tamil Nadu', 4.8, 'https://images.unsplash.com/photo-1563379091339-03b21ab4a4f8?w=500&q=80', TRUE, FALSE, 'Tamil Nadu', 'Chennai'),
(2, 'Murugan Idli Shop', 'Podi Idli, Ghee Onion Rava Dosa, Jigarthanda', '15-20 mins', 'T. Nagar, Chennai District, Tamil Nadu', 4.9, 'https://images.unsplash.com/photo-1514432324607-a09d9b4aefdd?w=500&q=80', TRUE, TRUE, 'Tamil Nadu', 'Chennai'),
(3, 'Madurai Amma Mess', 'Ayirai Meen Kuzhambu, Bone Marrow Omelette, Mutton Chukka', '20-30 mins', 'Tallakulam, Madurai District, Tamil Nadu', 4.9, 'https://images.unsplash.com/photo-1599487488170-d11ec9c172f0?w=500&q=80', TRUE, FALSE, 'Tamil Nadu', 'Madurai'),
(4, 'Madurai Konar Kadai & Kari Dosa', 'Konar Kari Dosa, Elumbu Roast, Bun Parotta, Jigarthanda', '15-25 mins', 'Simmakkal, Madurai District, Tamil Nadu', 4.9, 'https://images.unsplash.com/photo-1610192244261-3f33de3f55e4?w=500&q=80', TRUE, FALSE, 'Tamil Nadu', 'Madurai'),
(5, 'Trichy Ezham Suvai Mess & Biryani', 'Trichy Mutton Biryani, Nandu Masala, Parotta', '20-30 mins', 'Chatram Bus Stand, Trichy District, Tamil Nadu', 4.8, 'https://images.unsplash.com/photo-1563379091339-03b21ab4a4f8?w=500&q=80', TRUE, FALSE, 'Tamil Nadu', 'Trichy'),
(6, 'Salem Selvi Mess & Mutton Roast', 'Salem Special Mutton Chukka, Pallipalayam Chicken', '20-30 mins', 'Five Roads, Salem District, Tamil Nadu', 4.8, 'https://images.unsplash.com/photo-1599487488170-d11ec9c172f0?w=500&q=80', TRUE, FALSE, 'Tamil Nadu', 'Salem'),
(7, 'Tirunelveli Iruttukadai Halwa & Nellai Mess', 'Nellai Sodhi Meals, Tirunelveli Wheat Halwa, Chicken Fry', '15-25 mins', 'Town, Tirunelveli District, Tamil Nadu', 4.9, 'https://images.unsplash.com/photo-1572490122747-3968b75cc699?w=500&q=80', TRUE, FALSE, 'Tamil Nadu', 'Tirunelveli'),
(8, 'Coimbatore Annapoorna Gowrishankar', 'Sambar Vadai, Ghee Roast, Filter Coffee', '15-20 mins', 'RS Puram, Coimbatore District, Tamil Nadu', 4.8, 'https://images.unsplash.com/photo-1610192244261-3f33de3f55e4?w=500&q=80', TRUE, TRUE, 'Tamil Nadu', 'Coimbatore'),
(9, 'Bangalore Vidyarthi Bhavan & CTR', 'Benne Masala Dosa, Crispy Rava Vada, Filter Coffee', '15-25 mins', 'Gandhi Bazaar, Basavanagudi, Bangalore, Karnataka', 4.9, 'https://images.unsplash.com/photo-1610192244261-3f33de3f55e4?w=500&q=80', TRUE, TRUE, 'Karnataka', 'Bangalore'),
(10, 'Nagarjuna Andhra Style Restaurant', 'Andhra Chicken Biryani, Mutton Fry, Guntur Chicken, Meal', '20-30 mins', 'Indiranagar, Bangalore, Karnataka', 4.8, 'https://images.unsplash.com/photo-1563379091339-03b21ab4a4f8?w=500&q=80', TRUE, FALSE, 'Karnataka', 'Bangalore'),
(11, 'Empire Restaurant Bangalore', 'Empire Special Coin Parotta, Ghee Rice, Grill Chicken', '25-35 mins', 'Koramangala, Bangalore, Karnataka', 4.7, 'https://images.unsplash.com/photo-1599487488170-d11ec9c172f0?w=500&q=80', TRUE, FALSE, 'Karnataka', 'Bangalore'),
(12, 'Malabar Coast Kitchen & Paragon', 'Kozhikode Biryani, Kerala Appam, Beef Roast, Fish Curry', '30-40 mins', 'MG Road, Kochi, Ernakulam District, Kerala', 4.8, 'https://images.unsplash.com/photo-1589301760014-d929f3979dbc?w=500&q=80', TRUE, FALSE, 'Kerala', 'Kochi'),
(13, 'Paradise Biryani Hyderabad', 'Hyderabadi Double Ek Dum Mutton Biryani, Mirchi Ka Salan', '25-35 mins', 'Secunderabad, Hyderabad, Telangana', 4.8, 'https://images.unsplash.com/photo-1563379091339-03b21ab4a4f8?w=500&q=80', TRUE, FALSE, 'Telangana', 'Hyderabad'),
(14, 'Bawarchi Biryani RTC X Roads', 'Classic Hyderabadi Chicken Dum Biryani, Apollo Fish', '20-30 mins', 'RTC X Roads, Hyderabad, Telangana', 4.9, 'https://images.unsplash.com/photo-1563379091339-03b21ab4a4f8?w=500&q=80', TRUE, FALSE, 'Telangana', 'Hyderabad'),
(15, 'Bade Miya & Britannia & Co.', 'Berry Pulao, Mutton Salli Boti, Chicken Baida Roti', '25-35 mins', 'Colaba & Fort, Mumbai, Maharashtra', 4.8, 'https://images.unsplash.com/photo-1517248135467-4c7edcad34c4?w=500&q=80', TRUE, FALSE, 'Maharashtra', 'Mumbai')
ON DUPLICATE KEY UPDATE name=VALUES(name);

-- Seed Sample Menu Items
INSERT INTO menu (menuId, restaurantId, itemName, description, price, rating, isAvailable, imagePath) VALUES
(101, 1, 'Chettinad Special Chicken Biryani', 'Traditional Seeraga Samba rice cooked with aromatic herbs, tender chicken and homemade Chettinad masala.', 280.0, 4.9, TRUE, 'https://images.unsplash.com/photo-1563379091339-03b21ab4a4f8?w=500&q=80'),
(102, 1, 'Nattu Kozhi Chukka', 'Country chicken roasted with shallots, crushed black pepper and fresh curry leaves.', 320.0, 4.8, TRUE, 'https://images.unsplash.com/photo-1603894584373-5ac82b2ae398?w=500&q=80'),
(103, 1, 'Bun Parotta with Mutton Salna', 'Flaky Madurai style layered bun parotta served with piping hot spicy mutton salna.', 120.0, 4.9, TRUE, 'https://images.unsplash.com/photo-1626777552726-4a6b54c97e46?w=500&q=80'),
(104, 2, 'Ghee Podi Idli (4 Pcs)', 'Soft mini idlis tossed in generous homemade ghee and aromatic spicy gun powder.', 110.0, 4.9, TRUE, 'https://images.unsplash.com/photo-1589301760014-d929f3979dbc?w=500&q=80'),
(105, 2, 'Special Ghee Onion Rava Dosa', 'Super crispy golden semolina crepe filled with chopped onions, green chillies and cashews.', 140.0, 4.8, TRUE, 'https://images.unsplash.com/photo-1610192244261-3f33de3f55e4?w=500&q=80'),
(106, 3, 'Madurai Ayirai Meen Kuzhambu', 'Rare and famous fresh water spiny eel fish curry cooked in earthen clay pots with tangy tamarind.', 350.0, 5.0, TRUE, 'https://images.unsplash.com/photo-1599487488170-d11ec9c172f0?w=500&q=80'),
(107, 4, 'Madurai Special Konar Kari Dosa', 'Three layered thick dosa loaded with fluffy egg and spicy minced mutton fry.', 260.0, 4.9, TRUE, 'https://images.unsplash.com/photo-1610192244261-3f33de3f55e4?w=500&q=80'),
(108, 9, 'Crispy Benne Masala Dosa', 'Iconic Bengaluru butter dosa served with red chilli garlic chutney, potato palya and coconut chutney.', 120.0, 4.9, TRUE, 'https://images.unsplash.com/photo-1610192244261-3f33de3f55e4?w=500&q=80'),
(109, 10, 'Andhra Special Mutton Biryani', 'Spicy Andhra style fragrant basmati rice biryani cooked with marinated mutton pieces.', 340.0, 4.8, TRUE, 'https://images.unsplash.com/photo-1563379091339-03b21ab4a4f8?w=500&q=80'),
(110, 13, 'Hyderabadi Mutton Dum Biryani', 'World famous Hyderabadi dum biryani cooked slow on coal with tender mutton, saffron and herbs.', 380.0, 4.9, TRUE, 'https://images.unsplash.com/photo-1563379091339-03b21ab4a4f8?w=500&q=80')
ON DUPLICATE KEY UPDATE itemName=VALUES(itemName);
