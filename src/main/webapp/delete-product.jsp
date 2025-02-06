<%@ include file="header.jsp" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Delete Product</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css">
    <style>
        body {
            background-color: #f8f9fa;
        }
        .container {
            background-color: #ffffff;
            padding: 30px;
            border-radius: 8px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
        }
    </style>
</head>

<body>

    <div class="container mt-5">
        <h2 class="text-danger">Delete Product</h2>
        <form action="/deleteProduct" method="POST">
            <input type="hidden" name="id" value="${product.id}">
            <p>Are you sure you want to delete the product <strong>${product.name}</strong>?</p>
            <div class="mt-3">
                <button type="submit" class="btn btn-danger">Yes, Delete</button>
                <a href="/list" class="btn btn-secondary ms-3">Cancel</a>
            </div>
        </form>
    </div>

    <!-- Bootstrap JS (optional for enhanced UX) -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
