<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Dashboard</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css">
    <style>
        /* General Navbar Styling */
        .navbar {
            margin-bottom: 20px;
        }

        /* Tabs Container */
        .tabs {
            border-bottom: 2px solid #ddd;
        }

        /* Align tabs to the right */
        .tabs .nav {
            justify-content: flex-end; /* Align nav to the right */
        }

        /* Tab Links */
        .tabs .nav-link {
            font-size: 20px;
            font-weight: 500;
            padding: 10px 20px;
            border-radius: 8px;
            transition: all 0.3s ease;
        }
        /* Active Tab Link */
        .tabs .nav-link.active {
            background: linear-gradient(45deg, #ff6b6b, #ffcc00);
            color: white;
            box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
        }

        /* Hover Effect on Tab Links */
        .tabs .nav-link:hover {
            background: linear-gradient(45deg, #3498db, #9b59b6);
            color: white;
            box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
            transform: translateY(-2px); /* Slight lift effect */
        }

        /* Focused Tab Link */
        .tabs .nav-link:focus {
            outline: none;
            background: linear-gradient(45deg, #f39c12, #e74c3c);
            color: white;
            box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
        }

        /* Navbar Custom Color */
        .navbar-light .navbar-nav .nav-link {
            color: #555;
        }

        .navbar-light .navbar-nav .nav-link:hover {
            color: #007bff;
        }
    </style>
</head>
<body>
    <!-- Tabs -->
    <div class="tabs">
        <ul class="nav nav-pills">
            <li class="nav-item">
                <a class="nav-link" href="/adminDashboard">Home</a>
            </li>
            <li class="nav-item">
                <a class="nav-link" href="/list">Products</a>
            </li>
            <li class="nav-item">
                <a class="nav-link" href="/add">Add Products</a>
            </li>
             <li class="nav-item">
                <a class="nav-link" href="/fetchUsers">All Users </a>
            </li>
            <li class="nav-item">
                <a class="nav-link" href="/login.jsp">Logout</a>
            </li>
        </ul>
    </div>
</body>

</html>
