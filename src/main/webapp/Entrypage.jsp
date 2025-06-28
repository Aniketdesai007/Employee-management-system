<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Login Page</title>
<style>
    body {
        font-family: Arial, sans-serif;
        background: linear-gradient(120deg, #2980b9, #6dd5fa, #ffffff);
        height: 100vh;
        margin: 0;
        display: flex;
        justify-content: center;
        align-items: center;
    }

    .container {
        background-color: #ffffff;
        padding: 30px 40px;
        border-radius: 12px;
        box-shadow: 0 8px 16px rgba(0, 0, 0, 0.25);
        text-align: center;
        width: 400px;
    }

    h1 {
        margin-bottom: 20px;
        color: #333333;
    }

    input[type="email"],
    input[type="password"] {
        width: 100%;
        padding: 12px;
        margin: 8px 0 20px 0;
        border: 1px solid #ccc;
        border-radius: 8px;
        box-sizing: border-box;
    }

    button {
        width: 100%;
        padding: 12px;
        border: none;
        border-radius: 8px;
        background-color: #2980b9;
        color: #ffffff;
        font-size: 16px;
        cursor: pointer;
        transition: background-color 0.3s ease;
    }

    button:hover {
        background-color: #1c5980;
    }

    .register-btn {
        margin-top: 10px;
        background-color: #27ae60;
    }

    .register-btn:hover {
        background-color: #1e8449;
    }
</style>
</head>
<body>

<div class="container">
<c:if test="${not empty error}">
    <script>
        alert("${error}");
    </script>
</c:if>
    <h1>Welcome</h1>

    <form action="/login" method="post">
        <input type="email" placeholder="Enter Email" name="email" required>
        <input type="password" placeholder="Enter Password" name="password" required>
        <button type="submit">Login</button>
    </form>

    <form action="/register" method="post">
        <button type="submit" class="register-btn">Register</button>
    </form>
</div>

</body>
</html>
