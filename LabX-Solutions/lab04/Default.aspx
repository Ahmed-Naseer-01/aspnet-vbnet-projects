<%@ Page Language="VB" AutoEventWireup="false" CodeFile="Default.aspx.vb" Inherits="lab04_Default" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Lab 04</title>
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
            <h1><b>problem statement 01</b></h1>
            <p>
              <b>Develop an asp.net page that displays a list of options with check boxes (Use 
CheckBoxList web control). 
On clicking a button (web control) the page displays the selected options in a 
label control.</b>
            </p>
            <h3>Demo : </h3>
            
        <a href="prob_01.aspx">problem 01</a>
        </div>
         <div>
            <h1><b>problem statement 02</b></h1>
            <p>
               <b>Develop a page that displays two text boxes and a button web 
control. The textboxes are used to capture number of rows and 
number of columns from user. 
(a) On clicking button, generate a table with r rows and c columns. 
In each cell display row,col values.
(b) Optionally add features of border and image in each cell.
Following figure shows a table with 4 rows and 4 columns.</b>
            </p>
             <hr />
            <h3>Demo :  <a href="prob_2.aspx">problem 02</a></h3>
            
       
        </div>
         <hr />
       <h2><b>Lab Report : </b></h2>
       <div id="Div1" runat="server">

     <a href="lab04.pdf" download> Download Lab04</a>
           <hr />
           <h2> <b>Output</b></h2>
           <hr />
           <hr />
            <image><img src="output1.PNG" alt="lab04" ></image>
           <br />
            <image><img src="output2.PNG" alt="lab04" ></image>
           <br />
           </div>
    </form>
</body>
</html>
