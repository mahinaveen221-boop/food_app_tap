# 🍕 Online Food Delivery Web Application (`food_app_tap`)

<div align="center">

![Java](https://img.shields.io/badge/Java_EE-ED8B00?style=for-the-badge&logo=openjdk&logoColor=white)
![Tomcat](https://img.shields.io/badge/Apache_Tomcat_10-F8DC75?style=for-the-badge&logo=apache-tomcat&logoColor=black)
![MySQL](https://img.shields.io/badge/MySQL_8.0-4479A1?style=for-the-badge&logo=mysql&logoColor=white)
![Architecture](https://img.shields.io/badge/Architecture-MVC%20%2B%20DAO-6366f1?style=for-the-badge)

**A complete enterprise-grade full-stack food ordering platform designed & developed using Java Servlets, JSP, JDBC, and MySQL.**

</div>

---

## 📌 Project Overview

**Online Food Delivery Web Application** is a production-style monolithic web platform built from scratch without heavy backend frameworks to master Core & Advanced Java principles. 

It handles the entire customer food ordering journey — from user onboarding and restaurant discovery to cart state manipulation, transactional checkout, and historical order auditing.

---

## 🏛️ System Architecture

The application strictly implements the **MVC (Model-View-Controller)** pattern combined with the **DAO (Data Access Object)** pattern for clean separation of concerns and robust maintainability.

```text
 ┌─────────────────────────────────────────────────────────────┐
 │                       CLIENT (Browser)                      │
 │   home.jsp | menu.jsp | cart.jsp | orderConfirmation.jsp    │
 └──────────────────────────────┬──────────────────────────────┘
                                │ HTTP Requests / Forms
                                ▼
 ┌─────────────────────────────────────────────────────────────┐
 │                  CONTROLLER LAYER (Servlets)                │
 │   HomeServlet | MenuServlet | CartServlet | CheckoutServlet │
 └──────────────────────────────┬──────────────────────────────┘
                                │
                                ▼
 ┌─────────────────────────────────────────────────────────────┐
 │                   BUSINESS & MODEL LAYER                    │
 │   User | Restaurant | Menu | CartItem | Order | OrderItem   │
 └──────────────────────────────┬──────────────────────────────┘
                                │
                                ▼
 ┌─────────────────────────────────────────────────────────────┐
 │                DATA ACCESS LAYER (DAO Pattern)              │
 │   UserDAOImpl | RestaurantDAOImpl | MenuDAOImpl | OrderDAO  │
 └──────────────────────────────┬──────────────────────────────┘
                                │ JDBC Connection Pooling (DBUtils)
                                ▼
 ┌─────────────────────────────────────────────────────────────┐
 │                     MySQL DATABASE                          │
 │      food_app_tap (Users, Restaurants, Menus, Orders)       │
 └─────────────────────────────────────────────────────────────┘
```

---

## ✨ Key Features & Modules

### 1. 🔐 User Authentication & Session Management
- Multi-step registration and login pipelines validated against MySQL records.
- Stateful sessions managed using `HttpSession` to maintain active user identity and prevent unauthorized cart tampering.
- Role-based redirection and clean logout cache invalidation.

### 2. 🍽️ Restaurant & Menu Discovery
- Dynamic restaurant listing with cuisine types, ratings, and delivery estimates (`RestaurantDAO`).
- Menu browser with real-time dish availability status, pricing, and high-res representations (`MenuDAO`).

### 3. 🛒 Dynamic Session-Based Shopping Cart
- In-memory cart stored directly inside user session (`CartItem`, `CartServlet`).
- Full support for real-time quantity addition, item increment/decrement, dynamic subtotal calculation, and complete item removal.

### 4. 💳 Transaction-Safe Checkout
- Multi-record atomic order creation via `CheckoutServlet`.
- Inserts primary order records into `orders` and granular line items into `order_items` with referential integrity.

### 5. 📦 Order History & Auditing
- Historical purchase log page (`orderHistory.jsp`) allowing customers to review past deliveries, total expenditure, and ordered dishes.

---

## 🗄️ Database Schema Design (`food_app_db.sql`)

The backend is backed by a normalized relational database schema with foreign key constraints:

- **`users`**: Customer credentials, contact numbers, delivery addresses.
- **`restaurant`**: Registered dining venues, cuisine tags, delivery duration, ratings.
- **`menu`**: Dishes linked via `restaurantId` foreign key, availability flags.
- **`orders`**: Transaction parent entries linked to `userId` and `restaurantId`.
- **`order_items`**: Child table capturing exact quantity and unit prices at the time of purchase.

---

## 🚀 Setup & Execution Guide

### Prerequisites:
- **Java Development Kit (JDK 8 or 17+)**
- **Apache Tomcat 10.1+**
- **MySQL Server 8.0+**
- **Eclipse IDE for Enterprise Java and Web Developers**

### Steps:
1. **Import Database:**
   ```bash
   mysql -u root -p < food_app_db.sql
   ```
2. **Configure Connection:**
   - Update your MySQL credentials inside `src/com/tap/util/DBUtils.java`.
3. **Deploy on Tomcat:**
   - Import the project into Eclipse as an *Existing Dynamic Web Project*.
   - Right-click project ➔ **Run As** ➔ **Run on Server** (Select Apache Tomcat 10).
4. **Access the App:**
   - Open browser at `http://localhost:8080/food_app_tap/`.

---

## 👨‍💻 Developer & Credits

* **Developer:** **Naveenraja K**
* **Role:** Java Full Stack Developer Trainee
* **Training Institute:** **TAP Academy**, Bangalore
* **LinkedIn:** [Naveenraja K](https://www.linkedin.com/in/naveen-raja-9843b0350/)
* **Portfolio:** [Live Portfolio](https://mahinaveen221-boop.github.io/Portfolio/)
