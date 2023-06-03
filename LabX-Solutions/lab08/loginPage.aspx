<%@ Page Language="VB" AutoEventWireup="false" CodeFile="loginPage.aspx.vb" Inherits="lab08_loginPage" %>



<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style type="text/css">
        body {
            background-color: #f8f8f8;
            font-family: Arial, sans-serif;
        }
       h1 {
        font-size: 36px;
        font-weight: bold;
        text-align: center;
        color: #333333;
        margin-top: 50px;
        transition: color 0.3s ease;
        cursor: pointer;
    }
        .auto-style1 {
            width: 50%;
            max-width: 1178px;
            height: 100%;
            margin: 0 auto;
            padding: 60px;
            background-color: #c4fcff;
            box-sizing: border-box;
        }
        label {
            display: block;
            margin-bottom: 10px;
            color: #333;
            font-size: 16px;
        }
        input[type="text"],
        input[type="password"],
        input[type="email"] {
            display: block;
            width: 60%;
            padding: 10px;
            margin-bottom: 20px;
            border: 1px solid #ccc;
            border-radius: 4px;
            box-sizing: border-box;
            font-size: 16px;
        }
        input[type="submit"] {
            display: block;
            width: 100%;
            max-width: 200px;
            margin: 0 auto;
            padding: 10px;
            background-color:#000000;
            color: #fff;
            border: none;
            border-radius: 4px;
            font-size: 16px;
            cursor: pointer;
        }
        input[type="submit"]:hover {
            background-color: #006B8F;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <h1>Log in </h1>
        </div>

        <div class="auto-style1">
            <label for="emailTextBox"><strong>Username/Email:</strong></label>
         
            <asp:TextBox ID="emailTextBox" runat="server" ></asp:TextBox>
            <br />
            <label for="passwordTextBox"><strong>Password:</strong></label>
            <asp:TextBox ID="passwordTextBox" runat="server" TextMode="Password"></asp:TextBox>
            <br />
            <asp:Label ID="incorrectUserPasswordLabel" runat="server" ForeColor="#CC3300" Text="'incorrect username/password '" Visible="False"></asp:Label>
            <br />
            <br />
            <asp:Button ID="loginButton" runat="server" Text="Login" />
            <br />
            <br />
           <asp:Button ID="Button2" runat="server" Text="Create an Account" OnClick="Button2_Click" />
        </div>
    </form>
</body>