<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<html>
<head>
    <title>Employee Dashboard</title>
    <style>
        body {
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            background-color: #f5f7fa;
            margin: 0;
            padding: 0;
            display: flex;
            flex-direction: column;
            min-height: 100vh;
            align-items: center;
        }

        .header {
            width: 100%;
            background-color: #34495e;
            color: #ecf0f1;
            padding: 20px 0;
            text-align: center;
            font-size: 28px;
        }

        .container {
            background-color: #ffffff;
            border-radius: 8px;
            padding: 30px 50px;
            box-shadow: 0 4px 10px rgba(0,0,0,0.1);
            margin-top: 40px;
            margin-bottom: 40px;
            width: 100%;
            max-width: 700px;
            display: flex;
            flex-direction: column;
            align-items: center;
        }

        h2 {
            margin-bottom: 20px;
            color: #2c3e50;
            text-align: center;
        }

        .profile-info {
            width: 100%;
        }

        .profile-info div {
            display: flex;
            justify-content: space-between;
            margin-bottom: 15px;
            padding: 8px 0;
            border-bottom: 1px solid #ecf0f1;
        }

        .profile-info label {
            font-weight: bold;
            color: #555;
        }

        .profile-info span {
            color: #333;
        }

        .button-group {
            margin-top: 30px;
            display: flex;
            flex-wrap: wrap;
            justify-content: center;
            gap: 15px;
        }

        .button-group a {
            padding: 12px 24px;
            text-decoration: none;
            color: #fff;
            background-color: #3498db;
            border-radius: 6px;
            transition: background-color 0.3s ease;
            min-width: 180px;
            text-align: center;
        }

        .button-group a:hover {
            background-color: #2980b9;
        }
    </style>
</head>
<body>

<div class="header">
    Employee Dashboard
</div>

<div class="container">
    <h2>Welcome, ${user_data.username}!</h2>

    <div class="profile-info">
        <div>
            <label>Email:</label>
            <span>
                <c:choose>
                    <c:when test="${empty user_data.email}">Not provided</c:when>
                    <c:otherwise>${user_data.email}</c:otherwise>
                </c:choose>
            </span>
        </div>

        <div>
            <label>Phone Number:</label>
            <span>
                <c:choose>
                    <c:when test="${empty user_data.phoneNumber}">Not provided</c:when>
                    <c:otherwise>${user_data.phoneNumber}</c:otherwise>
                </c:choose>
            </span>
        </div>

        <div>
            <label>Department:</label>
            <span>
                <c:choose>
                    <c:when test="${empty user_data.department}">Not provided</c:when>
                    <c:otherwise>${user_data.department}</c:otherwise>
                </c:choose>
            </span>
        </div>

        <div>
            <label>Job Title:</label>
            <span>
                <c:choose>
                    <c:when test="${empty user_data.jobTitle}">Not provided</c:when>
                    <c:otherwise>${user_data.jobTitle}</c:otherwise>
                </c:choose>
            </span>
        </div>

        <div>
            <label>Hire Date:</label>
            <span>
                <c:choose>
                    <c:when test="${empty user_data.hiredate}">Not provided</c:when>
                    <c:otherwise>${user_data.hiredate}</c:otherwise>
                </c:choose>
            </span>
        </div>

        <div>
            <label>Address:</label>
            <span>
                <c:choose>
                    <c:when test="${empty user_data.address}">Not provided</c:when>
                    <c:otherwise>${user_data.address}</c:otherwise>
                </c:choose>
            </span>
        </div>
    </div>

    <div class="button-group">
        <a href="/${user_data.id}">Edit Profile</a>
        <a href="/apply-leave">Apply for Leave</a>
        <a href="/logout">Logout</a>
    </div>

</div>

</body>
</html>
