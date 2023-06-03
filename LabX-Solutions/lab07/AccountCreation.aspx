<%@ Page Language="VB" AutoEventWireup="false" CodeFile="AccountCreation.aspx.vb" Inherits="lab07_AccountCreation" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style type="text/css">
        .auto-style1 {
             width: 350px;
             height: 450px;
            background-color: #0CF3C5;
            padding-left :40px;
            margin-left : 330px ;
            margin-bottom:100px;
            border:double;
            align-content:center;
            position:relative;
            top:10px;
            left:150px;
        }
        #heading{
           width: 350px;
        border-radius:20px;
        background-color:#f4b41a;
        color:#143d59;
            padding-left :40px;
            margin-left : 330px ;
            margin-bottom:10px;
            border:double;
            align-content:center;
            position:relative;
            top:10px;
            left:150px;
         
        }
        #txt{
            text-align:center;
        }
        #CreateAccountButton{
                width: 150px;
    height: 52px;
    background-color: #000000;
    color: #e71989;
    border-radius: 200px;
    margin-left: 80px;
    font-size:medium;
    font-weight:100;
    
        }
    </style>
</head>
<body id="x">
  
    <div id="heading">
          <h1 ><b>ACCOUNT CREATION</b></h1>
    </div>
  
    <form id="form1" runat="server" >
        <div class="auto-style1" >
            <br />
            <br />

            <br />
            <br />
<label id="txt"> Name :</label>
            <asp:TextBox ID="CustomerNameTextBox" runat="server"></asp:TextBox>
            <br />
            <br />
            
            
            
            <label></label>
            <label></label>
<label>Customer Address :</label>
            <asp:TextBox ID="CustomerAddressTextBox" runat="server"></asp:TextBox>
            <br />

            <br />
<label>Customer City :</label>
            <asp:TextBox ID="CustomerCityTextBox" runat="server"></asp:TextBox>
            <br />

            <br />
<label>Customer State :</label>
            <asp:TextBox ID="CustomerSateTextBox" runat="server"></asp:TextBox>
            <br />
            <br />
<label>Postal Code :</label>
            <asp:TextBox ID="CustomerPostalCodeTextBox" runat="server"></asp:TextBox>
            <br />
            <br />
<label>username :</label>
            <asp:TextBox ID="UsernameTextBox" runat="server" ></asp:TextBox>
            <br />
            <br />
<label>password :</label>
            <asp:TextBox ID="PaswordTextBox" runat="server"></asp:TextBox>

            <br />
            <asp:Label ID="Label1" runat="server" Text="Label" Visible="False"></asp:Label>
            <br />
            <br />

            <asp:Button ID="CreateAccountButton" runat="server" Text="Create Account" />
            <br />
            <br />

            <br />
            <br />

        </div>

    </form>
</body>
</html>
