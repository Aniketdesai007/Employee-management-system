<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="com.Project.EMS.Model.LeaveRequest" %>
<%@ page import="java.util.List" %>
<html>
<head>
    <title>Leave Requests</title>
</head>
<body>
    <h2>All Leave Requests</h2>

    <table border="1">
        <tr>
            <th>ID</th>
            <th>Employee Name</th>
            <th>Leave Type</th>
            <th>Number of Days</th>
            <th>Reason</th>
            <th>Status</th>
            <th>Actions</th>
        </tr>

        <%
            List<LeaveRequest> leaveRequests = (List<LeaveRequest>) request.getAttribute("leaveRequests");
            if (leaveRequests != null) {
                for (LeaveRequest leave : leaveRequests) {
        %>
        <tr>
            <td><%= leave.getId() %></td>
            <td><%= leave.getEmployee().getUsername() %></td>
            <td><%= leave.getLeaveType() %></td>
            <td><%= leave.getNumberOfDays() %></td>
            <td><%= leave.getReason() %></td>
            <td><%= leave.getStatus() %></td>
            <td>
                <% if ("Pending".equalsIgnoreCase(leave.getStatus())) { %>
                    <a href="${pageContext.request.contextPath}/leave/approve?id=<%= leave.getId() %>">Approve</a>
                    |
                    <a href="${pageContext.request.contextPath}/leave/reject?id=<%= leave.getId() %>">Reject</a>
                <% } %>
            </td>
        </tr>
        <%
                }
            }
        %>
    </table>

    <br/>
    <a href="${pageContext.request.contextPath}/admin/dashboard">Back to Admin Dashboard</a>
</body>
</html>
