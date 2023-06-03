<%@ Page Language="VB" AutoEventWireup="false" CodeFile="Validation.aspx.vb" Inherits="lab15_Validation" %>


<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style>
        body {
            background-color: #f2f2f2;
            color: #333;
            font-family: Arial, sans-serif;
        }

        .container {
            margin: 20px;
            padding: 20px;
            background-color: #fff;
            border-radius: 5px;
            box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
            transition: background-color 0.3s ease;
        }

        .container:hover {
            background-color: #f9f9f9;
        }

        h1 {
            color: #333;
            font-size: 24px;
            font-weight: bold;
            margin-bottom: 20px;
            text-align: center;
            transition: color 0.3s ease;
        }

        h1:hover {
            color: #4caf50;
        }

        .container label {
            display: block;
            margin-bottom: 5px;
            color: #555;
            font-weight: bold;
        }

        .container input[type="text"],
        .container input[type="button"] {
            padding: 8px;
            border-radius: 3px;
            border: 1px solid #ccc;
            background-color: #f9f9f9;
            color: #555;
            font-size: 14px;
            margin-bottom: 10px;
            width: 200px;
        }

        .container input[type="text"]:focus,
        .container input[type="button"]:focus {
            outline: none;
            border-color: #4caf50;
        }

        .container input[type="text"]::placeholder {
            color: #999;
        }

        .container input[type="button"] {
            background-color: #4caf50;
            color: #fff;
            cursor: pointer;
        }

        .container input[type="button"]:hover {
            background-color: #45a049;
        }

        .container .validation-message {
            color: #ff0000;
            margin-top: 5px;
            font-size: 13px;
        }
    </style>
</head>
<body>
 <form id="form1" runat="server">
        <div class="container">
            <h1>Validation</h1>
   
        <div class="container">
            <label for="txtValidated">Validated Number:</label>
            <asp:TextBox id="txtValidated" runat="server" />
            <asp:RangeValidator id="RangeValidator" runat="server"
                Text="The number is not in range" ErrorMessage="The number is not in the range"
                ControlToValidate="txtValidated"
                MaximumValue="10" MinimumValue="1" Type="Integer"
                ForeColor="#ff0000" Display="Dynamic" />
            <br />

            Not validated:
            <asp:TextBox id="txtNotValidated" runat="server" />
            <br /><br />
            <asp:Button id="cmdOK" runat="server" Text="OK" />
            <br /><br />
            <asp:Label id="lblMessage" runat="server" EnableViewState="False" />
        </div>

        <div class="container">
            <label for="txtExpression">Enter Validation Expression:</label>
            <asp:TextBox ID="txtExpression" runat="server"></asp:TextBox>
            <br /><br />
            <label for="txtTestString">Enter Test String:</label>
            <asp:TextBox ID="txtTestString" runat="server"></asp:TextBox>
            <br /><br />
            <asp:Button ID="btnValidate" runat="server" Text="Validate" OnClick="btnValidate_Click" />
            <br /><br />
            <asp:Label ID="lblResult" runat="server" CssClass="validation-message"></asp:Label>
            <br /><br />
            <asp:RegularExpressionValidator ID="revTestString" runat="server" ControlToValidate="txtTestString"
                ValidationExpression="^[a-zA-Z]+$" ErrorMessage="Invalid format. Only letters allowed."
                ForeColor="#ff0000" Display="Dynamic" />
        </div>

        <div class="container">
            <label for="txtName">Name:</label>
            <asp:TextBox ID="txtName" runat="server"></asp:TextBox>
            <br /><br />
            <asp:RequiredFieldValidator ID="rfvName" runat="server" ControlToValidate="txtName"
                ErrorMessage="Name is required." ForeColor="#ff0000" Display="Dynamic" />
            <br /><br />
            <label for="txtEmail">Email:</label>
            <asp:TextBox ID="txtEmail" runat="server"></asp:TextBox>
            <asp:Button ID="btnCheckEmail" runat="server" Text="Check Email" OnClick="btnCheckEmail_Click" />
            <br /><br />
            <asp:Label ID="lblEmailResult" runat="server" CssClass="validation-message"></asp:Label>
            <br /><br />
            <asp:CustomValidator ID="cvEmail" runat="server" ControlToValidate="txtEmail"
                ErrorMessage="Invalid email format." OnServerValidate="cvEmail_ServerValidate"
                ForeColor="#ff0000" Display="Dynamic" />
            <br /><br />
            <asp:Button ID="btnSubmit" runat="server" Text="Submit" OnClick="btnSubmit_Click" />
            <br /><br />
            <asp:Label ID="Label1" runat="server" CssClass="validation-message"></asp:Label>
        </div>
    </form>
</body>
</html>
