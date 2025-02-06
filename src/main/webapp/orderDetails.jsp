<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Order Details</title>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jspdf/2.5.1/jspdf.umd.min.js"></script>
    
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f9f9f9;
            margin: 0;
            padding: 0;
        }
        header {
            background-color: #007BFF;
            color: white;
            text-align: center;
            padding: 15px;
        }
        .container {
            margin: 20px auto;
            width: 80%;
            max-width: 600px;
            background-color: white;
            padding: 20px;
            border-radius: 8px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        }
        h2 {
            text-align: center;
        }
        .order-items {
            margin-bottom: 20px;
        }
        .product {
            display: flex;
            justify-content: space-between;
            padding: 10px 0;
            border-bottom: 1px solid #ccc;
        }
        .product:last-child {
            border-bottom: none;
        }
        .total {
            font-size: 1.2em;
            font-weight: bold;
            text-align: right;
            margin-top: 20px;
        }
        .print-btn {
            text-align: center;
            margin-top: 20px;
        }
        .print-btn button {
            padding: 10px 20px;
            background-color: #007BFF;
            color: white;
            border: none;
            border-radius: 5px;
            cursor: pointer;
        }
        .print-btn button:hover {
            opacity: 0.9;
        }
        .back-btn {
            display: block;
            margin-top: 20px;
            text-align: center;
        }
        .back-btn a {
            padding: 10px 20px;
            background-color: #28a745;
            color: white;
            text-decoration: none;
            border-radius: 5px;
        }
        .back-btn a:hover {
            opacity: 0.9;
        }
    </style>
</head>
<body>
    <header>
        <h2>Order Details</h2>
    </header>
    <div class="container">
        <h3>Thank you for your order!</h3>
        <div class="order-items">
            <c:forEach var="product" items="${cart}">
                <div class="product">
                    <span>${product.name}</span>
                    <span>Rs ${product.price}</span>
                </div>
            </c:forEach>
        </div>
        <div class="total">
            Total: Rs ${totalAmount}
        </div>

        <!-- Print Button -->
        <div class="print-btn">
            <button onclick="window.print()">Print Order</button>
            <button onclick="downloadBill()">Download Bill</button>
            <a href="/orderSummary.jsp">Check Order Summary</a>
        </div>

        <!-- Back to Shop Button -->
        <div class="back-btn">
            <a href="dashboard">Back to Shop</a>
        </div>
    </div>

    <%@ include file="footer.jsp" %>
</body>
</html>

<script>
    function downloadBill() {
        const { jsPDF } = window.jspdf;
        const doc = new jsPDF();

        // Title
        doc.setFontSize(18);
        doc.text("Order Bill", 20, 20);

        // Address Section - Ensure the form elements exist before using them
        const address = document.getElementById('address') ? document.getElementById('address').value : 'Not provided';
        const city = document.getElementById('city') ? document.getElementById('city').value : 'Not provided';
        const pincode = document.getElementById('pincode') ? document.getElementById('pincode').value : 'Not provided';
        const state = document.getElementById('state') ? document.getElementById('state').value : 'Not provided';

        doc.setFontSize(12);
        doc.text("Shipping Address: " + address, 20, 30);
        doc.text("City: " + city, 20, 40);
        doc.text("Pincode: " + pincode, 20, 50);
        doc.text("State: " + state, 20, 60);

        // Cart Details - Loop through cart items
        let yPosition = 70;
        <c:forEach var="product" items="${cart}">
            doc.text("${product.name} - Rs ${product.price} x ${product.quantity}", 20, yPosition);
            yPosition += 10;
        </c:forEach>

        // Total Price
        doc.text("Total Price: Rs " + ${totalAmount}, 20, yPosition);

        // Save as PDF
        doc.save("order_bill.pdf");
    }
</script>
