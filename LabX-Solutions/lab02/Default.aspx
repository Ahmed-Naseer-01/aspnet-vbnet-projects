<%@ Page Language="VB" AutoEventWireup="false" CodeFile="Default.aspx.vb" Inherits="lab02_Default" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Lab 02</title>
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
    <h1><b>Lab no : 02 </b> <h1>
       <hr />

    <h2><b>Problem Statment</b></h2>
       <hr />
       <p><b> Develop a page to demonstrate various events which are raised and
handled during ASP.NET Page processing once the page object has
been created? Develop a story about it?</b> </p>

       <hr />

       <h2><b> Lab Demo</b></h2>
       <p>click here :  <a href="lab02.aspx">lab02 Demo </a></p>
           
       <hr />
       <h2><b>Lab Report : </b></h2>
       <div id="Div1" runat="server">
           
     <a href="lab02.pdf" download> Download Lab02</a>
           <hr />
           <h2> <b>Output</b></h2>
           <br />
            <image><img src="pic1.PNG" alt="lab01" ></image>
           <br />
 
           <hr />

 
 </div>  
</body>
</html>
