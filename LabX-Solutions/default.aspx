<%@ Page Language="VB" AutoEventWireup="false" CodeFile="default.aspx.vb" Inherits="_default" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style>
.button {
    background-color: black;
    color:white;
    border: none;
    padding: 10px 20px;
    text-align: center;
    text-decoration: none;
    display: inline-block;
    font-size: 16px;
    margin: 10px;
    cursor: pointer;
    width: 150px;
    height: 60px;
    border-radius: 30px;
}

header {
    margin: 0;
    font-family: Arial, Helvetica, sans-serif;
    background-color: black;
    color: white;
    text-align: center;
}

.main-heading{
    max-width: 800px;
    margin: auto;
}

.main-heading h1{
    font-size: 50px;
    margin-top: 50px;
}

    </style>
</head>
<body bgcolor="white">
    <form id="form1" runat="server">
        
<header>
<div class="main-heading">
  <h1><span id="Labs_Navigation">Labs Navigation </span></h1>
 
</div>  
</header>
<div style="display:flex; flex-wrap:wrap; justify-content:center;">
    <asp:Button runat="server" ID="Lab1" Text="lab1" CssClass="button" />
    <asp:Button runat="server" ID="Lab2" Text="lab2" CssClass="button" />
    <asp:Button runat="server" ID="lab3" Text="lab3" CssClass="button" />
    <asp:Button runat="server" ID="lab4" Text="lab4" CssClass="button" />
    <asp:Button runat="server" ID="lab5" Text="lab5" CssClass="button" />
    <asp:Button runat="server" ID="lab6" Text="lab6" CssClass="button" />
    <asp:Button runat="server" ID="lab7" Text="lab7" CssClass="button" />
    <asp:Button runat="server" ID="lab8" Text="lab8" CssClass="button" />
    <asp:Button runat="server" ID="lab9" Text="lab9" CssClass="button" />
    <asp:Button runat="server" ID="lab10" Text="lab10" CssClass="button" />
     <asp:Button runat="server" ID="lab11" Text="lab11" CssClass="button" />
     <asp:Button runat="server" ID="lab12" Text="lab12" CssClass="button" />
     <asp:Button runat="server" ID="lab14" Text="lab14" CssClass="button" />
     <asp:Button runat="server" ID="lab15" Text="lab15" CssClass="button" />
     <asp:Button runat="server" ID="lab16" Text="lab16" CssClass="button" />
</div>
<hr />

    </form>
</body>
</html>
