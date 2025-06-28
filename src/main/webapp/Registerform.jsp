<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
    
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Register New Employee</title>
    <style>
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }

        body {
            font-family: 'Arial', sans-serif;
            background-color: #eef2f5;
            padding: 60px 20px;
        }

        .form-wrapper {
            max-width: 650px;
            margin: auto;
            background: #ffffff;
            padding: 40px 30px;
            border-radius: 10px;
            box-shadow: 0px 8px 20px rgba(0, 0, 0, 0.08);
        }

        .form-wrapper h2 {
            text-align: center;
            margin-bottom: 30px;
            color: #2c3e50;
        }

        label {
            font-weight: 600;
            display: block;
            margin-bottom: 6px;
            margin-top: 20px;
            color: #333;
        }

        input[type="text"],
        input[type="email"],
        input[type="password"],
        input[type="date"],
        input[type="tel"],
        select {
            width: 100%;
            padding: 12px 14px;
            font-size: 15px;
            border: 1px solid #ccc;
            border-radius: 6px;
            transition: border 0.2s;
        }

        input:focus,
        select:focus {
            border-color: #3498db;
            outline: none;
        }

        .form-actions {
            text-align: center;
            margin-top: 30px;
        }

        .form-actions button {
            background-color: #2980b9;
            color: #fff;
            padding: 12px 30px;
            font-size: 16px;
            border: none;
            border-radius: 6px;
            cursor: pointer;
            transition: background-color 0.3s ease;
        }

        .form-actions button:hover {
            background-color: #1c6fa4;
        }
    </style>
</head>
<body>

<div class="form-wrapper">
    <h2>Register New Employee</h2>

 <form action="<c:out value='${employee.id != null ? "/admin/employees/save" : "/admin/employees/save"}' />" method="post">
    <c:if test="${employee.id != null}">
        <input type="hidden" name="id" value="${employee.id}" />
    </c:if>

    <label for="username">Username</label>
    <input type="text" name="username" placeholder="Enter full name" value="${employee.username}" required>

    <label for="email">Email</label>
    <input type="email" name="email" placeholder="example@company.com" value="${employee.email}" required>

    <label for="phone_number">Phone Number</label>
    <input type="tel" name="phone_number" placeholder="e.g. 9876543210" value="${employee.phoneNumber}" required>

    <label for="password">Password</label>
    <input type="password" name="password" placeholder="Enter password" value="${employee.password}" required>

    <label for="confirmpassword">Confirm Password</label>
    <input type="password" name="confirmpassword" placeholder="Re-enter password" value="${employee.confirmpassword}" required>

    <label for="department">Department</label>
    <input type="text" name="department" placeholder="e.g. IT, HR, Sales" value="${employee.department}" required>

    <label for="jobTitle">Job Title</label>
    <input type="text" name="jobTitle" placeholder="e.g. Software Developer" value="${employee.jobTitle}" required>

    <label for="hiredate">Hire Date</label>
    <input type="date" name="hiredate" value="${employee.hiredate}" required>



    <div class="form-actions">
        <button type="submit">Submit</button>
    </div>
</form>

</div>

</body>
</html>
