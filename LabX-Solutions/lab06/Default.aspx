<%@ Page Language="VB" AutoEventWireup="false" CodeFile="Default.aspx.vb" Inherits="lab06_Default" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style>
        label {
            font-family: monospace;
            font-size: 25px;
        }

        /* Add animation to the links */
        a {
            color: black;
            text-decoration: none;
            transition: all 0.3s ease;
        }

        a:hover {
            color: red;
            font-size: 30px;
            transform: scale(1.1);
        }

        header {
            background-color: #123;
            padding: 20px;
            color: white;
            text-align: center;
        }

        .main-heading {
            font-family: Arial, Helvetica, sans-serif;
            font-size: 40px;
            margin-bottom: 20px;
        }

        .page-navigation {
            margin: 20px;
            text-align: center;
        }

        .text-box {
            border: 2px solid #ccc;
            border-radius: 5px;
            padding: 10px;
            margin: 10px;
        }

        .customer-text {
            background-color: #f9f9f9;
        }

        .product-text {
            background-color: #e9e9e9;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <header>
            <div class="main-heading">
                <h1>Recommendation System</h1>
            </div>
            <div class="page-navigation">
                <label class="text-box customer-text">
                    <a href="#" onclick="switchToPage('Search_customer.aspx')">Customers</a>
                </label>
                <label class="text-box product-text">
                    <a href="#" onclick="switchToPage('Search_product.aspx')">Products</a>
                </label>
            </div>
        </header>

        <script>
            /* Define the function to switch between pages */
            function switchToPage(pageUrl) {
                window.location.href = pageUrl;
            }
        </script>
    </form>
</body>
</html>
