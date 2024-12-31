<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>APU Veterinary Clinic System (AVCS)</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <style>
        /* Additional custom styles */
        body {
            background-color: #ffffff; /* White background */
            color: #000000; /* Black text */
            font-family: Arial, sans-serif; /* Use a common font */
            height: 100vh; /* Ensure full height */
            margin: 0; /* Remove default margin */
            display: flex;
            justify-content: center;
            align-items: center;
        }

        h1 {
            font-size: 36px; /* Larger font size */
            margin-bottom: 30px; /* Increase bottom margin */
        }

        .btn-primary {
            background-color: #800080; /* Darker purple for buttons */
            border-color: #800080; /* Matching border color */
            color: #ffffff; /* White text */
            font-weight: bold; /* Bold text */
            font-size: 18px; /* Larger font size */
            padding: 15px 30px; /* Increase padding */
            margin-bottom: 10px; /* Add margin between buttons */
            display: block; /* Display buttons as block elements */
        }

        .btn-primary:hover {
            background-color: #4b0082; /* Darker hover color */
            border-color: #4b0082; /* Matching hover border color */
        }

        .container {
            max-width: 400px; /* Limit container width */
        }
    </style>
</head>
<body>
    <div class="text-center">
        <h1>APU Veterinary Clinic System (AVCS)</h1>
        <div class="container">
            <a href="receptionists_Login.jsp" class="btn btn-primary btn-lg btn-block">Log In As Receptionists</a>
            <a href="staff_Login.jsp" class="btn btn-primary btn-lg btn-block">Log In As Staff</a>
            <a href="vet_Login.jsp" class="btn btn-primary btn-lg btn-block">Log In As Vet</a>
        </div>
    </div>
</body>
</html>
