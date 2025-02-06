<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ include file="header.jsp" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Checkout</title>
    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet">
    <style>
        body {
            font-family: 'Arial', sans-serif;
            background-color: #f4f4f4;
            margin: 0;
            padding: 0;
        }

        .cart-summary {
            padding: 20px;
            margin: 50px auto;
            background-color: white;
            border-radius: 8px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            width: 80%;
            max-width: 800px;
            animation: fadeIn 1s ease-out;
        }

        h2 {
            text-align: center;
            color: #007BFF;
        }

        .checkout-btn {
            display: block;
            width: 100%;
            padding: 10px;
            background-color: #28a745;
            color: white;
            text-align: center;
            font-size: 1.2em;
            border-radius: 5px;
            cursor: pointer;
            margin-top: 20px;
            text-decoration: none;
            transition: background-color 0.3s ease;
        }

        .checkout-btn:hover {
            background-color: #218838;
        }

        .checkout-btn:focus {
            outline: none;
        }

        .cart-item {
            padding: 10px;
            border-bottom: 1px solid #f0f0f0;
        }

        /* Animation */
        @keyframes fadeIn {
            from {
                opacity: 0;
            }
            to {
                opacity: 1;
            }
        }
    </style>
</head>
<body>
    <div class="cart-summary">
        <h2>Your Cart Summary</h2>
        <div>
            <c:forEach var="product" items="${cart}">
                <div class="cart-item">
                    <p><strong>${product.name}</strong> - Rs ${product.price}</p>
                </div>
            </c:forEach>
            <div class="cart-item">
                <p><strong>Total:</strong> Rs ${totalAmount}</p>
            </div>
        </div>
        <a href="/placeOrder" class="checkout-btn">Place Order</a>
    </div>

    <!-- Bootstrap JS & Popper.js -->
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.6/dist/umd/popper.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.min.js"></script>
</body>
</html>
