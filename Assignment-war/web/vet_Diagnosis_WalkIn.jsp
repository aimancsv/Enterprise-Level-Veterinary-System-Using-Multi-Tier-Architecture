<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Vet Diagnosis Walk-In</title>
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
        form {
            max-width: 400px; /* Limit the width of the form */
            margin-left: auto; /* Center the form horizontally */
            margin-right: auto;
        }
        label {
            font-weight: bold;
        }
    </style>
</head>
<body>    
    <%@ include file="/navigation_Vet.jsp" %>
    <%@ include file="/navigation_Vet_Diagnosis.jsp" %>
    <div class="container main-content">
        <h2>Vet Diagnosis Walk-In</h2>
        <form action="CreateDiagnosis" method="post">
            <div class="mb-3">
                <label for="petId" class="form-label">Pet:</label>
                <select name="petId" class="form-select">
                    <c:forEach var="pet" items="${pets}">
                        <option value="${pet.id}">${pet.id}</option>
                    </c:forEach>
                </select>
            </div>
            <div class="mb-3">
                <label for="diagnosis" class="form-label">Diagnosis:</label>
                <textarea name="diagnosis" rows="6" cols="30" class="form-control" required></textarea>
            </div>
            <input type="hidden" name="appointmentId" value="Walk In" />
            <button type="submit" name="action" value="confirm" class="btn btn-primary">Confirm</button>
        </form>
    </div>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
