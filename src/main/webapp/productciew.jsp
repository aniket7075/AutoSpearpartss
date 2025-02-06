
<%@ include file="header.jsp" %>

<!DOCTYPE html>
<html>
<head>
    <title>Product List</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f4f4f4;
            padding: 20px;
            animation: fadeIn 1s ease-in-out;
        }
        table {
            width: 100%;
            border-collapse: collapse;
            margin: 20px 0;
        }
        th, td {
            padding: 12px;
            text-align: left;
            border: 1px solid #ddd;
        }
        th {
            background-color: #4CAF50;
            color: white;
        }
        tr:nth-child(even) {
            background-color: #f2f2f2;
        }
        a {
            text-decoration: none;
            color: #333;
        }
        a:hover {
            color: #4CAF50;
        }
        .product-photo {
            width: 100px;
            height: 100px;
            object-fit: cover;
            border-radius: 8px;
            display: block;
            margin: 0 auto;
        }
        .actions a {
            margin: 0 10px;
            font-weight: bold;
        }
        .actions a:hover {
            text-decoration: underline;
        }
        @keyframes fadeIn {
            from { opacity: 0; }
            to { opacity: 1; }
        }
    </style>
</head>
<body>
   
            
    <h2>List of Products</h2>
    <table>
        <tr>
            <th>ID</th>
            <th>Name</th>
            <th>Image</th>
            <th>Description</th>
            <th>Price</th>
            <th>Quantity</th>
            <th>Action</th>
            
        </tr>

        <c:forEach var="product" items="${products}">
            <tr>
                <td>${product.id}</td>
                <td>${product.name}</td>
                <td><img src="${product.image}" alt="${product.name}" class="product-photo"></td>
                <td>${product.description}</td>
                <td>${product.price}</td>
                <td>${product.quantity}</td>
              <td><form action="/addToCart" method="post">
                        <input type="hidden" name="productId" value="${product.id}">
                        <button type="submit" class="add-to-cart">Add to Cart</button>
                    </form></td>
            </tr>
        </c:forEach>
    </table>
   
</body>
</html>
