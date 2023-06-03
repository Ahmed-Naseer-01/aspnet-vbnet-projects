<%@ Page Language="VB" AutoEventWireup="false" CodeFile="prob_2.aspx.vb" Inherits="lab04_prob_2" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
 <title></title>
</head>
<body>
 
 <form id="form1" runat="server">
 <div>
 <br /><br />
 <label>Rows : </label>
 <asp:TextBox id="textBoxRows" runat="server"></asp:TextBox>&nbsp &nbsp
 <label> Columns : </label>
 <asp:TextBox id="textBoxColumns" runat="server"></asp:TextBox>
 <br /><br />
 
 <asp:CheckBox runat="server" id="checkBoxBorder" Text="Put Border Around 
Cells."></asp:CheckBox><br /><br />
 <asp:Button runat="server" id="btnCreate" Text="Create"></asp:Button><br /><br
/>
 
 </div>
 <div>
 <asp:Table ID="table" runat="server">
 
 </asp:Table>
 
 </div>
 </form>
</body>
</html
