<%@ Page Language="VB" AutoEventWireup="false" CodeFile="Default.aspx.vb" Inherits="lab16_Default" %>


<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Lab 16</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f9f9f9;
            margin: 20px;
            color: #333;
        }

        h1, h2, p {
            margin-bottom: 10px;
        }

        h1 {
            font-size: 32px;
            color: #4285f4;
            text-align: center;
        }

        h2 {
            font-size: 24px;
            color: #ea4335;
            text-align: center;
        }

        p {
            font-size: 18px;
            color: #3c4043;
            text-align: center;
        }

        a {
            color: #4285f4;
            text-decoration: none;
        }

        #Div1 {
            background-color: #ffffff;
            padding: 20px;
            border-radius: 5px;
            box-shadow: 0 2px 5px rgba(0, 0, 0, 0.1);
            margin-top: 20px;
            text-align: center;
        }

        img {
            max-width: 100%;
            height: auto;
            margin-top: 20px;
        }
        
        /* Interactive Styles */
        h1:hover, h2:hover, p:hover {
            color: #ea4335;
            cursor: pointer;
        }
    </style>
</head>
<body>
   <h1><b>Lab no : 16</b></h1>
   <hr />

    <h2><b>Problem Statement:</b></h2>

<p><b>Problem Description:</b></p>
<p>Develop a web service that allows fetching the due amount to be paid by a customer and later sending a payment confirmation to be posted in the customer record of PVFC Company.</p>
<p><b>Web Methods:</b></p>
<p>a) Authentication method for web service consumer</p>
<p>Consumer (banking software discussed below) will pass the user ID and password. Upon successful authentication, the service hosted at PVFC will return a token with a specific time limit.</p>
<p>Reject Unauthenticated Requests: All other methods of the web service will check the validity of the token temporarily issued to the banking software before proceeding further. Otherwise, the consumer request will be rejected.</p>
<p>b) Method to fetch due amount for a customer</p>
<p>The method will receive a customer reference number and return the due amount with the due date to the consumer.</p>
<p>c) Method for payment confirmation for a customer</p>
<p>The method will receive the customer reference number, paid amount, and payment date for updating PVFC company's customer records.</p>


    <br />
    <hr />

    <h2><b>Lab Demo</b></h2>
    <p>No Demo <a href="Default.aspx">Lab 16</a></p>
    <hr />

    <h2><b>Lab Report:</b></h2>
    <div id="Div1" runat="server">
        <a href="lab16.pdf" download>Download Lab 16</a>
        <hr />
       
    </div>  
</body>
</html>

