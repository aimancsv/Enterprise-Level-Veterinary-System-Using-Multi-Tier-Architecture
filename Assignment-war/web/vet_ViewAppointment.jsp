<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Vet Appointment View</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet">
    <style>
        /* Additional custom styles */
        body {
            background-color: #f2f2f2;
        }
        .main-content {
            margin-top: 50px;
            padding: 20px;
        }
        th, td {
            padding: 10px;
            text-align: center;
        }
    </style>
</head>
<body>
    <%@ include file="/navigation_Vet.jsp" %>
    <div class="container main-content">
        <h2>Vet Appointment View Table</h2>
        <table class="table table-bordered">
            <thead class="table-light">
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
                    <c:if test="${appointment.getVet() == sessionScope.vet}">
                        <tr>
                            <td>${appointment.getId()}</td>
                            <td>${appointment.getAppointmentDate()}</td>
                            <td>${appointment.getAppointmentTime()}</td>
                            <td>${appointment.getPet().getId()}</td>
                            <td>${appointment.getVet().getId()}</td>
                        </tr>
                    </c:if>
                </c:forEach>
            </tbody>
        </table>
    </div>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
