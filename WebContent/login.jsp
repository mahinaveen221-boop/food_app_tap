<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
    String errorMessage = (String) request.getAttribute("errorMessage");
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Login - TASTE HAVEN</title>
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
            <a href="register" class="btn-primary" style="padding: 0.5rem 1rem; font-size: 0.8rem;">
                Sign Up
            </a>
        </div>
    </nav>

    <main class="container" style="max-width: 480px; margin: 2rem auto;">
        <div style="background: var(--bg-card); border: 1px solid var(--border-subtle); border-radius: var(--radius-lg); padding: 2rem; box-shadow: var(--shadow-md);">
            <div style="text-align: center; margin-bottom: 1.5rem;">
                <div style="margin: 0 auto 0.75rem; width: 56px; height: 56px; border-radius: 50%; background: var(--primary-green); color: var(--text-light); display: flex; align-items: center; justify-content: center; font-size: 1.35rem; box-shadow: var(--shadow-sm);">
                    <i class="fa-solid fa-lock"></i>
                </div>
                <h2 style="font-family: 'Cinzel', serif; font-size: 1.6rem; font-weight: 800; color: var(--text-primary);">Welcome Back</h2>
                <p style="color: var(--text-secondary); font-size: 0.88rem; margin-top: 0.25rem;">Log in to track your food orders & save delivery address</p>
            </div>

            <% if (errorMessage != null) { %>
                <div style="background: #fef2f2; border: 1px solid #fca5a5; color: #991b1b; padding: 0.65rem 0.85rem; border-radius: var(--radius-sm); margin-bottom: 1.25rem; font-size: 0.85rem;">
                    <i class="fa-solid fa-circle-exclamation"></i> <%= errorMessage %>
                </div>
            <% } %>

            <form action="login" method="post">
                <div style="margin-bottom: 1rem;">
                    <label style="display: block; font-size: 0.8rem; font-weight: 700; margin-bottom: 0.35rem; color: var(--text-secondary);"><i class="fa-solid fa-envelope"></i> Email Address</label>
                    <input type="email" name="email" style="width: 100%; padding: 0.75rem; border-radius: var(--radius-sm); border: 1px solid var(--border-subtle); background: var(--bg-card-alt); font-size: 0.9rem; outline: none;" placeholder="user@tapacademy.com" required>
                </div>

                <div style="margin-bottom: 1.5rem;">
                    <label style="display: block; font-size: 0.8rem; font-weight: 700; margin-bottom: 0.35rem; color: var(--text-secondary);"><i class="fa-solid fa-key"></i> Password</label>
                    <input type="password" name="password" style="width: 100%; padding: 0.75rem; border-radius: var(--radius-sm); border: 1px solid var(--border-subtle); background: var(--bg-card-alt); font-size: 0.9rem; outline: none;" placeholder="••••••••" required>
                </div>

                <button type="submit" class="btn-primary" style="width: 100%; justify-content: center; padding: 0.8rem; font-size: 0.95rem; margin-bottom: 1.25rem;">
                    Log In <i class="fa-solid fa-right-to-bracket"></i>
                </button>
            </form>

            <div style="text-align: center; color: var(--text-secondary); font-size: 0.85rem;">
                Don't have an account? <a href="register" style="color: var(--primary-green); text-decoration: none; font-weight: 800;">Sign Up Here</a>
            </div>
            
            <div style="margin-top: 1.25rem; padding-top: 1rem; border-top: 1px solid var(--border-subtle); text-align: center; font-size: 0.8rem; color: var(--text-muted);">
                <strong>Demo Credentials:</strong> Email: <code>user@tapacademy.com</code> | Password: <code>tap123</code>
            </div>
        </div>
    </main>

    <!-- FOOTER -->
    <footer>
        <p>&copy; 2026 TASTE HAVEN RESTAURANT (TAP Foods Delivery Application). All Rights Reserved.</p>
    </footer>

</body>
</html>
