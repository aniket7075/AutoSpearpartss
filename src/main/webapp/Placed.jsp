<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Order Invoice</title>
    <style>
        body { font-family: Arial; margin: 20px; }
        h2, h4 { text-align: center; }
        .address-section { display: flex; justify-content: space-between; margin-top: 30px; }
        .address-box { width: 48%; border: 1px solid #ccc; padding: 15px; border-radius: 5px; }
        .address-box h4 { border-bottom: 1px solid #ccc; padding-bottom: 5px; }
        table { width: 100%; border-collapse: collapse; margin-top: 30px; }
        th, td { border: 1px solid #ccc; padding: 10px; text-align: left; }
        th { background-color: #f2f2f2; }
        .total { text-align: right; font-weight: bold; margin-top: 20px; }
        .print-btn { text-align: center; margin-top: 30px; }
        button { padding: 10px 20px; cursor: pointer; }
        .headd
        {
       		color: red;
        }
    </style>
</head>
<body>
    <h2 class="headd">Auto Spear-Parts Manegment System</h2>
    <h2>Order Invoice</h2>
    <h4>Order Placed: 
    <!-- <script>document.write(new Date().toLocaleDateString());</script> -->
    <script>
        const today = new Date();
        const formattedDate = today.getDate().toString().padStart(2, '0') + "/" + 
                              (today.getMonth() + 1).toString().padStart(2, '0') + "/" + 
                              today.getFullYear();
        document.write(formattedDate);
    </script>
    </h4>

    <div class="address-section">
        <div class="address-box">
            <h4>Customer Address</h4>
            <p><strong>Name:</strong> ${currentUser.name}</p>
            <p><strong>Address:</strong> ${currentUser.address}</p>
            <p><strong>City:</strong> ${currentUser.city}</p>
            <p><strong>Mobile:</strong> ${currentUser.phone}</p>
            <p><strong>PinCode:</strong> ${currentUser.pincode}</p>
        </div>

        <div class="address-box">
            <h4>Company Address</h4>
            <p><strong>Company Name:</strong> Spear-Parts Manegment System </p>
            <p><strong>Address:</strong> 100ft Road,Vishrambag,Sangli</p>
            <p><strong>City:</strong> Sangli, Maharashtra - 416416</p>
            <p><strong>Contact:</strong> +91 9876543210</p>
        </div>
    </div>

    <table>
        <thead>
            <tr>
            
                <th>Product Name</th>
                <th>Price (Rs.)</th>
                
            </tr>
        </thead>
        <tbody>
        
            <c:forEach var="product" items="${cart}">
                <tr>
                	
                    <td>${product.name}</td>
                    <td>${product.price}</td>
                    
                </tr>
            </c:forEach>
        </tbody>
    </table>

<div style="margin-top: 20px; border: 1px solid #ccc; border-radius: 5px; padding: 10px; background-color: #f9f9f9;">
    <h4>Payment Information</h4>
    <span><strong>Payment Method:</strong> Cash on Delivery</span>
</div>
	<p class="total">SubTotal Amount: Rs ${subtotal}</p>
	<p class="total">Shiping Charges:Rs ${shippingCharge}</p>
	<%-- <p class="total">Discount :Rs - ${promoDiscount}</p> --%>
    <p class="total">Total Amount: Rs ${totalAmount}</p>
	
    <div class="print-btn">
    
        <button onclick="window.print()">Print Bill</button>
    </div>
</body>
</html>
