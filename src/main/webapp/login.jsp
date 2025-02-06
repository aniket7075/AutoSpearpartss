<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Login Page</title>
    <style>
        body {
           background-size: cover;  /* Ensures the background image covers the entire screen */
    background-position: center;  /* Centers the background image */
    background-repeat: no-repeat;  /* Prevents the image from repeating */
    min-height: 100vh;  /* Ensures the body takes up the full viewport height */
    display: flex;
    flex-direction: column;
    justify-content: center;
    align-items: center;
    margin: 0;
            background-image:url('/uploads/Wall.jpg');
            overflow: hidden;
            text-align: center;
             
        }

        .login-container {
            background: rgb(106 170 202 / 65%);
    background-image: initial;
    background-position-x: initial;
    background-position-y: initial;
    background-size: initial;
    background-repeat: initial;
    background-attachment: initial;
    background-origin: initial;
    background-clip: initial;
    background-color: rgba(114 187 205 / 61%);
    padding: 40px;
    padding-top: 40px;
    padding-right: 40px;
    padding-bottom: 40px;
    padding-left: 40px;
    border-radius: 15px;
    border-top-left-radius: 15px;
    border-top-right-radius: 15px;
    border-bottom-right-radius: 15px;
    border-bottom-left-radius: 15px;
    box-shadow: -20px -4px 20px 5px rgba(0, 0, 0, 0.2);
    width: 100%;
    max-width: 500px;
        }

        h1 {
            font-size: 36px;
            color: #333;
            margin-bottom: 20px;
            font-weight: bold;
        }

        p {
           font-size: 18px;
    color: #060505;
    margin-bottom: 30px;
        }

        .form-group {
            margin-bottom: 20px;
            text-align: left;
        }

        .form-group label {
          display: block;
    font-size: 19px;
    color: #0c0a0a;
        }

        .form-group input {
            width: 100%;
            padding: 12px;
            border: 1px solid #ccc;
            border-radius: 8px;
            font-size: 16px;
            transition: border 0.3s ease;
        }

        .form-group input:focus {
            border-color: #007BFF;
            outline: none;
            box-shadow: 0 0 5px rgba(0, 123, 255, 0.4);
        }

        .button {
            display: inline-block;
            background-color: #007BFF;
            color: white;
            padding: 14px 32px;
            font-size: 18px;
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
        element.style {
    color: #2fc366;
}

        /* Background animation */
        /* @keyframes backgroundAnimation {
            0% { background: linear-gradient(135deg, #ff7e5f, #feb47b); }
            50% { background: linear-gradient(135deg, #6a11cb, #2575fc); }
            100% { background: linear-gradient(135deg, #ff7e5f, #feb47b); }
        } */

        /* body {
            animation: backgroundAnimation 10s ease-in-out infinite;
        } */

    </style>
</head>
<body>

    <div class="login-container">
        <h1>Login to Your Account</h1>
        <p>Please enter your credentials to access your account.</p>

        <form action="login" method="post">
            <div class="form-group">
                <label for="email">Email:</label>
                <input type="email" id="email" name="email" placeholder="Enter your email" required>
            </div>

            <div class="form-group">
                <label for="password">Password:</label>
                <input type="password" id="password" name="password" placeholder="Enter your password" required>
            </div>

            <div>
                <button type="submit" class="button">Login</button>
            </div>
        </form>

        <p>Don't have an account? <a href="registration.jsp" style="color: #007BFF;">Register here</a></p>
    </div>

</body>
</html>
