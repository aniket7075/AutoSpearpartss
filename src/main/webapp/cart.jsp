<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@include file="header.jsp" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Your Cart</title>
    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet">
    <style>
        /* Global Styles */
        body {
            font-family: Arial, sans-serif;
            background-color: #f9f9f9;
            margin: 0;
            padding: 0;
        }

        header {
            background-color: #007BFF;
            color: white;
            padding: 15px;
            text-align: center;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
        }

        h2 {
            margin: 0;
        }

        a {
            color: #007BFF;
            text-decoration: none;
        }

        a:hover {
            text-decoration: underline;
        }

        /* Cart Page Styles */
        .cart-items {
            display: flex;
            flex-direction: column;
            align-items: center;
            margin-top: 20px;
            animation: fadeIn 1s ease-out;
        }

        .cart-item {
            display: flex;
            align-items: center;
            background-color: #fff;
            border-radius: 8px;
            margin: 10px;
            padding: 15px;
            box-shadow: 0 0 15px rgba(0, 0, 0, 0.1);
            width: 80%;
            max-width: 600px;
            transition: transform 0.3s ease;
        }

        .cart-item:hover {
            transform: scale(1.05);
        }

        .cart-item img {
            max-width: 100px;
            max-height: 100px;
            object-fit: cover;
            margin-right: 20px;
        }

        .cart-item-details {
            display: flex;
            flex-direction: column;
        }

        .cart-total {
            margin-top: 20px;
            text-align: center;
            font-size: 1.5em;
            font-weight: bold;
        }

        .checkout-btn, .back-to-shop {
            text-align: center;
            margin-top: 20px;
        }

        .checkout-btn input, .back-to-shop a {
            padding: 10px 20px;
            background-color: #007BFF;
            color: white;
            text-decoration: none;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            transition: background-color 0.3s ease;
        }

        .checkout-btn input:hover, .back-to-shop a:hover {
            background-color: #0056b3;
        }

        /* Checkout Form Styles */
        .checkout-form {
            margin-top: 40px;
            padding: 20px;
            background-color: #fff;
            border-radius: 8px;
            box-shadow: 0 0 15px rgba(0, 0, 0, 0.1);
            width: 80%;
            max-width: 600px;
            margin-left: auto;
            margin-right: auto;
        }

        .checkout-form label {
            font-weight: bold;
        }

        .checkout-form input[type="text"], .checkout-form select {
            width: 100%;
            padding: 10px;
            margin: 10px 0;
            border: 1px solid #ccc;
            border-radius: 5px;
        }

        .checkout-form input[type="submit"] {
            background-color: #28a745;
            color: white;
            border: none;
            padding: 10px 20px;
            border-radius: 5px;
            cursor: pointer;
        }

        .checkout-form input[type="submit"]:hover {
            opacity: 0.9;
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

    <!-- Cart Heading -->
    <header class="header">
        <h2>Your Shopping Cart</h2>
    </header>

    <!-- Check if cart is empty -->
    <c:if test="${empty cart}">
        <div class="empty-cart text-center mt-4">
            <p>Your cart is empty. <a href="/listt" class="btn btn-primary">Continue shopping</a></p>
        </div>
    </c:if>

    <!-- Display Cart Items -->
    <div class="cart-items">
        <c:forEach var="product" items="${cart}">
            <div class="cart-item">
                <img src="${product.image}" alt="${product.name}" class="cart-item-image">
                <div class="cart-item-details">
                    <p><strong>${product.name}</strong></p>
                    <p>Price: Rs ${product.price}</p>
                    <form action="/editCart" method="post">
                        <input type="hidden" name="productId" value="${product.id}">
                        <input type="number" name="quantity" value="${product.quantity}" min="1" class="form-control" required>
                        <button type="submit" class="btn btn-primary">Update Quantity</button>
                    </form>
                    <form action="/removeFromCart" method="post">
                        <input type="hidden" name="productId" value="${product.id}">
                        <button type="submit" class="btn btn-danger">Remove</button>
                    </form>
                </div>
            </div>
        </c:forEach>
    </div>

    <!-- Cart Total -->
    <c:if test="${not empty cart}">
        <div class="cart-total">
            <p><strong>Total Price:</strong> Rs 
                <c:set var="totalPrice" value="0"/>
                <c:forEach var="product" items="${cart}">
                    <c:set var="totalPrice" value="${totalPrice + product.price * product.quantity}"/>
                </c:forEach>
                ${totalPrice}
            </p>
        </div>
    </c:if>

    <!-- Clear Cart Button -->
    <form action="/clearCart" method="post" class="text-center">
        <button type="submit" class="btn btn-warning">Clear Cart</button>
    </form>

    <!-- Proceed to Checkout Button -->
    <div class="checkout-btn">
        <form action="/checkout" method="post">
            <input type="submit" value="Proceed to Checkout" class="btn btn-success">
        </form>
    </div>

    <!-- Back to Shop Button -->
    <div class="back-to-shop">
        <a href="/dashboard" class="btn btn-secondary">Back to Shopping</a>
    </div>

    <!-- Bootstrap JS & Popper.js -->
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.6/dist/umd/popper.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.min.js"></script>
    
</body>
</html>
