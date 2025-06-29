<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <title>Employee Management System</title>
    <!-- Bootstrap 5 CDN -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <style>
        .hero {
            background: #f8f9fa;
            padding: 60px 0;
            text-align: center;
        }
        .feature-icon {
            font-size: 40px;
            color: #0d6efd;
        }
        footer {
            background-color: #f1f1f1;
            padding: 20px 0;
            text-align: center;
            margin-top: 40px;
        }
    </style>
</head>
<body>

<!-- NAVBAR -->
<nav class="navbar navbar-expand-lg navbar-light bg-light shadow-sm">
    <div class="container">
        <a class="navbar-brand" href="#">EMS Portal</a>
        <button class="navbar-toggler" type="button" data-bs-toggle="collapse"
                data-bs-target="#navbarNav" aria-controls="navbarNav"
                aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse justify-content-end" id="navbarNav">
            <ul class="navbar-nav me-3">
                <li class="nav-item"><a class="nav-link" href="#features">Features</a></li>
                <li class="nav-item"><a class="nav-link" href="#about">About</a></li>
                <li class="nav-item"><a class="nav-link" href="#contact">Contact</a></li>
            </ul>
            <a href="/login/entrypage" class="btn btn-outline-primary me-2">Login</a>
            
            <a href="/register" class="btn btn-primary">Register</a>
        </div>
    </div>
</nav>

<!-- HERO SECTION -->
<section class="hero">
    <div class="container">
        <h1 class="display-5 fw-bold">Welcome to the Employee Management System</h1>
        <p class="lead">Manage employee records, leave requests, and more from one central place.</p>
        <a href="/login/entrypage" class="btn btn-lg btn-primary">Get Started</a>
    </div>
</section>

<!-- FEATURES SECTION -->
<section id="features" class="py-5">
    <div class="container">
        <h2 class="text-center mb-4">System Features</h2>
        <div class="row text-center">
            <div class="col-md-3">
                <div class="feature-icon mb-2">📋</div>
                <h5>Leave Management</h5>
                <p>Apply, approve, and track employee leaves easily.</p>
            </div>
            <div class="col-md-3">
                <div class="feature-icon mb-2">🔐</div>
                <h5>Role-Based Access</h5>
                <p>Separate access for Admin, HR, and Employees.</p>
            </div>
            <div class="col-md-3">
                <div class="feature-icon mb-2">📊</div>
                <h5>Reports & Analytics</h5>
                <p>Track attendance and leave history in detail.</p>
            </div>
            <div class="col-md-3">
                <div class="feature-icon mb-2">⚙️</div>
                <h5>System Settings</h5>
                <p>Manage departments, users, and system configuration.</p>
            </div>
        </div>
    </div>
</section>

<!-- ABOUT/CONTACT PLACEHOLDER -->
<section id="about" class="py-5 bg-light text-center">
    <div class="container">
        <h3>About EMS</h3>
        <p>This platform is designed to simplify employee management for organizations of any size.</p>
    </div>
</section>

<section id="contact" class="py-4 text-center">
    <div class="container">
        <h3>Contact</h3>
        <p>Email: support@ems.com | Phone: +91-1234567890</p>
    </div>
</section>

<!-- FOOTER -->
<footer>
    <div class="container">
        <p>&copy; 2025 EMS Portal. All rights reserved.</p>
    </div>
</footer>

<!-- Bootstrap JS -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>

</body>
</html>
