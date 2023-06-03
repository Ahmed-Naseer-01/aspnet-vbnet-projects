<%@ Page Language="VB" AutoEventWireup="false" CodeFile="lab12.aspx.vb" Inherits="lab12_lab12" %>


<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
 <title></title>

  <style>
    * {
      margin: 0;
      padding: 0;
      box-sizing: border-box;
    }
    html, body {
      height: 100%;
      font-family: 'Lato', sans-serif;
    }
    #container {
      display: grid;
      place-items: center;
      height: 100%;
    }
    #form1 {
      display: flex;
      flex-direction: column;
      align-items: center;
      background-color: #fff;
      padding: 20px;
      border-radius: 5px;
      box-shadow: 5px 5px 30px rgba(0,0,0,0.2);
    }
    h1, h2 {
      color: #0069d9;
      text-align: center;
      margin-bottom: 20px;
    }
    .radio-container {
      text-align: center;
      margin-bottom: 20px;
    }
    .radio-container label {
      margin-right: 10px;
      color: #0069d9;
    }
    .output {
      text-align: center;
      margin-top: 20px;
    }
    .output input[type="text"] {
      padding: 10px;
      font-size: 16px;
      width: 300px;
      border-radius: 5px;
      border: 1px solid lightgrey;
    }
    .output input[type="submit"] {
      margin-top: 10px;
      padding: 10px 20px;
      font-size: 16px;
      background-color: #0069d9;
      color: #fff;
      border: none;
      border-radius: 5px;
      cursor: pointer;
    }
    .output input[type="submit"]:hover {
      background-color: #0051a8;
    }
    #DropDownList {
      margin-top: 20px;
      padding: 18px;
      font-size: 10px;
      width: 260px;
      border-radius: 5px;
      border: 3px solid lightgrey;
    }
    #DropDownList:focus {
      outline: none;
      border-color: #0069d9;
      box-shadow: 0 0 5px rgba(0, 105, 217, 0.5);
    }
    #TextBox2 {
      margin-top: 10px;
      padding: 10px;
      font-size: 20px;
      width: 300px;
      border-radius: 5px;
      border: 1px solid lightgrey;
    }
  </style>
</head>
<body>
 <form id="form1" runat="server">
 <div id="container">

    
     <div>
          <h1>Find the Product Description whose price is Selected Below: </h1>
<asp:RadioButtonList ID="radioButtonList" runat="server" AutoPostBack="true">
    <asp:ListItem id="minRadioButton" runat="server">Minimum</asp:ListItem>
    <asp:ListItem id="maxRadioButton" runat="server">Maximum</asp:ListItem>
</asp:RadioButtonList>
</div>
     
     <div class="output">
         <h2>price </h2>
    <asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>
</div>
     </div> 


 
 <br />
 <br />
 <h1 id="second_heading">Find total Cost of Products(including quantity) ordered by
 customers who live in the selected city? </h1>
<asp:DropDownList ID="DropDownList" runat="server"
AutoPostBack="true">
    <asp:ListItem Value="" Text="Select City"></asp:ListItem>
</asp:DropDownList>

 <br />
 <asp:TextBox ID="TextBox2" runat="server">
 </asp:TextBox>

 </form>
</body>
</html>
