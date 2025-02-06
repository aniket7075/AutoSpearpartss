<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Welcome to Auto Spare Parts</title>
    <style>
        body {
            font-family: 'Arial', sans-serif;
            margin: 0;
            padding: 0;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
            background-image: url('/uploads/auto_parts_bg.jpg');
            background-size: cover;
            background-position: center;
            color: white;
            text-align: center;
            background-attachment: fixed;
        }

        .home-container {
            background-color: rgba(0, 0, 0, 0.7);
            padding: 50px;
            border-radius: 15px;
            box-shadow: -8px -7px 40px rgba(0, 0, 0, 0.3);
            width: 100%;
            max-width: 600px;
            text-align: center;
        }

        h1 {
            font-size: 48px;
            color: #fff;
            margin-bottom: 20px;
            font-weight: bold;
        }

        p {
            font-size: 22px;
            color: #f1f1f1;
            margin-bottom: 30px;
        }

        .button {
            display: inline-block;
            background-color: #007bff;
            color: #fff;
            padding: 18px 40px;
            font-size: 20px;
            font-weight: bold;
            text-decoration: none;
            border-radius: 8px;
            margin-top: 20px;
            transition: background-color 0.3s ease, transform 0.3s ease, box-shadow 0.3s ease;
        }

        .button:hover {
            background-color: #0056b3;
            transform: translateY(-4px);
            box-shadow: 0 4px 12px rgba(0, 123, 255, 0.4);
        }

        .button:active {
            background-color: #004085;
            transform: translateY(2px);
        }

        .link-container {
            margin-top: 30px;
        }

        .link-container a {
            color: #ff8c00;
            font-size: 18px;
            text-decoration: none;
            margin: 0 15px;
        }

        .link-container a:hover {
            text-decoration: underline;
        }

        /* Background animation */
        @keyframes backgroundAnimation {
            0% { background-image: url('/uploads/auto_parts_bg.jpg'); }
            50% { background-image: url('/uploads/auto_parts_bg2.jpg'); }
            100% { background-image: url('/uploads/auto_parts_bg.jpg'); }
        }
    </style>
</head>
<body>

    <div class="home-container">
        <h1>Welcome to Auto Spare Parts</h1>
        <p>Your trusted partner for premium auto spare parts.</p>

        <a href="registration.jsp" class="button">Register</a>
        <a href="login.jsp" class="button">Login</a>

        <div class="link-container">
            <p>Explore our wide range of high-quality auto parts and accessories!</p>
        </div>
    </div>

</body>
</html>
