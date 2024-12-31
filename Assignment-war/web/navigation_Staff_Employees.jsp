<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Managing Staff Navigation</title>
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
            background-color: #ffa500; /* Orange navbar */
        }
        .navbar-link {
            color: #ffffff; /* White text */
            text-decoration: none;
            margin-left: 1rem;
            margin-right: 1rem;
            font-weight: bold; /* Make the font bolder */
        }
    </style>
</head>
<body>
    <nav class="navbar">
        <div class="container-fluid">
            <div class="d-flex">
                <a href="staff_ManageStaff" class="navbar-link">Manage Staff</a>
                <a href="staff_ManageVets" class="navbar-link">Manage Vets</a>
                <a href="staff_ManageReceptionists" class="navbar-link">Manage Receptionist</a>
            </div>
        </div>
    </nav>
</body>
</html>
