<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Manage Receptionists</title>
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
                <c:forEach var="reception" items="${receptionists}">
                    <tr>
                        <td>${reception.id}</td>
                        <td>${reception.password}</td>
                    </tr>
                </c:forEach>
            </tbody>
        </table>
        <form action="EditAndCancelReceptions" method="post">
            <div class="form-group">
                <label for="receptionId">Reception ID:</label>
                <select id="receptionId" name="receptionsId" class="form-control">
                    <c:forEach var="reception" items="${receptionists}">
                        <option value="${reception.id}">${reception.id}</option>
                    </c:forEach>
                </select>
            </div>
            <div class="form-group">
                <label for="password">Password:</label>
                <input type="password" id="password" name="password" class="form-control" size="20">
            </div>
            <div class="form-group">
                <label for="confirmPassword">Confirm Password:</label>
                <input type="password" id="confirmPassword" name="confirmPassword" class="form-control" size="20">
            </div>
            <button type="submit" class="btn btn-orange" name="action" value="confirm">Confirm</button>
            <button type="submit" class="btn btn-danger" name="action" value="delete">Delete</button>
        </form>
    </div>
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
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
</html>
