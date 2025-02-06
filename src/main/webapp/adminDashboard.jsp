<%@ include file="adminheder.jsp" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Admin Dashboard</title>
    <!-- Include Bootstrap CSS -->
    <link href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">

    <!-- Custom CSS -->
    <style>
        body {
            background-color: #f4f7f6;
            font-family: 'Arial', sans-serif;
            padding-top: 20px;
            color: #333;
        }
        h1 {
            color: #459870; /* Stylish Green */
            background-color: #fff;
            padding: 20px;
            border-radius: 8px;
            text-align: center;
            box-shadow: 0px 4px 8px rgba(0, 0, 0, 0.1);
            font-size: 2rem;
        }

        .table-container {
            width: 85%;
            margin: auto;
            background-color: #5192ce;
            padding: 20px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            border-radius: 8px;
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
            font-size: 1.1rem;
        }

        td {
            text-align: center;
            padding: 10px;
            font-size: 1rem;
        }

        tr:nth-child(even) {
            background-color: #f8f8f8;
        }

        tr:hover {
            background-color: #f1c40f;
            cursor: pointer;
        }

        .table-responsive {
            margin-top: 20px;
        }

        .btn {
            font-weight: bold;
            padding: 8px 16px;
            border-radius: 5px;
        }

        .btn-warning {
            background-color: #ff9800;
            color: white;
        }

        .btn-danger {
            background-color: #e74c3c;
            color: white;
        }

        .btn:hover {
            opacity: 0.9;
        }

        .btn-warning:hover {
            background-color: #f39c12;
        }

        .btn-danger:hover {
            background-color: #c0392b;
        }

    </style>
</head>
<body>

    <h1>Registered Users</h1>

    <div class="table-container">
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

    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.1/umd/popper.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>

<%@ include file="footer.jsp" %>

</body>
</html>
