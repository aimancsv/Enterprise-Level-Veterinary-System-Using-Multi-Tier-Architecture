<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Receptionists Create Customer Page</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet">
    <style>
        /* Additional custom styles */
        body {
            background-color: #ffffff; /* White background */
            color: #000000; /* Black text */
            font-family: Arial, sans-serif; /* Use a common font */
            padding-top: 20px; /* Move content down to accommodate navbar */
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
        .btn-primary {
            background-color: #800080; /* Purple button */
            border-color: #800080; /* Matching border color */
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
    <div class="main-content">
        <form action="CreateCustomer" method="POST">
            <div class="container">
                <div class="mb-3">
                    <label for="username" class="form-label">Username:</label>
                    <input type="text" class="form-control" id="username" name="username">
                </div>
                <div class="mb-3">
                    <label for="contact" class="form-label">Contact Number:</label>
                    <input type="text" class="form-control" id="contact" name="contact">
                </div>
                <div class="mb-3">
                    <label for="gender" class="form-label">Gender:</label>
                    <select class="form-select" id="gender" name="gender">
                        <option value="Male">Male</option>
                        <option value="Female">Female</option>
                    </select>
                </div>
                <div class="mb-3">
                    <button type="submit" class="btn btn-primary btn-block" style="background-color: #800080;">Register</button>
                </div>
            </div>
        </form>
    </div>
</body>
</html>
