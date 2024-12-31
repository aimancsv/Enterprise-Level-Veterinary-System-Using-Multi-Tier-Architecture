<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Customer Registration Page</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet">
    <style>
        /* Additional custom styles */
        body {
            background-color: #ffffff; /* White background */
            color: #000000; /* Black text */
            font-family: Arial, sans-serif; /* Use a common font */
            padding-top: 20px; /* Move content down to accommodate navbar */
        }
        .navbar {
            background-color: #663399; /* Purple navbar */
            padding: 10px 0;
        }
        .navbar-link {
            color: #ffffff; /* White text for navbar links */
            text-decoration: none;
            margin-left: 2rem;
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
    <!--Navigation bar-->
    <nav class="navbar navbar-expand-lg navbar-light bg-light">
        <div class="container">
            <a href="receptionists_Login.jsp" class="navbar-link">Back</a>
        </div>
    </nav>
    <div class="main-content">
        <form action="Receptionists_Register" method="POST">
            <div class="container">
                <div class="mb-3">
                    <label for="username" class="form-label">Username:</label>
                    <input type="text" class="form-control" id="username" name="username">
                </div>
                <div class="mb-3">
                    <label for="password" class="form-label">Password:</label>
                    <input type="password" class="form-control" id="password" name="password">
                </div>
                <div class="mb-3">
                    <label for="confirmPassword" class="form-label">Confirm Password:</label>
                    <input type="password" class="form-control" id="confirmPassword" name="confirmPassword">
                </div>
                <div class="mb-3">
                    <button type="submit" class="btn btn-primary">Register</button>
                </div>
            </div>
        </form>
    </div>
</body>
</html>
