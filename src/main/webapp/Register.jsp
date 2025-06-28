<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<html>
<head>
    <title>User Registration</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background: linear-gradient(120deg, #6dd5fa, #ffffff);
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
            width: 450px;
            text-align: center;
        }

        h2 {
            color: #333333;
            margin-bottom: 20px;
        }

        label {
            display: block;
            text-align: left;
            margin: 8px 0 4px;
            font-weight: bold;
            color: #444444;
        }

        input[type="text"],
        input[type="password"],
        input[type="email"],
        select {
            width: 100%;
            padding: 12px;
            margin-bottom: 15px;
            border: 1px solid #ccc;
            border-radius: 8px;
            box-sizing: border-box;
        }

        input[type="submit"] {
            width: 100%;
            padding: 12px;
            border: none;
            border-radius: 8px;
            background-color: #27ae60;
            color: #ffffff;
            font-size: 16px;
            cursor: pointer;
            transition: background-color 0.3s ease;
        }

        input[type="submit"]:hover {
            background-color: #1e8449;
        }

        p {
            margin-top: 15px;
            color: #333333;
        }

        a {
            color: #2980b9;
            text-decoration: none;
        }

        a:hover {
            text-decoration: underline;
        }

        .message {
            margin-top: 10px;
            font-weight: bold;
        }

        .error {
            color: red;
        }

        .success {
            color: green;
        }

        .popup {
            position: fixed;
            top: 20px;
            left: 50%;
            transform: translateX(-50%);
            background-color: #f44336;
            color: white;
            padding: 12px 24px;
            border-radius: 8px;
            box-shadow: 0 2px 10px rgba(0,0,0,0.3);
            z-index: 9999;
            font-size: 16px;
        }
    </style>

    <script>
        window.onload = function () {
            const urlParams = new URLSearchParams(window.location.search);
            if (urlParams.get('error') === 'password') {
                const popup = document.createElement('div');
                popup.className = 'popup';
                popup.textContent = 'Password and Confirm Password do not match!';
                document.body.appendChild(popup);
                setTimeout(() => {
                    popup.remove();
                }, 3000);
            }
        };
    </script>
</head>
<body>

<div class="container">
    <h2>User Registration</h2>

    <form action="/registeruser" method="post">
        <label>Username:</label>
        <input type="text" name="username" required/>

        <label>Password:</label>
        <input type="password" name="password" required/>

        <label>Confirm Password:</label>
        <input type="password" name="confirmpassword" required/>

        <label>Email:</label>
        <input type="email" name="email" required/>

        <label>Role:</label>
        <select name="role">
            <option value="ADMIN">Admin</option>
            <option value="HR">HR</option>
            <option value="EMPLOYEE">Employee</option>
        </select>

        <input type="submit" value="Register"/>
    </form>

    <c:if test="${not empty error}">
        <p class="message error">${error}</p>
    </c:if>

    <c:if test="${not empty success}">
        <p class="message success">${success}</p>
    </c:if>

    <p>Already have an account? <a href="/">Login here</a></p>
</div>

</body>
</html>
