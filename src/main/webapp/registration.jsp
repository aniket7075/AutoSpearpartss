<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Registration Form</title>
    <style>
        body {
            font-family: 'Arial', sans-serif;
            background-image:url('uploads/berries.jpg');
            background-size:1900px;
            background-repeat:no-repeat;
            margin: 0;
            padding: 0;
        }

        h2 
        {
            text-align: center;
            margin-top: 40px;
            color:#000000;
            font-size: 30px;
        }

        .form-container 
        {
           width: 400px;
    margin: 50px auto;
    padding: 30px;
    border: 1px solid #cab1b100;
    border-radius: 8px;
    background-color: #b3b0b0d1;
    box-shadow: -5px 20px 10px rgba(0, 0, 0, 0.1);
        }

        label 
        {
            font-size: 20px;
            color: #333;
            margin-bottom: 5px;
        }

        input[type="text"],
        input[type="email"],
        input[type="password"],
        input[type="submit"] 
        {
            width: 100%;
            padding: 10px;
            margin: 8px 0 15px 0;
            box-sizing: border-box;
            border-radius: 5px;
            border: 1px solid #ccc;
            font-size: 14px;
        }

        input[type="text"]:focus,
        input[type="email"]:focus,
        input[type="password"]:focus
         {
            border-color: #4CAF50;
            outline: none;
        }

        input[type="submit"]
         {
    background-color: #7591dd;
    color: white;
    border: none;
    cursor: pointer;
    transition: background-color 0.3s ease;
        }

        input[type="submit"]:hover 
        {
            background-color: #45a049;
        }

        a 
        {
            display: block;
    		text-align: center;
   			 margin-top: 10px;
    		color: #e02146;
    		text-decoration: none;
    		font-size: 14px;
        }

        a:hover 
        {
            text-decoration: underline;
        }

        .error,
        .success 
        {
            margin-top: 20px;
            padding: 10px;
            text-align: center;
            border-radius: 5px;
            font-size: 14px;
        }

        .error 
        {
            background-color: #f8d7da;
            color: #721c24;
        }

        .success 
        {
            background-color: #d4edda;
            color: #155724;
        }
        
    </style>
</head>
<body>

   

    <div class="form-container">
     <h2>User Registration</h2>
        <form action="registration" method="POST">

            <label for="name">First Name:</label>
            <input type="text" id="name" name="name" required>

            <label for="lastname">Last Name:</label>
            <input type="text" id="last" name="last" required>

            <label for="phone">Phone:</label>
            <input type="text" id="phone" name="phone" required>

            <label for="email">Email: </label>
            <input type="email" id="email" name="email" required>

            <label for="address">Address: </label>
            <input type="text" id="address" name="address" required>

            <label for="city">City: </label>
            <input type="text" id="city" name="city" required>
            
            <label for="pincode">Pincode: </label>
            <input type="text" id="pincode" name="pincode" required>

            <label for="password">Password: </label>
            <input type="password" id="password" name="password" required>

            <input type="submit" value="Register">
            
            <a href="login.jsp"> Already have an account? Login here</a>

            <c:if test="${not empty error}">
                <div class="error">${error}</div>
            </c:if>
            <c:if test="${not empty success}">
                <div class="success">${success} </div>
            </c:if>

        </form>
    </div>
 <%@ include file="footer.jsp" %></div>
</body>
</html>
