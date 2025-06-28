<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%
    response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate");
    response.setHeader("Pragma", "no-cache");
    response.setDateHeader("Expires", 0);

    if (session.getAttribute("admin") == null) {
        response.sendRedirect("/");
    }
%>


<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Employee Directory</title>
    
    <style>
        body {
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            background: #f4f6f9;
            margin: 0;
            padding: 40px;
            position: relative;
        }

        h1 {
            text-align: center;
            color: #333;
            margin-bottom: 30px;
        }

        table {
            width: 90%;
            margin: auto;
            border-collapse: collapse;
            background-color: #fff;
            box-shadow: 0 4px 12px rgba(0, 0, 0, 0.1);
        }

        th, td {
            padding: 12px 16px;
            text-align: center;
            border-bottom: 1px solid #ddd;
        }

        th {
            background-color: #2c3e50;
            color: #fff;
            font-size: 16px;
            text-transform: uppercase;
        }

        tr:hover {
            background-color: #f1f1f1;
        }

        a {
            text-decoration: none;
            padding: 6px 12px;
            border-radius: 6px;
            color: #fff;
            font-weight: bold;
            font-size: 14px;
        }

        a.edit-btn {
            background-color: #2980b9;
        }

        a.delete-btn {
            background-color: #c0392b;
        }

        .status-on {
            color: green;
            font-weight: bold;
        }

        .status-off {
            color: red;
            font-weight: bold;
        }

        .status-pending {
            color: orange;
            font-weight: bold;
        }

        .add-btn {
            display: inline-block;
            margin: 30px auto 0;
            background-color: #27ae60;
            color: white;
            padding: 12px 24px;
            font-size: 16px;
            border-radius: 8px;
            text-align: center;
            transition: background-color 0.3s ease;
        }

        .add-btn:hover {
            background-color: #219150;
        }

        .button-container {
            text-align: center;
        }

        /* Back to Dashboard button */
        .dashboard-btn {
            position: absolute;
            top: 20px;
            right: 40px;
            background-color: #8e44ad;
            color: white;
            padding: 10px 20px;
            font-size: 14px;
            border-radius: 6px;
            font-weight: bold;
            text-decoration: none;
            transition: background-color 0.3s ease;
        }

        .dashboard-btn:hover {
            background-color: #732d91;
        }
    </style>

    <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
</head>
<body>

<!-- Back to Dashboard Button -->
<a href="/admindashboard" class="dashboard-btn" title="Go to Dashboard">🏠 Back to Dashboard</a>

<c:if test="${not empty successMessage}">
    <script>
        Swal.fire({
            icon: 'success',
            title: 'Deleted!',
            text: '${successMessage}',
            confirmButtonColor: '#3085d6'
        });
    </script>
</c:if>

<c:if test="${not empty errorMessage}">
    <script>
        Swal.fire({
            icon: 'error',
            title: 'Oops...',
            text: '${errorMessage}',
            confirmButtonColor: '#d33'
        });
    </script>
</c:if>

<h1>Employee Directory</h1>

<table>
    <thead>
        <tr>
            <th>ID</th>
            <th>Username</th>
            <th>Email</th>
            <th>Department</th>
            <th>Job Title</th>
            <th>Actions</th>
        </tr>
    </thead>
    <tbody>
        <c:forEach var="emp" items="${registerdata}">
            <tr>
                <td>${emp.id}</td>
                <td>${emp.username}</td>
                <td>${emp.email}</td>
                <td>${emp.department}</td>
                <td>${emp.jobTitle}</td>
             
                <td>
                    <a href="/admin/employees/edit/${emp.id}" class="edit-btn">Edit</a>
                    <a href="/admin/employees/delete/${emp.id}" class="delete-btn">Delete</a>
                </td>
            </tr>
        </c:forEach>
    </tbody>
</table>

<!-- Add Employee Button -->
<div class="button-container">
    <a href="/admin/employees/add" class="add-btn">➕ Add New Employee</a>
</div>

</body>
</html>
