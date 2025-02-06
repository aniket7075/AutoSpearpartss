<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ include file="adminheder.jsp" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Fetch User Data</title>

    <!-- Include Bootstrap CSS -->
    <link href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">

    <!-- Custom CSS -->
    <style>
        body {
            background-color: #f7f7f7;
            font-family: 'Arial', sans-serif;
            padding-top: 20px;
        }
        .table-container {
            width: 80%;
            margin: auto;
            background-color: #5192ce;
            padding: 20px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            border-radius: 8px;
            animation: fadeIn 1s ease-in-out;
        }
        table {
            width: 100%;
            margin-bottom: 20px;
        }
        th {
            background-color: #007BFF;
            color: white;
            text-align: center;
            padding: 12px;
        }
        td {
            text-align: center;
            padding: 12px;
            font-size: 14px;
        }
        tr:nth-child(even) {
            background-color: #f9f9f9;
        }
        tr:hover {
            background-color: #f1c40f;
            cursor: pointer;
            transform: scale(1.05);
            transition: transform 0.3s;
        }
        .btn-warning, .btn-danger {
            transition: background-color 0.3s, transform 0.3s;
        }
        .btn-warning:hover, .btn-danger:hover {
            background-color: #f39c12;
            transform: scale(1.05);
        }
        .table-responsive {
            margin-top: 20px;
        }

        /* Animation */
        @keyframes fadeIn {
            from { opacity: 0; }
            to { opacity: 1; }
        }
    </style>
</head>
<body>

    <div class="table-container">
        <h3 class="text-center mb-4">User Data</h3>
        <a href="/AddnewUser.jsp" class="btn btn-warning mb-3">Add New User</a>
        
        <!-- Table with Bootstrap classes -->
        <div class="table-responsive">
            <table class="table table-bordered table-striped table-hover">
                <thead>
                    <tr>
                        <th>ID</th>
                        <th>Name</th>
                        <th>Last Name</th>
                        <th>Phone</th>
                        <th>Address</th>
                        <th>City</th>
                        <th>Email</th>
                        <th>Role</th>
                        <th>Password</th>
                        <th>Operations</th>
                    </tr>
                </thead>
                <tbody>
                   <c:forEach items="${users}" var="user">
                        <tr>
                            <td>${user.id}</td>
                            <td>${user.name}</td>
                            <td>${user.last}</td>
                            <td>${user.phone}</td>
                            <td>${user.address}</td>
                            <td>${user.city}</td>
                            <td>${user.email}</td>
                            <td>${user.role}</td>
                            <td>${user.password}</td>
                            <td>
                                <a href="editt?id=${user.id}" class="btn btn-warning">Edit</a>
                                <a href="deletee?id=${user.id}" class="btn btn-danger" onclick="return confirm('Are you sure you want to delete this user?')">Delete</a>
                            </td>
                        </tr>
                    </c:forEach>
                </tbody>
            </table>
        </div>
    </div>

    <!-- Include Bootstrap JS and jQuery -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>

    <!-- Custom JavaScript for interactive functionality -->
    <script>
        $(document).ready(function() {
            // Highlight row on hover
            $("tr").hover(function() {
                $(this).css("background-color", "#f39c12");
            }, function() {
                $(this).css("background-color", "");
            });

            // Add additional JavaScript functionality if needed
        });
    </script>

<%@ include file="footer.jsp" %>

</body>
</html>
