<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Manage Staff</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-KyZXEAg3QhqLMpG8r+Knujsl5+z5vIOIjOG05eVZcROlE/D0pOjKGge/jXusUPnT" crossorigin="anonymous">
</head>
<body>
    <%@ include file="/navigation_Staff.jsp" %> 
    <%@ include file="/navigation_Staff_Employees.jsp" %> 
    <div class="container mt-4">
        <table class="table table-bordered">
            <thead>
                <tr>
                    <th>ID</th>
                    <th>Password</th>
                </tr>
            </thead>
            <tbody>
                <c:forEach var="staff" items="${staffs}">
                    <tr>
                        <td>${staff.id}</td>
                        <td>${staff.password}</td>
                    </tr>
                </c:forEach>
            </tbody>
        </table>
        <form action="EditAndCancelStaff" method="post">
            <div class="mb-3">
                <label for="staffId" class="form-label">Staff ID:</label>
                <select id="staffId" name="staffId" class="form-select">
                    <c:forEach var="staff" items="${staffs}">
                        <option value="${staff.id}">${staff.id}</option>
                    </c:forEach>
                </select>
            </div>
            <div class="mb-3">
                <label for="password" class="form-label">Password:</label>
                <input type="password" id="password" name="password" class="form-control" size="20">
            </div>
            <div class="mb-3">
                <label for="confirmPassword" class="form-label">Confirm Password:</label>
                <input type="password" id="confirmPassword" name="confirmPassword" class="form-control" size="20">
            </div>
            <button type="submit" class="btn btn-orange" name="action" value="confirm">Confirm</button>
            <button type="submit" class="btn btn-danger" name="action" value="delete">Delete</button>
        </form>
    </div>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js" integrity="sha384-TxQF60KT8a06wLYF4dUfIPbbG2y7xRqiyr8q+0myUuv7wkfaQ4xJsjSNFo1Y0u8Q" crossorigin="anonymous"></script>
    <style>
        /* Define orange color */
        .btn-orange {
            background-color: #ffa500;
            border-color: #ffa500;
            color: #ffffff;
            font-weight: bold;
        }

        /* Hover color */
        .btn-orange:hover {
            background-color: #ff8c00;
            border-color: #ff8c00;
        }
    </style>
</body>
</html>
