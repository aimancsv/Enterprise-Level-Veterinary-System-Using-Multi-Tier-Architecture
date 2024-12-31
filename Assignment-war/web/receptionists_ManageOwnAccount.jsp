<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Receptionists Edit Profile Page</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet">
    <style>
        /* Additional custom styles */
        body {
            background-color: #ffffff; /* White background */
            color: #000000; /* Black text */
            font-family: Arial, sans-serif; /* Use a common font */
            padding-top: 20px; /* Move content down to accommodate navbar */
        }
        .container {
            margin-top: 50px; /* Margin top for container */
            max-width: 400px; /* Limit the width of the container */
            margin-left: auto; /* Center the container horizontally */
            margin-right: auto;
        }
        .mb-3 {
            margin-bottom: 20px; /* Add margin-bottom to form controls */
        }
        .form-label {
            font-weight: bold; /* Bold label text */
        }
        .form-control {
            margin-bottom: 15px; /* Add margin-bottom to form controls */
        }
        .btn-primary {
            background-color: #663399; /* Purple button */
            border-color: #663399; /* Matching border color */
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
    <div class="container">
        <form action="ManageOwnAccount" method="POST">
            <div class="mb-3">
                <label for="oldPassword" class="form-label">Old Password:</label>
                <input type="password" class="form-control" id="oldPassword" name="oldPassword" required>
            </div>
            <div class="mb-3">
                <label for="password" class="form-label">Password:</label>
                <input type="password" class="form-control" id="password" name="password" required>
            </div>
            <div class="mb-3">
                <label for="confirmPassword" class="form-label">Confirm Password:</label>
                <input type="password" class="form-control" id="confirmPassword" name="confirmPassword" required>
            </div>
            <button type="submit" class="btn btn-primary">Submit</button>
        </form>
    </div>
</body>
</html>
