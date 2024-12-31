<%@page import="model.Staff"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Search by ID</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet">
    <style>
        .error-container {
            background-color: #f8d7da;
            border: 1px solid #f5c6cb;
            padding: 20px;
            border-radius: 5px;
            color: #721c24;
        }
    </style>
</head>
<body>
    <%@ include file="/navigation_Staff.jsp" %>
    <div class="container mt-5">
        <h1 class="text-center">Search by ID</h1>
        <form action="AdminSearch" method="GET" class="mt-4">
            <div class="row justify-content-center">
                <div class="col-md-6">
                    <div class="input-group mb-3">
                        <input type="id" class="form-control" placeholder="Enter ID" name="id">
                        <button class="btn btn-primary" type="submit">Search</button>
                    </div>
                </div>
            </div>
        </form>
        <div class="mt-5">
            <% if (request.getParameter("id") != null) { %>
                <h2>Search Results</h2>
                <% Staff staff = (Staff) session.getAttribute("found_id"); %>
                <% if (staff != null) { %>
                    <div class="card">
                        <div class="card-body">
                            <h3>Staff Details</h3>
                            <p>ID: <%= staff.getId() %></p>
                            <p>Role: <%= staff.getRole() %></p>
                        </div>
                    </div>
                <% } else { %>
                    <div class="error-container">
                        <h4><i class="bi bi-exclamation-triangle-fill"></i> ID not found!</h4>
                        <p>The ID you entered could not be found in our system. Please try again with a valid ID.</p>
                    </div>
                <% } %>
            <% } %>
        </div>
    </div>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
