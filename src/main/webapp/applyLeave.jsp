<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <title>Apply for Leave</title>
    <style>
        body {
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            background-color: #f4f7f9;
            margin: 0;
            padding: 0;
            display: flex;
            justify-content: center;
            align-items: center;
            min-height: 100vh;
        }

        .container {
            background-color: #fff;
            padding: 40px 30px;
            border-radius: 10px;
            box-shadow: 0 8px 20px rgba(0, 0, 0, 0.1);
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
            color: #34495e;
            margin-bottom: 5px;
        }

        select,
        input[type="number"],
        input[type="date"],
        textarea {
            padding: 10px;
            margin-bottom: 20px;
            border: 1px solid #ccd1d9;
            border-radius: 5px;
            font-size: 16px;
            width: 100%;
            box-sizing: border-box;
            background-color: #fdfdfd;
        }

        input[type="submit"] {
            padding: 12px;
            background-color: #3498db;
            color: white;
            font-size: 16px;
            border: none;
            border-radius: 6px;
            cursor: pointer;
            transition: background-color 0.3s ease;
        }

        input[type="submit"]:hover {
            background-color: #2980b9;
        }

        .back-link {
            display: block;
            margin-top: 20px;
            text-align: center;
            text-decoration: none;
            color: #2980b9;
            font-weight: bold;
            transition: color 0.3s ease;
        }

        .back-link:hover {
            color: #1c5980;
        }
    </style>
</head>
<body>

<div class="container">
    <h2>Apply for Leave</h2>

    <form action="/leave/apply/${user_data.id}" method="post">
        <input type="hidden" name="employeeId" value="${user_data.id}" />

        <label for="leaveType">Leave Type:</label>
        <select name="leaveType" id="leaveType" required>
            <option value="Sick Leave">Sick Leave</option>
            <option value="Casual Leave">Casual Leave</option>
            <option value="Earned Leave">Earned Leave</option>
        </select>

        <label for="fromDate">Start Date:</label>
        <input type="date" name="fromDate"  required />

        <label for="toDate">End Date:</label>
        <input type="date" name="toDate" required />

        <label for="numberOfDays">Number of Days:</label>
        <input type="number" name="numberOfDays" id="numberOfDays" min="1" required/>

        <label for="reason">Reason:</label>
        <textarea name="reason" id="reason" rows="4" required></textarea>

        <input type="submit" value="Submit Leave Request"/>
    </form>

    <a class="back-link" href="/leave/dashboard/${user_data.id}">← Back to Dashboard</a>
</div>

</body>
</html>
