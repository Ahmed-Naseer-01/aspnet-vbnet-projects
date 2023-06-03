<%@ Page Language="VB" AutoEventWireup="false" CodeFile="prob_01.aspx.vb" Inherits="lab04_prob_01" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
 <title></title>
</head>
<body>
 <form id="form1" runat="server">
 <div>
 <label>Choose your Favourite Programming Languages: </label>
 <br />
 <br />
 <asp:CheckBoxList id="cb1" runat="server">
 </asp:CheckBoxList>
 <br />
 <br />
 <button runat="server" id="btn1" >OK</button>
 <br />
 <br />
 <div runat ="server" id="div1">
 <asp:label runat="server" id="label1"></asp:label>
 </div>
 </div>
 </form>
</body>
</html>
