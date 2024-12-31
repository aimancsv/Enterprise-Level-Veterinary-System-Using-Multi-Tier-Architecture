<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Receptionists Create Pet Page</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet">
    <style>
        /* Additional custom styles */
        .main-content {
            margin-top: 50px;
            text-align: center;
        }
        form {
            margin-top: 20px;
            max-width: 400px; /* Limit the width of the form */
            margin-left: auto; /* Center the form horizontally */
            margin-right: auto;
        }
        .mb-3:last-child {
            margin-bottom: 20px; /* Add margin-bottom to the last mb-3 container */
        }
        .form-label {
            font-weight: bold; /* Bold label text */
        }
        .btn-primary {
            background-color: #800080; /* Purple button */
            border-color: #800080; /* Matching border color */
            color: #ffffff; /* White text */
            font-weight: bold; /* Bold text */
        }
        .btn-primary:hover {
            background-color: #4b0082; /* Darker hover color */
            border-color: #4b0082; /* Matching hover border color */
        }
    </style>
</head>
<body>
    <%@ include file="/navigation_Receptionists.jsp" %>
    
    <div class="main-content">
        <form action="CreatePet" method="POST">
            <div class="container">
                <div class="mb-3">
                    <label for="petName" class="form-label">Pet Name:</label>
                    <input type="text" class="form-control" id="petName" name="petName">
                </div>
                <div class="mb-3">
                    <label for="owner" class="form-label">Owner:</label>
                    <select class="form-select" id="owner" name="owner">
                        <c:forEach var="customer" items="${customers}">
                            <option value="${customer.id}">${customer.id}</option>
                        </c:forEach>
                    </select>
                </div>
                <div class="mb-3">
                    <button type="submit" class="btn btn-primary btn-block" style="background-color: #800080;">Register</button>
                </div>
            </div>
        </form>
    </div>
</body>
</html>
