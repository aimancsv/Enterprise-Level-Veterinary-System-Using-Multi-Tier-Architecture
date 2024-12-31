<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Vets Login Page</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet">
    <style>
        /* Additional custom styles */
        .navbar {
            background-color: #007bff; /* Blue navbar */
            color: #FFFFFF; /* White text */
            padding: 10px 0;
            display: flex;
            justify-content: space-between;
            align-items: center;
        }
        .navbar-link {
            color: #FFFFFF; /* White text */
            text-decoration: none;
            margin-left: 2rem;
            margin-right: 2rem;
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif; /* Use a common font */
            font-size: 1.2rem; /* Same font size */
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
        /* Retain styles for form controls */
        .form-control {
            margin-bottom: 15px; /* Add margin-bottom to form controls */
        }
        .btn-primary {
            background-color: #007bff; /* Blue button */
            border-color: #007bff; /* Matching border color */
            color: #ffffff; /* White text */
            font-weight: bold; /* Bold text */
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif; /* Use a common font */
            font-size: 1.2rem; /* Same font size */
        }
        .btn-primary:hover {
            background-color: #0056b3; /* Darker hover color */
            border-color: #0056b3; /* Matching hover border color */
        }
        /* Ensure consistent styling for the heading */
        h1 {
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif; /* Use a common font */
            color: #000000; /* Black text */
            font-size: 2rem; /* Same font size */
        }
    </style>
</head>
<body>
    <div class="navbar">
        <a href="landing.jsp" class="navbar-link">Back</a>
        <a href="vet_Register.jsp" class="navbar-link">Sign Up</a>
    </div>
    <div class="main-content">
        <div>
            <h1>Vets Login Page</h1>
        </div>
        <!--Login Form-->
        <form action="Vet_Login" method="POST">
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
