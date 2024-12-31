<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Vet Management</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>
    <%@ include file="/navigation_Staff.jsp" %> 
    <%@ include file="/navigation_Staff_Employees.jsp" %> 
    <div class="container mt-5">
        <div class="row">
            <div class="col">
                <table class="table table-bordered">
                    <thead>
                        <tr>
                            <th>ID</th>
                            <th>Password</th>
                        </tr>
                    </thead>
                    <tbody>
                        <c:forEach var="vet" items="${vets}">
                            <tr>
                                <td>${vet.id}</td>
                                <td>${vet.password}</td>
                            </tr>
                        </c:forEach>
                    </tbody>
                </table>
            </div>
        </div>
        <div class="row">
            <div class="col">
                <form action="EditAndCancelVet" method="post">
                    <div class="mb-3">
                        <label for="vetId" class="form-label">Vet ID:</label>
                        <select name="vetId" id="vetId" class="form-select">
                            <c:forEach var="vet" items="${vets}">
                                <option value="${vet.id}">${vet.id}</option>
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
                    <button type="submit" name="action" value="confirm" class="btn btn-orange">Confirm</button>
                    <button type="submit" name="action" value="delete" class="btn btn-danger">Delete</button>
                </form>
            </div>
        </div>
    </div>
    
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js"></script>
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
