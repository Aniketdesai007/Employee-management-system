<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <title>Admin/HR Dashboard</title>

    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">

    <!-- Google Fonts -->
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@400;600&display=swap" rel="stylesheet">

    <style>
        body {
            margin: 0;
            padding: 0;
            background: linear-gradient(to right, #fceabb, #f8b500);
            font-family: 'Poppins', sans-serif;
            min-height: 100vh;
            display: flex;
            align-items: center;
            justify-content: center;
        }

        .dashboard-container {
            width: 100%;
            max-width: 900px;
            padding: 40px;
            background: rgba(255, 255, 255, 0.85);
            border-radius: 20px;
            box-shadow: 0 20px 40px rgba(0, 0, 0, 0.15);
            text-align: center;
            transition: transform 0.3s ease, box-shadow 0.3s ease;
        }

        .dashboard-container:hover {
            transform: translateY(-5px);
            box-shadow: 0 30px 60px rgba(0, 0, 0, 0.2);
        }

        h2 {
            font-weight: 600;
            margin-bottom: 10px;
            color: #2c3e50;
        }

        p {
            font-size: 1.1rem;
            color: #444;
            margin-bottom: 30px;
        }

        .btn-glow {
            display: inline-block;
            margin: 10px;
            padding: 12px 30px;
            font-size: 16px;
            font-weight: 600;
            color: #fff;
            background: linear-gradient(45deg, #00c6ff, #0072ff);
            border: none;
            border-radius: 50px;
            transition: all 0.3s ease;
            text-decoration: none;
            box-shadow: 0 0 10px rgba(0, 114, 255, 0.4);
        }

        .btn-glow:hover {
            background: linear-gradient(45deg, #0072ff, #00c6ff);
            box-shadow: 0 0 20px rgba(0, 114, 255, 0.9);
            transform: translateY(-3px);
        }

        .btn-logout {
            background: linear-gradient(45deg, #ff4e50, #f9d423);
            box-shadow: 0 0 10px rgba(255, 78, 80, 0.4);
        }

        .btn-logout:hover {
            background: linear-gradient(45deg, #f9d423, #ff4e50);
            box-shadow: 0 0 20px rgba(255, 78, 80, 0.9);
        }
    </style>
</head>

<body>

<div class="dashboard-container">
    <h2>Welcome, <strong>Admin</strong> 👋</h2>
    <p>Manage employee records, review leave requests, and access tools via your professional control panel.</p>

    <!-- View Employees -->
    <a href="/adminhr" class="btn-glow">View Employee Details</a>

    <!-- Leave Requests Button -->
    <a href="/admin/manage-leaves" class="btn-glow">Manage Leave Requests</a>

    <!-- Logout Button -->
    <a href="/admin/logout" class="btn-glow btn-logout">Logout</a>
</div>

</body>
</html>
