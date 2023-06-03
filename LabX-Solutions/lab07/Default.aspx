<%@ Page Language="VB" AutoEventWireup="false" CodeFile="Default.aspx.vb" Inherits="lab07_Default" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>LAB 07</title>
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
    <form id="form1" runat="server">
        <h1><b>Lab no : 07 </b> <h1>
       <hr />

    <h2><b>Problem Statment</b></h2>
       <hr />
       <p><b> Consider Pine Valley Furniture Company database schema.</b> </p>
       <p><b> Develop an application for following functionalities:</b> </p>
            <ol>
                <li><b>Develop a page that allows user to register as a new customer.</b></li>
                <li><b>Develop a page to allows user to login</b></li>
                <li><b>Develop a page to add new products.</b></li>
                <li><b>Develop a page to place an order with corresponding order details.</b></li>
                <li><b>Create two separate roles for above functionalities</b></li>
            </ol>
            <ul>
                <li><b>Customer role</b>C</li>
                <li><b>Employee role</b></li>
            </ul>
   <hr />

       <hr />

       <h2><b> Lab Demo</b></h2>
       <p><b>Click here : <a href="loginPage.aspx "> Lab 07 </a></b> </p>
            
       <hr />
       <h2><b>Lab Report : </b></h2>
       <div id="Div1" runat="server">

     <a href="lab07 " download> Download Lab_07 </a>
           <hr />
           <hr />
           <h2> <b>Output</b></h2>
           <br />
           <br />
            <image><img src="AccountCreation.PNG" alt="1" ></image>
           <br />
           <br />
            <image><img src="product_verify.PNG" alt="product_verify" ></image>
           <br />
           <br />
            <image><img src="pvfc_customer.PNG" alt="pvfc_customer" ></image>
           <br />
           <br />
            <image><img src="pvfc_employee.PNG" alt="pvfc_employee" ></image>
           <br /><br />
            <image><img src="add_product.PNG" alt="add_product" ></image>
           <br />
           <br />
            <image><img src="login_output.PNG" alt="login_outpu1" ></image>
          
           <br />
           <br />
            <image><img src="search_product.PNG" alt="search_product" ></image>
           <br />

 
 </div>  
    </form>
</body>
</html>
