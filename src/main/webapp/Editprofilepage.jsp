<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Edit Profile</title>
    <style>
        body {
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            background-color: #f4f6f8;
            display: flex;
            justify-content: center;
            align-items: center;
            min-height: 100vh;
            margin: 0;
        }

        .container {
            background-color: #ffffff;
            padding: 40px 30px;
            border-radius: 10px;
            box-shadow: 0 8px 16px rgba(0, 0, 0, 0.1);
            width: 100%;
            max-width: 600px;
        }

        h2 {
            text-align: center;
            color: #2c3e50;
            margin-bottom: 30px;
        }

        form {
            display: flex;
            flex-direction: column;
        }

        label {
            font-weight: bold;
            margin-bottom: 5px;
            color: #34495e;
        }

        input[type="text"],
        input[type="email"],
        input[type="date"],
        input[type="submit"] {
            padding: 10px;
            margin-bottom: 20px;
            border: 1px solid #ccd1d9;
            border-radius: 5px;
            font-size: 15px;
        }

        input[type="submit"] {
            background-color: #3498db;
            color: white;
            border: none;
            cursor: pointer;
            transition: background-color 0.3s ease;
        }

        input[type="submit"]:hover {
            background-color: #2980b9;
        }
    </style>
</head>
<body>

<c:set var="data" value="${editdata}" />

<div class="container">
    <h2>Edit Profile</h2>

    <script>
        alert("Welcome ${data.username}");
    </script>

    <form method="post" action="/update/${data.id}">
        <input type="hidden" name="password" value="${data.password}" />

        <label for="email">Email:</label>
        <input type="email" name="email" id="email" value="${data.email}" readonly />

        <label for="phoneNumber">Phone Number:</label>
        <input type="text" name="phoneNumber" id="phoneNumber" value="${data.phoneNumber}" required />

        <label for="department">Department:</label>
        <input type="text" name="department" id="department" value="${data.department}" required />

        <label for="jobTitle">Job Title:</label>
        <input type="text" name="jobTitle" id="jobTitle" value="${data.jobTitle}" required />

        <label for="hiredate">Hire Date:</label>
        <input type="date" name="hiredate" id="hiredate" value="${data.hiredate}" required />

        <label for="address">Address:</label>
        <input type="text" name="address" id="address" value="${data.address}" required />

        <input type="submit" value="Update">
    </form>
</div>

</body>
</html>
