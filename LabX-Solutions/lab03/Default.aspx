<%@ Page Language="VB" AutoEventWireup="false" CodeFile="Default.aspx.vb" Inherits="lab03_Default" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Lab 03</title>
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
        <div>
            <h1>Problem Statement A</h1>
            <p>Refer to Chapter No. 5 of the textbook. 
“Chapter 5: Web Form Fundamentals”
Implement the Currency Converter Application discussed in the class.
The application should include following features:
• Conversion from US dollars to Euros, Canadian Dollars and Japanese Yen.
• Display currency graphs. (The graphs are available in this folder of Lab).</p>
            <br /><h3><b>Demo :   <a href="prob_A.aspx">Problem_A</a></b></h3>
          
        </div>
        <div>
            <h1>problem statement B</h1>
            <p>
                Part A)
Using Html server controls develop a web form that displays a rectangle {refer to 
book page 147 4/e}. Write appropriate event handler code that detects the location 
at which the user has clicked.
Part B)
Modify code developed in Part (A) to identify regions on the following circle:
[Hint:] Use Screen coordinates, Cartesian coordinates and Polar coordinates
            </p>
<h3><b>Demo : <a href="prob_B.aspx">Problem_B</a></b></h3>
           
        </div>
    </form>
    <h2><b>Lab Report : </b></h2>
       <div id="Div1" runat="server">

     <a href="lab03.pdf" download> Download Lab03</a>
           <hr />
           <h2> <b>Output</b></h2>
            <image><img src="output1.PNG" alt="lab01" ></image>
            <image><img src="ouput2.PNG" alt="lab01" ></image>
           <br />

 
 </div>  
</body>
</html>