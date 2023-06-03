<%@ Page Language="VB" AutoEventWireup="false" CodeFile="Default.aspx.vb" Inherits="lab01_Default" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Lab 01</title>
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
   <h1><b>Lab no : 01 </b> <h1>
       <hr />

    <h2><b>Problem Statment</b></h2>
       <hr />
       <p><b>  Consider the table shown in Figure 1 and Code Listing 1. Try to solve the following problem?</b> </p>
       <p><b> Write code using C/C++ which performs following tasks:</b> </p>
       
            <br />
            <ol>
  <li>Prompt the user to enter number of columns?</li>
  <li>Prompt the user to enter number of rows?</li>
  <li>Get data cell by cell from user using a loop?</li>
<li>Generate an html page to display above data in a table?</li>
                <li>Store the page in a folder on desktop.</li>
</ol> 
       <hr />

       <h2><b> Lab Demo</b></h2>
       <p>click here : <a href="lab1.aspx ">lab 01 Demo</a></p>
            
       <hr />
       <h2><b>Lab Report : </b></h2>
       <div id="Div1" runat="server">

     <a href="lab01.pdf" download> Download Lab01 </a>
           <hr />
           <h2> <b>Output</b></h2>

          
           
           <br />
            <image><img src="Picture1.png" alt="lab01" ></image>
           <br />
           <image><img src="lab1ss.PNG" alt="lab01" ></image>
 
 </div>  



                 

</body>
</html>
