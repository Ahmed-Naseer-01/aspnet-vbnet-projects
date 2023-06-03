<%@ Page Language="VB" AutoEventWireup="false" CodeFile="prob_A.aspx.vb" Inherits="lab03_prob_A" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
 <style>
 #form1{
 margin:50px;
 padding:30px;
 border:3px solid black
 }
 .div1Class{
 
 
 }
 #ResultDiv{
 border:1px solid black;
 color:black;
 font-size:25px;
 }
 </style>
 <title></title>
</head>
<body>
 <form id="form1" runat="server">
 <div class="div1Class" id="div1">
 <label runat="server" id ="label1">
 Convert : &nbsp
 </label>
 <input id="inputAmount" runat="server" type="text"/>&nbsp
 <label runat="server" id ="label2">
 &nbsp &nbsp US . dollars to &nbsp
 </label>
 <select id="SelectCurrency" runat="server"></select>
 <br />
 <br />
 <input type="submit" value="OK" id="Convert" runat="server"/>
 <input type="submit" value="Show Graph" id="ShowGraph" runat="server">
 <br />
 <br />
 <br />
 </div>
 <img id="GraphImage" runat="server"/>
 <br />
 <br />
 <br />
 
 <div id="ResultDiv" runat="server"></div>
 </form>
</body>
</html>

