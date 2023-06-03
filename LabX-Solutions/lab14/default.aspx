<%@ Page Language="VB" AutoEventWireup="false" CodeFile="default.aspx.vb" Inherits="lab14_default" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Lab 14</title>
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
   <h1><b>Lab no : 14</b></h1>
   <hr />

    <h2><b>Problem Statement:</b></h2>
=
    <p><b>Develop an application to read authors, titles and their relationships in three different pages.</b></p>
  <p>The pages should allow to add, remove and modify authors, titles, and their associations. Use data set for storing three</p>
  <p>tables and their data relations. Update data using disconnected data access technique.</p>
<p>You may add a separate button for original source data update “Update Source Data”.</p>

    <br />
    <hr />

    <h2><b>Lab Demo</b></h2>
    <p>Click here: <a href="lab14.aspx">Lab 14 Demo</a></p>
    <hr />

    <h2><b>Lab Report:</b></h2>
    <div id="Div1" runat="server">
        <a href="lab14.pdf" download>Download Lab14</a>
        <hr />
        <h2><b>Output</b></h2>

        <br />
        <img src="Picture1.png" alt="lab14_output">
        <br />
    </div>  
</body>
</html>