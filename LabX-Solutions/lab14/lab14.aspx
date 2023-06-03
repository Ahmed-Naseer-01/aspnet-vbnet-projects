<%@ Page Language="VB" AutoEventWireup="false" CodeFile="lab14.aspx.vb" Inherits="lab14_lab14" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Lab 14</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f2f2f2;
            margin: 0;
            padding: 20px;
        }

        .container {
            max-width: 600px;
            margin: 0 auto;
            padding: 20px;
            background-color: #fff;
            border: 1px solid #ccc;
            border-radius: 4px;
        }

        label {
            display: block;
            margin-bottom: 5px;
            font-weight: bold;
        }

        input[type="text"],
        select {
            width: 100%;
            padding: 5px;
            margin-bottom: 10px;
            border: 1px solid #ccc;
            border-radius: 4px;
        }

        .button-container {
            text-align: center;
        }

        /* Custom styling */
        .form-container {
            background-color: #ffffff;
            padding: 20px;
            border: 1px solid #ccc;
            border-radius: 4px;
        }

        .form-label {
            color: #333333;
            font-weight: bold;
        }

        .form-input {
            width: 100%;
            padding: 10px;
            margin-bottom: 10px;
            border: 1px solid #ccc;
            border-radius: 4px;
            box-sizing: border-box;
        }

        .form-button {
            padding: 10px 20px;
            background-color: #4CAF50;
            color: #ffffff;
            border: none;
            border-radius: 4px;
            cursor: pointer;
        }

        .form-button:hover {
            background-color: #45a049;
        }

        .form-checkbox-label {
            font-weight: normal;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <h1>Disconnected Data Update</h1>
        <div class="form-container">
            
            <label class="form-label">Select Author:</label>
            <asp:DropDownList ID="dropDownList" runat="server" CssClass="form-input"></asp:DropDownList>
            <br />
            <label class="form-label">OR:</label>
            <asp:Button ID="createNewBtn" Text="Create New" runat="server" CssClass="form-button" />
            <asp:Button ID="insertNewBtn" Text="Insert New" runat="server" CssClass="form-button" />
            <br />
            <asp:Label id="lblResults" runat="server"></asp:Label>
        </div>
        <br />
        <br />
        <div id="divCreate" runat="server" visible="false" class="form-container">
            <label class="form-label">Unique Id:</label>
            <asp:TextBox ID="idTB" runat="server" CssClass="form-input"></asp:TextBox>
            <label>(required: ###-##-####)</label>
            <br />
            <label class="form-label">First Name:</label>
            <asp:TextBox ID="firstNameTb" runat="server" CssClass="form-input"></asp:TextBox>
            <br />
            <label class="form-label">Last Name:</label>
            <asp:TextBox ID="lastNameTb" runat="server" CssClass="form-input"></asp:TextBox>
            <br />
            <label class="form-label">Phone:</label>
            <asp:TextBox ID="phoneTb" runat="server" CssClass="form-input"></asp:TextBox>
            <br />
            <label class="form-label">Address:</label>
            <asp:TextBox ID="addressTb" runat="server" CssClass="form-input"></asp:TextBox>
            <br />
            <label class="form-label">City:</label>
            <asp:TextBox ID="cityTb" runat="server" CssClass="form-input"></asp:TextBox>
            <br />
            <label class="form-label">State:</label>
            <asp:TextBox ID="stateTb" runat="server" CssClass="form-input"></asp:TextBox>
            <br />
            <label class="form-label">Zip Code:</label>
            <asp:TextBox ID="zipTb" runat="server" CssClass="form-input"></asp:TextBox>
            <label>(required: any five digits)</label>
            <br />
            <asp:CheckBox ID="contractCb" runat="server" CssClass="form-checkbox" />
            <label class="form-checkbox-label">Contract</label>
            <br />
            <asp:Button ID="CreateBtn" Text="Create" runat="server" CssClass="form-button" />
        </div>
    </form>
</body>
</html>

