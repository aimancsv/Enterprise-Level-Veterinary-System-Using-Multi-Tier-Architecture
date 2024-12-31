<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Receptionists Home Page</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet">
    <style>
        /* Additional custom styles */
        body {
            background-color: #ffffff; /* White background */
            color: #000000; /* Black text */
            font-family: Arial, sans-serif; /* Use a common font */
            padding-top: 20px; /* Move content down to accommodate navbar */
            font-weight: bold; /* Make the font bolder */
        }
        .navbar {
            background-color: #007bff; /* Blue navbar */
            padding: 10px 0;
            margin-bottom: 20px; /* Added margin-bottom to move the navbar down */
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
    <div class="navbar">
        <div class="container-fluid d-flex justify-content-between">
            <div>
                <a href="vet_ViewAppointment" class="navbar-link">View Appointments</a>
                <a href="vet_Diagnosis_Appointment" class="navbar-link">Make Diagnosis</a>
                <a href="vet_ManageOwnAccount.jsp" class="navbar-link">Edit Profile</a>
                <a href="vet_ViewDiagnosisHistory" class="navbar-link">View Diagnosis History</a>
            </div>
            <div>
                <a href="LogOut" class="navbar-link">Log Out</a>
            </div>
        </div>
    </div>

    <!-- Your page content here -->
</body>
</html>
