<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<html>
<head>
    <title>Manage Leave Requests</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f9f9f9;
            margin: 0;
            padding: 0;
        }

        h2 {
            text-align: center;
            margin-top: 30px;
            color: #333;
        }

        .container {
            width: 90%;
            margin: 20px auto;
            background-color: #fff;
            padding: 20px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            border-radius: 8px;
        }

        table {
            width: 100%;
            border-collapse: collapse;
            margin-top: 20px;
        }

        th, td {
            padding: 12px;
            border: 1px solid #ddd;
            text-align: center;
        }

        th {
            background-color: #f2f2f2;
            font-weight: bold;
        }

        .btn {
            padding: 8px 16px;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            text-decoration: none;
            font-size: 14px;
            transition: background-color 0.3s ease;
        }

        .btn:hover {
            opacity: 0.9;
        }

        .approve {
            background-color: #28a745;
            color: white;
        }

        .reject {
            background-color: #dc3545;
            color: white;
        }

        .back-btn {
            background-color: #007bff;
            color: white;
            margin-bottom: 20px;
            display: inline-block;
        }

        .no-action {
            color: #888;
            font-style: italic;
        }

        .action-buttons a {
            margin: 0 5px;
        }
    </style>
</head>
<body>

    <h2>Leave Requests for Approval</h2>

    <div class="container">
        <div style="text-align: right;">
            <a href="/admindashboard" class="btn back-btn">← Back to Dashboard</a>
        </div>

        <table>
            <thead>
                <tr>
                    <th>Employee Name</th>
                    <th>Leave Type</th>
                    <th>From Date</th>
                    <th>To Date</th>
                    <th>No. of Days</th>
                    <th>Reason</th>
                    <th>Status</th>
                    <th>Actions</th>
                </tr>
            </thead>
            <tbody>
                <c:forEach var="leave" items="${leaveRequests}">
                    <tr>
                        <td>${leave.employee.username}</td>
                        <td>${leave.leaveType}</td>
                        <td>${leave.fromDate}</td>
                        <td>${leave.toDate}</td>
                        <td>${leave.numberOfDays}</td>
                        <td>${leave.reason}</td>
                        <td>${leave.status}</td>
                        <td class="action-buttons">
                            <c:if test="${leave.status == 'Pending'}">
                                <a href="/leave/approve/${leave.id}" class="btn approve">Approve</a>
                                <a href="/leave/reject/${leave.id}" class="btn reject">Reject</a>
                            </c:if>
                            <c:if test="${leave.status != 'Pending'}">
                                <span class="no-action">No Action</span>
                            </c:if>
                        </td>
                    </tr>
                </c:forEach>
            </tbody>
        </table>
    </div>

</body>
</html>
