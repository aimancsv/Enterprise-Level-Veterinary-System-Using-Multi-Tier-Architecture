<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Receptionists Manage Appointments: Edit Appointment</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet">
    <style>
        /* Additional custom styles */
        .container {
            margin-top: 50px;
        }
    </style>
</head>
<body>
    <%@ include file="/navigation_Receptionists.jsp" %>
    <%@ include file="/navigation_Receptionists_Appointment.jsp" %>
    <div class="container">
        <table class="table">
            <thead>
                <tr>
                    <th>ID</th>
                    <th>Appointment Date</th>
                    <th>Appointment Time</th>
                    <th>Pet</th>
                    <th>Vet</th>
                </tr>
            </thead>
            <tbody>
                <c:forEach var="appointment" items="${appointments}">
                    <tr>
                        <td>${appointment.id}</td>
                        <td>${appointment.appointmentDate}</td>
                        <td>${appointment.appointmentTime}</td>
                        <td>${appointment.pet.getId()}</td>
                        <td>${appointment.vet.getId()}</td>
                    </tr>
                </c:forEach>
            </tbody>
        </table>
        <form action="EditAndCancelAppointments" method="post">
            <div class="mb-3">
                <label for="appointmentId" class="form-label">Appointment ID:</label>
                <select class="form-select" id="appointmentId" name="appointmentId">
                    <c:forEach var="appointment" items="${appointments}">
                        <option value="${appointment.id}">${appointment.id}</option>
                    </c:forEach>
                </select>
            </div>
            <div class="mb-3">
                <label for="appointmentDate" class="form-label">Date:</label>
                <input type="date" class="form-control" id="appointmentDate" name="appointmentDate">
            </div>
            <div class="mb-3">
                <label for="appointmentTime" class="form-label">Time:</label>
                <input type="time" class="form-control" id="appointmentTime" name="appointmentTime">
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
            <button type="submit" class="btn btn-primary me-2" name="action" value="edit" style="background-color: #800080;">Edit Appointment</button>
            <button type="submit" class="btn btn-danger" name="action" value="cancel">Cancel Appointment</button>
        </form>
    </div>
</body>
</html>
