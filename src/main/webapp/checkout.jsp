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
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jspdf/2.5.1/jspdf.umd.min.js"></script>
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
            width: 90%;
            max-width: 900px;
            animation: fadeIn 1s ease-out;
        }

        h2 {
            text-align: center;
            color: #007BFF;
        }

        .checkout-btn {
            display: block;
            width: 100%;
            padding: 12px;
            background-color: #28a745;
            color: white;
            text-align: center;
            font-size: 1.2em;
            border-radius: 5px;
            cursor: pointer;
            margin-top: 20px;
            text-decoration: none;
            transition: background-color 0.3s ease;
            border: none;
        }

        .checkout-btn:hover {
            background-color: #218838;
        }

        .cart-item {
            padding: 10px;
            border-bottom: 1px solid #f0f0f0;
            display: flex;
            justify-content: space-between;
            align-items: center;
        }

        .cart-item img {
            width: 50px;
            height: 50px;
            object-fit: cover;
            margin-right: 10px;
        }

        .form-group {
            margin-bottom: 15px;
        }

        /* Animation */
        @keyframes fadeIn {
            from { opacity: 0; }
            to { opacity: 1; }
        }

        /* Print Styles */
        @media print {
            body { background-color: white; }
            .checkout-btn, .form-group, .cart-summary { display: none; }
            .print-section { display: block; width: 90%; max-width: 700px; background: #fff; border: 2px solid #000; margin: 20px auto; padding: 20px; }
            .print-section h2 { text-align: center; }
        }
    </style>
</head>
<body>
    <div class="cart-summary">
        <h2>Your Cart Summary</h2>
        <div>
            <c:forEach var="product" items="${cart}">
                <div class="cart-item">
                    <img src="${product.image}" alt="Product Image">
                    <p><strong>${product.name}</strong> - Rs ${product.price} x ${product.quantity}</p>
                </div>
            </c:forEach>
            <div class="cart-item">
                <p><strong>Total Price:</strong> Rs 
                <c:set var="totalPrice" value="0"/>
                <c:forEach var="product" items="${cart}">
                    <c:set var="totalPrice" value="${totalPrice + (product.price * product.quantity)}"/>
                </c:forEach>
                ${totalPrice}
                </p>
            </div>
        </div>

        <!-- Address Form -->
        <form method="POST" action="/placeOrder" id="orderForm">
            <div class="form-group">
                <label for="address" class="form-label">Address</label>
                <input type="text" class="form-control" id="address" name="address" required>
            </div>

            <div class="form-group">
                <label for="city" class="form-label">City</label>
                <input type="text" class="form-control" id="city" name="city" required>
            </div>

            <div class="form-group">
                <label for="pincode" class="form-label">Pincode</label>
                <input type="text" class="form-control" id="pincode" name="pincode" required>
            </div>

            <div class="form-group">
                <label for="state" class="form-label">State</label>
                <input type="text" class="form-control" id="state" name="state" required>
            </div>

            <button type="submit" class="checkout-btn">Place Order</button>
        </form>

        <!-- Print Bill Section -->
        <div id="bill" class="print-section" style="display:none;">
            <h2>Order Bill</h2>
            <c:forEach var="product" items="${cart}">
                <div class="cart-item">
                    <p><strong>${product.name}</strong> - Rs ${product.price} x ${product.quantity}</p>
                </div>
            </c:forEach>
            <div class="cart-item">
                <p><strong>Total Price:</strong> Rs ${totalPrice}</p>
            </div>
            <p><strong>Shipping Address:</strong> <span id="print-address"></span></p>
            <p><strong>City:</strong> <span id="print-city"></span></p>
            <p><strong>Pincode:</strong> <span id="print-pincode"></span></p>
            <p><strong>State:</strong> <span id="print-state"></span></p>
            <div class="text-center">
                <button onclick="window.print()">Print Bill</button>
                <button onclick="downloadBill()">Download Bill</button>
            </div>
        </div>
    </div>

    <!-- Bootstrap JS & Popper.js -->
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.6/dist/umd/popper.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.min.js"></script>

    <script>
        function downloadBill() {
            const { jsPDF } = window.jspdf;
            const doc = new jsPDF();

            doc.text("Order Bill", 20, 20);
            doc.text(`Address: ${document.getElementById('address').value}`, 20, 40);
            doc.text(`City: ${document.getElementById('city').value}`, 20, 50);
            doc.text(`Pincode: ${document.getElementById('pincode').value}`, 20, 60);
            doc.text(`State: ${document.getElementById('state').value}`, 20, 70);

            let yPosition = 80;
            <c:forEach var="product" items="${cart}">
                doc.text("${product.name} - Rs ${product.price} x ${product.quantity}", 20, yPosition);
                yPosition += 10;
            </c:forEach>

            doc.text("Total Price: Rs " + ${totalPrice}, 20, yPosition);
            doc.save("order_bill.pdf");
        }
    </script>
</body>
</html>
