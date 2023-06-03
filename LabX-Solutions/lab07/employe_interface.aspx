<%@ Page Language="VB" AutoEventWireup="false" CodeFile="employe_interface.aspx.vb" Inherits="lab07_employe_interface" %>


<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style type="text/css">
        .auto-style1 {
            width: 1881px;
            height: 752px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div class="auto-style1" style="background-color: #89F9AD">
            &nbsp;&nbsp;<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <asp:Button ID="AddProductButton" runat="server" Text="Add New Product" />
            <br />
            <br />
            <br />
           
            
            <div id ="ProductContents" runat ="server" visible ="false" >

            
            Enter the product description :
            <asp:TextBox ID="productDescriptionTextBox" runat="server"></asp:TextBox>
            <br />
            <br />
            Enter the product finish&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; :
            <asp:TextBox ID="ProductFinishTextBox" runat="server"></asp:TextBox>
            <br />
            <br />
            Enter the product Price&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; :
            <asp:TextBox ID="StandardPriceTextBox" runat="server"></asp:TextBox>
            <br />
                <asp:Label ID="Label1" runat="server" Text="Label" Visible="False"></asp:Label>
            <br />
            <br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <asp:Button ID="AddToInventoryButton" runat="server" Text="Add to Inventory" />
        
                </div>
            </div>
    </form>
</body>
</html>

