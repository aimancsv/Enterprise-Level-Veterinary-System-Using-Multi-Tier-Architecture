<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <%@ include file="/navigation_Vet.jsp" %>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Diagnosis History</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet">
    <!-- Your custom styles -->
</head>
<body>
    <div class="container mt-5">
        <h1>Diagnosis History</h1>
        <div class="row">
            <div class="col">
                <form name="vet_ViewDiagnosisHistory" method="post">
                    <div class="mb-3">
                        <label for="appointmentID" class="form-label">Appointment ID</label>
                        <select name= "appointmentID" class="form-select" id="appointmentID">
                            <c:forEach var="diagnosis" items="${diagnosisList}">
                                <option value="${diagnosis.getAppointmentId()}">
                                    ${diagnosis.getAppointmentId()}
                                </option>
                            </c:forEach>
                        </select>
                    </div>
                    <div class="mb-3">
                        <label for="diagnosis" class="form-label">Diagnosis</label>
                        <textarea class="form-control" id="diagnosis" rows="4">
                                ${diagnosis}
                        </textarea>
                    </div>
                    <button type="submit" class="btn btn-primary">Submit</button>
                </form>
            </div>
        </div>
    </div>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
