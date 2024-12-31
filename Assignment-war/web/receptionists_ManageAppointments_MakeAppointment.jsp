<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Receptionists Make Appointments</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet">
    <style>
        /* Additional custom styles */
        body {
            background-color: #ffffff; /* White background */
            color: #000000; /* Black text */
            font-family: Arial, sans-serif; /* Use a common font */
            padding-top: 20px; /* Move content down to accommodate navbar */
        }
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
        .form-label {
            font-weight: bold; /* Bold label text */
        }
        .form-control {
            margin-bottom: 15px; /* Add margin-bottom to form controls */
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
    <%@ include file="/navigation_Receptionists_Appointment.jsp" %>
    
    <h2 class="text-center">Make Appointment</h2>
    <div class="main-content">
        <form action="CreateAppointment" method="POST">
            <div class="container">
                <div class="mb-3">
                    <label for="appointmentDate" class="form-label">Date:</label>
                    <input type="date" class="form-control" id="appointmentDate" name="appointmentDate" required>
                </div>
                <div class="mb-3">
                    <label for="appointmentTime" class="form-label">Time:</label>
                    <input type="time" class="form-control" id="appointmentTime" name="appointmentTime" required>
                </div>
                <div class="mb-3">
                    <label for="petName" class="form-label">Pet Name:</label>
                    <select class="form-select" id="petName" name="petName">
                        <c:forEach var="pet" items="${pets}">
                            <option value="${pet.id}">${pet.id}</option>
                        </c:forEach>
                    </select>
                </div>
                <div class="mb-3">
                    <label for="vetName" class="form-label">Vet:</label>
                    <select class="form-select" id="vetName" name="vetName">
                        <c:forEach var="vet" items="${vets}">
                            <option value="${vet.id}">${vet.id}</option>
                        </c:forEach>
                    </select>
                </div>
                <div class="mb-3">
                    <button type="submit" class="btn btn-primary btn-block" style="background-color: #800080;">Confirm</button>
                </div>
            </div>
        </form>
    </div>
</body>
</html>
