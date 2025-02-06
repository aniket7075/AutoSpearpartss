<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jspdf/2.5.1/jspdf.umd.min.js"></script>
    
    <title>Order Details</title>
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
        .order-confirmation
        {
        background-color: #007BFF;
            color: white;
            text-align: center;
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
        </div>

        <!-- Back to Shop Button -->
        <div class="back-btn">
            <a href="shop.jsp">Back to Shop</a>
        </div>
        <div class="order-confirmation">
        <h2>Thank you for your order!</h2>
        <p>Your order has been placed successfully.</p>
        <a href="/dashboard" class="btn">Back to Dashboard</a>
    </div>
    </div>

    <%@ include file="footer.jsp" %>
    <script>
    function downloadBill() {
        const { jsPDF } = window.jspdf;
        const doc = new jsPDF();

        // Title
        doc.setFontSize(18);
        doc.text("Order Bill", 20, 20);

        // Address Section
        doc.setFontSize(12);
        doc.text("Shipping Address: " + document.getElementById('address').value, 20, 30);
        doc.text("City: " + document.getElementById('city').value, 20, 40);
        doc.text("Pincode: " + document.getElementById('pincode').value, 20, 50);
        doc.text("State: " + document.getElementById('state').value, 20, 60);

        // Cart Details
        let yPosition = 70;
        <c:forEach var="product" items="${cart}">
            doc.text("${product.name} - Rs ${product.price} x ${product.quantity}", 20, yPosition);
            yPosition += 10;
        </c:forEach>

        // Total Price
        doc.text("Total Price: Rs " + ${totalPrice}, 20, yPosition);

        // Save as PDF
        doc.save("order_bill.pdf");
    }
</script>
    
</body>
</html>


