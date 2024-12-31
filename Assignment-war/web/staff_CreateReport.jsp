<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Staff Create Report</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet">
    <!-- Load the Google Charts library -->
</head>
<body>
    <%@ include file="/navigation_Staff.jsp" %> 

    <div class="container mt-5">
    <div class="row">
        <div class="col-md-6 col-lg-4 mb-4">
            <div class="card">
                <div class="card-body">
                    <h5 class="card-title">Appointment Count Report</h5>
                    <!-- Chart Placeholder for Appointment Schedule Report -->
                    <div id="appointmentChart" style="height: 20px;">
                        ${appointmentsCount}
                    </div>
                </div>
            </div>
        </div>
        
        <div class="col-md-6 col-lg-4 mb-4">
            <div class="card">
                <div class="card-body">
                    <h5 class="card-title">Diagnosis Count Report</h5>
                    <!-- Chart Placeholder for Diagnosis Report -->
                    <div id="diagnosisChart" style="height: 20px;">
                        ${diagnosisCount}
                    </div>
                </div>
            </div>
        </div>
        
        <div class="col-md-6 col-lg-4 mb-4">
            <div class="card">
                <div class="card-body">
                    <h5 class="card-title">Weekly Rota Report</h5>
                    <!-- Chart Placeholder for Working Rota Report -->
                    <div id="rotaChart" style="height: 20px;">
                        ${vetsUniqueCount}
                    </div>
                </div>
            </div>
        </div>
        
        <div class="col-md-6 col-lg-4 mb-4">
            <div class="card">
                <div class="card-body">
                    <h5 class="card-title">Employees Report</h5>
                    <!-- Chart Placeholder for Employees Report -->
                    <div id="employeesChart" style="height: 20px;">
                        ${totalEmployeesCount}
                    </div>
                </div>
            </div>
        </div>
        
        <div class="col-md-6 col-lg-4 mb-4">
            <div class="card">
                <div class="card-body">
                    <h5 class="card-title">Expertise Report</h5>
                    <!-- Chart Placeholder for Expertise Report -->
                    <div id="expertiseChart" style="height: 20px;">
                        ${totalUniqueExpertiseCount}
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>


    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
