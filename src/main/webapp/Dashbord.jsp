<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ include file="header.jsp" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>User Dashboard</title>
    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet">
    <style>
        /* General Body Styling */
        body {
            font-family: Arial, sans-serif;
            background-color: #f4f4f4;
            margin: 0;
            padding: 0;
        }

        /* Header Styling */
        h1 {
            color: #e74c3c; /* Stylish Red */
            font-family: 'Arial', sans-serif;
            background-color: #ffffff;
            padding: 20px;
            text-align: center;
            border-bottom: 3px solid #ddd;
            box-shadow: 0px 4px 8px rgba(0, 0, 0, 0.1);
        }

        h2 {
            color: #333;
            text-align: center;
            font-size: 2em;
            margin-top: 30px;
        }

        h3 {
            color: #e74c3c; /* Stylish Red */
            font-family: 'Arial', sans-serif;
            background-color: #fff;
            padding: 15px;
            border-radius: 8px;
            text-align: center;
            box-shadow: 0px 4px 8px rgba(0, 0, 0, 0.1);
            margin-bottom: 15px;
        }

        /* Product List Grid */
        .product-list {
            display: grid;
            grid-template-columns: repeat(auto-fill, minmax(250px, 1fr));  /* Flexible grid */
            gap: 20px;
            padding: 20px;
        }

        /* Product Card Styling */
        .product-card {
            border: 1px solid #ddd;
            border-radius: 8px;
            padding: 20px;
            background-color: #fff;
            text-align: center;
            box-shadow: 0px 4px 8px rgba(0, 0, 0, 0.1);
            transition: all 0.3s ease;
        }
        .product-card:hover 
        {
            transform: translateY(-5px); /* Hover effect for product card */
            box-shadow: 0px 8px 15px rgba(0, 0, 0, 0.2);
        }

        .product-card img
         {
            max-width: 100%;
            height: 200px;
            object-fit: cover; /* Ensure the image maintains aspect ratio */
            border-radius: 8px;
            margin-bottom: 15px;
        }

        .product-card h3 {
            font-size: 1.5em;
            margin: 10px 0;
            color: #333;
        }

        .product-card p 
        {
            color: #555;
            margin: 5px 0;
        }

        /* Button Styling */
        .product-card button 
        {
            padding: 12px 20px;
            margin: 10px 5px;
            border: none;
            border-radius: 5px;
            font-size: 1em;
            cursor: pointer;
            transition: background-color 0.3s;
        }

        .product-card .add-to-cart 
        {
            background-color: Black;
            color: white;
        }

        .product-card .buy-now {
            background-color: #ff0c00;
            color: white;
        }

        .product-card button:hover {
            opacity: 0.9;
        }

        /* Form Styling for Buttons */
        form 
        {
            display: inline-block;
        }

        /* Responsive Styling */
        @media (max-width: 768px) 
        {
            .product-list
            {
                grid-template-columns: repeat(auto-fill, minmax(200px, 1fr)); /* Adjust grid for smaller screens */
            }
        }
    </style>
</head>
<body>
 
    <h2>Available Products</h2>

    <div class="product-list">
        <c:forEach var="product" items="${products}">
            <div class="product-card">
                <img src="${product.image}" alt="${product.name}">
                <h3>${product.name}</h3>
                <p>Price: Rs ${product.price}</p>
                <p>${product.description}</p>
                <div class="actions">
                    <!-- Add to Cart Button -->
                    <form action="/addToCart" method="post">
                        <input type="hidden" name="productId" value="${product.id}">
                        <button type="submit" class="add-to-cart">Add to Cart</button>
                    </form>
                    <!-- Buy Now Button (Not yet implemented) -->
                    <form action="/buyNow" method="post">
                        <input type="hidden" name="productId" value="${product.id}">
                        <button type="submit" class="buy-now">Buy Now</button>
                    </form>
                </div>
            </div>
        </c:forEach>
    </div>

    <%@ include file="footer.jsp" %>
</body>
</html>
