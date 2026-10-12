<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
    String errorMessage = (String) request.getAttribute("errorMessage");
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Sign Up - TASTE HAVEN</title>
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
            <a href="login" class="btn-primary" style="padding: 0.5rem 1rem; font-size: 0.8rem;">
                Log In
            </a>
        </div>
    </nav>

    <main class="container" style="max-width: 500px; margin: 1.5rem auto;">
        <div style="background: var(--bg-card); border: 1px solid var(--border-subtle); border-radius: var(--radius-lg); padding: 2rem; box-shadow: var(--shadow-md);">
            <div style="text-align: center; margin-bottom: 1.5rem;">
                <div style="margin: 0 auto 0.75rem; width: 56px; height: 56px; border-radius: 50%; background: var(--primary-green); color: var(--text-light); display: flex; align-items: center; justify-content: center; font-size: 1.35rem; box-shadow: var(--shadow-sm);">
                    <i class="fa-solid fa-user-plus"></i>
                </div>
                <h2 style="font-family: 'Cinzel', serif; font-size: 1.6rem; font-weight: 800; color: var(--text-primary);">Create Account</h2>
                <p style="color: var(--text-secondary); font-size: 0.88rem; margin-top: 0.25rem;">Join TASTE HAVEN for fast food ordering & rewards</p>
            </div>

            <% if (errorMessage != null) { %>
                <div style="background: #fef2f2; border: 1px solid #fca5a5; color: #991b1b; padding: 0.65rem 0.85rem; border-radius: var(--radius-sm); margin-bottom: 1.25rem; font-size: 0.85rem;">
                    <i class="fa-solid fa-circle-exclamation"></i> <%= errorMessage %>
                </div>
            <% } %>

            <form action="register" method="post">
                <div style="margin-bottom: 0.9rem;">
                    <label style="display: block; font-size: 0.8rem; font-weight: 700; margin-bottom: 0.35rem; color: var(--text-secondary);"><i class="fa-solid fa-user"></i> Full Name</label>
                    <input type="text" name="username" style="width: 100%; padding: 0.7rem; border-radius: var(--radius-sm); border: 1px solid var(--border-subtle); background: var(--bg-card-alt); font-size: 0.88rem; outline: none;" placeholder="e.g. Rahul Sharma" required>
                </div>

                <div style="margin-bottom: 0.9rem;">
                    <label style="display: block; font-size: 0.8rem; font-weight: 700; margin-bottom: 0.35rem; color: var(--text-secondary);"><i class="fa-solid fa-envelope"></i> Email Address</label>
                    <input type="email" name="email" style="width: 100%; padding: 0.7rem; border-radius: var(--radius-sm); border: 1px solid var(--border-subtle); background: var(--bg-card-alt); font-size: 0.88rem; outline: none;" placeholder="rahul@example.com" required>
                </div>

                <div style="margin-bottom: 0.9rem;">
                    <label style="display: block; font-size: 0.8rem; font-weight: 700; margin-bottom: 0.35rem; color: var(--text-secondary);"><i class="fa-solid fa-phone"></i> Mobile Phone</label>
                    <input type="tel" name="phone" style="width: 100%; padding: 0.7rem; border-radius: var(--radius-sm); border: 1px solid var(--border-subtle); background: var(--bg-card-alt); font-size: 0.88rem; outline: none;" placeholder="9876543210" required>
                </div>

                <div style="margin-bottom: 0.9rem;">
                    <label style="display: block; font-size: 0.8rem; font-weight: 700; margin-bottom: 0.35rem; color: var(--text-secondary);"><i class="fa-solid fa-key"></i> Password</label>
                    <input type="password" name="password" style="width: 100%; padding: 0.7rem; border-radius: var(--radius-sm); border: 1px solid var(--border-subtle); background: var(--bg-card-alt); font-size: 0.88rem; outline: none;" placeholder="Create password" required>
                </div>

                <div style="margin-bottom: 1.25rem;">
                    <label style="display: block; font-size: 0.8rem; font-weight: 700; margin-bottom: 0.35rem; color: var(--text-secondary);"><i class="fa-solid fa-location-dot"></i> Delivery Address</label>
                    <textarea name="address" style="width: 100%; padding: 0.7rem; border-radius: var(--radius-sm); border: 1px solid var(--border-subtle); background: var(--bg-card-alt); font-size: 0.88rem; outline: none;" rows="2" placeholder="Door No, Street Name, Area, City" required></textarea>
                </div>

                <button type="submit" class="btn-primary" style="width: 100%; justify-content: center; padding: 0.8rem; font-size: 0.95rem; margin-bottom: 1.25rem;">
                    Create Account <i class="fa-solid fa-check-circle"></i>
                </button>
            </form>

            <div style="text-align: center; color: var(--text-secondary); font-size: 0.85rem;">
                Already registered? <a href="login" style="color: var(--primary-green); text-decoration: none; font-weight: 800;">Log In Here</a>
            </div>
        </div>
    </main>

    <!-- FOOTER -->
    <footer>
        <p>&copy; 2026 TASTE HAVEN RESTAURANT (TAP Foods Delivery Application). All Rights Reserved.</p>
    </footer>

</body>
</html>
