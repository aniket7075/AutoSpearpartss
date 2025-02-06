<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Auto Spare Parts - Dashboard</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">

    <!-- Font Awesome for Icons -->
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css" rel="stylesheet">

    <style>
        /* Custom Styles */
        body {
            font-family: 'Arial', sans-serif;
            background-color: #eaeaea;
        }

        .navbar {
            background-color: #343a40;
            color: white;
        }

        .navbar-brand {
            font-size: 1.8em;
            font-weight: bold;
        }

        .nav-link {
            color: white;
        }

        .nav-link:hover {
            background-color: #007bff;
            color: white;
            transform: scale(1.1);
            transition: transform 0.2s;
        }

        .dashboard-title {
            font-size: 2em;
            font-weight: 600;
            text-align: center;
            margin-top: 30px;
        }

        .card {
            transition: transform 0.3s ease;
        }

        .card:hover {
            transform: translateY(-10px);
        }

        .card-body {
            padding: 30px;
        }

        .product-image {
            width: 100%;
            max-height: 200px;
            object-fit: cover;
            border-radius: 10px;
        }

        .cart-badge {
            position: absolute;
            top: -8px;
            right: -8px;
            background-color: red;
            color: white;
            padding: 6px 12px;
            border-radius: 50%;
            font-size: 14px;
        }

        .card-footer {
            text-align: center;
        }
    </style>
</head>

<body>
    <!-- Navbar -->
    <nav class="navbar navbar-expand-lg navbar-dark">
        <div class="container">
            <a class="navbar-brand" href="#">Auto Spare Parts</a>
            <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav"
                aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
            </button>
            <div class="collapse navbar-collapse" id="navbarNav">
                <ul class="navbar-nav ms-auto">
                    <li class="nav-item">
                        <a class="nav-link" href="/dashboard">Dashboard</a>
                    </li>
                    <li class="nav-item" style="position: relative;">
                        <a class="nav-link" href="/cart.jsp">
                            <i class="fas fa-shopping-cart"></i>
                            <span class="cart-badge">${cartCount}</span>
                        </a>
                    </li>
                </ul>
            </div>
        </div>
    </nav>

    <!-- Dashboard -->
    <div class="container mt-5">
        <h3 class="dashboard-title">Welcome to Auto Spare Parts Dashboard</h3>

        <div class="row mt-4">
            <c:forEach var="part" items="${parts}">
                <div class="col-lg-3 col-md-4 col-sm-6 mb-4">
                    <div class="card">
                        <img src="${part.imageUrl}" alt="Part Image" class="product-image">
                        <div class="card-body">
                            <h5 class="card-title">${part.name}</h5>
                            <p class="card-text">${part.description}</p>
                            <p class="card-text"><strong>Price:</strong> ${part.price}</p>
                        </div>
                        <div class="card-footer">
                            <a href="/add-to-cart?id=${part.id}" class="btn btn-primary">Add to Cart</a>
                        </div>
                    </div>
                </div>
            </c:forEach>
        </div>
    </div>

    <!-- Bootstrap JS -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
</body>

</html>
