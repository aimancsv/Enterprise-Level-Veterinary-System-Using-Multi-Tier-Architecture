<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Create Working Rotation</title>
</head>
<body>
    <%@ include file="/navigation_Staff.jsp" %>
    <div class="container mt-4">
        <form id="rotationForm" action="EditWorkingRotation" method="POST">
            <table class="table">
                <thead>
                    <tr>
                        <th>Vet Name</th>
                        <th>Monday</th>
                        <th>Tuesday</th>
                        <th>Wednesday</th>
                        <th>Thursday</th>
                        <th>Friday</th>
                        <th>Saturday</th>
                        <th>Sunday</th>
                    </tr>
                </thead>
                <tbody>
                    <c:forEach var="vet" items="${vets}">
                        <tr>
                            <td>${vet.id}</td>
                            <c:forEach var="day" items="${['Monday', 'Tuesday', 'Wednesday', 'Thursday', 'Friday', 'Saturday', 'Sunday']}">
                                <td><input type="checkbox" name="${vet.id}_${day}" class="form-check-input"></td>
                            </c:forEach>
                        </tr>
                    </c:forEach>
                </tbody>
            </table>
            <button type="submit" id="saveButton" class="btn btn-orange" disabled>Save</button>
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
    <script>
        $(document).ready(function() {
            $('input[type="checkbox"]').change(function() {
                if ($('input[type="checkbox"]:checked').length > 0) {
                    $('#saveButton').prop('disabled', false);
                } else {
                    $('#saveButton').prop('disabled', true);
                }
            });
        });
    </script>
</body>
</html>
