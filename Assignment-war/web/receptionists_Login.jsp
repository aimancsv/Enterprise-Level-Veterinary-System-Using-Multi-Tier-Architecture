<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Receptionists Login Page</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet">
    <style>
        /* Additional custom styles */
        body {
            background-color: #ffffff; /* White background */
            color: #000000; /* Black text */
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif; /* Use a common font */
            padding-top: 20px; /* Move content down to accommodate navbar */
            padding-bottom: 20px;
        }
        .navbar {
            background-color: #663399; /* Purple navbar */
            padding: 10px 0;
            margin-bottom: 20px;
        }
        .navbar-link {
            color: #ffffff; /* White text */
            text-decoration: none;
            margin-left: 1.5rem;
            margin-right: 1.5rem;
            font-size: 1.2rem;
        }
        .main-content {
            text-align: center;
        }
        form {
            margin-top: 20px;
            max-width: 400px; /* Limit the width of the form */
            margin-left: auto; /* Center the form horizontally */
            margin-right: auto;
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
    <div class="navbar">
        <a href="landing.jsp" class="navbar-link">Back</a>
        <a href="receptionists_Register.jsp" class="navbar-link">Sign Up</a>
    </div>
    <div class="main-content">
        <div>
            <h1>Receptionists Login Page</h1>
        </div>
        <!--Login Form-->
        <form action="Receptionists_Login" method="POST">
            <div class="form-group">
                <label for="username">Username:</label>
                <input type="text" class="form-control" id="username" name="username">
            </div>
            <div class="form-group">
                <label for="password">Password:</label>
                <input type="password" class="form-control" id="password" name="password">
            </div>
            <button type="submit" class="btn btn-primary btn-block">Login</button>
        </form>
    </div>
</body>
</html>