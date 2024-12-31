<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Vet Registration Page</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet">
    <style>
        /* Additional custom styles */
        .navbar {
            background-color: #f8f9fa;
            padding: 10px 0;
        }
        .navbar-link {
            color: #007bff;
            text-decoration: none;
            margin-left: 2rem;
        }
        .container {
            margin-top: 20px;
        }
        .form-label {
            text-align: center;
        }
        .back-button {
            position: absolute;
            top: 10px;
            left: 10px;
        }
    </style>
</head>
<body>
    <nav class="navbar navbar-expand-lg navbar-light bg-light">
        <div class="container">
            <a href="vet_Login.jsp" class="navbar-link back-button">Back</a>
        </div>
    </nav>
    <div class="container d-flex justify-content-center">
        <form action="Vet_Register" method="POST">
            <div class="mb-3">
                <label for="username" class="form-label">Username:</label>
                <input type="text" class="form-control" id="username" name="username">
            </div>
            <div class="mb-3">
                <label for="email" class="form-label">Email:</label>
                <input type="email" class="form-control" id="email" name="email">
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
                <label for="expertise1" class="form-label">Expertise 1:</label>
                <select class="form-select" id="expertise1" name="expertise1">
                    <option value="Public Health">Public Health</option>
                    <option value="Animal Medicine">Animal Medicine</option>
                    <option value="Preventive Care">Preventive Care</option>
                    <option value="Surgery">Surgery</option>
                    <option value="Diagnostic Imaging">Diagnostic Imaging</option>
                    <option value="Dentistry">Dentistry</option>
                    <option value="Emergency and Critical Care">Emergency and Critical Care</option>
                    <option value="Specialized Care">Specialized Care</option>
                    <option value="Zoological Medicine">Zoological Medicine</option>
                </select>
            </div>
            <div class="mb-3">
                <label for="expertise2" class="form-label">Expertise 2:</label>
                <select class="form-select" id="expertise2" name="expertise2">
                    <option value="Public Health">Public Health</option>
                    <option value="Animal Medicine">Animal Medicine</option>
                    <option value="Preventive Care">Preventive Care</option>
                    <option value="Surgery">Surgery</option>
                    <option value="Diagnostic Imaging">Diagnostic Imaging</option>
                    <option value="Dentistry">Dentistry</option>
                    <option value="Emergency and Critical Care">Emergency and Critical Care</option>
                    <option value="Specialized Care">Specialized Care</option>
                    <option value="Zoological Medicine">Zoological Medicine</option>
                </select>
            </div>
            <button type="submit" class="btn btn-primary">Sign Up</button>
        </form>
    </div>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
