<%@ Page Language="VB" AutoEventWireup="false" CodeFile="dynamic button.aspx.vb" Inherits="lab05_dynamic_button" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Dynamically Add Buttons and Text Area</title>
        <style type="text/css">
html    {
  margin: 0;
  padding: 0;
  box-sizing: border-box;
  font-family: 'Poppins', sans-serif;
}
body {
    margin-top: 60px;
  display: grid;
  height: 100%;
  width: 100%;
  text-align: center;
  background: #f2f2f2;

  align-content:center
  }

.wrapper{
  width: 50%;
  background: #fff;
  border-radius: 15px;
  
  box-shadow: 0px 15px 20px rgba(0,0,0,0.1);
  margin:auto;
        }
.wrapper #div2{
  font-size: 35px;
  font-weight: 600;
  text-align: center;
  line-height: 100px;
  color: #0C022C;
  user-select: none;
  border-radius: 15px 15px 0 0;
 background: linear-gradient(0.25turn, #3f87a6, #ebf8e1, #f69d3c);
}
.wrapper{
  padding: 10px 30px 50px 30px;
}
 .button-style {
        padding: 10px 20px;
        background-color: #4285f4;
        color: #ffffff;
        border: none;
        border-radius: 5px;
        font-size: 16px;
        cursor: pointer;
        margin-right: 10px;
    }
</style>

</head>
<body>
    <form id="form1" runat="server" class ="wrapper">
        <div id ="div2" runat="server">
            <h1><b>Dynamic Button</b></h1>
        </div>
        <div>

            <asp:PlaceHolder runat="server" ID="PlaceHolder1"></asp:PlaceHolder>

        </div>

        
    </form>
</body>
</html>
