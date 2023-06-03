<%@ Page Language="VB" AutoEventWireup="false" CodeFile="Search_customer.aspx.vb" Inherits="lab06_Search_customer" %>


<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
   <style>
          body {
    background: #e0e5ec;
  }
            .h1class{
                position: relative;
    text-align: center;
    color: #353535;
    font-size: 50px;
    font-family: "Cormorant Garamond", serif;
            }
         .h3Class{
             font-family: 'Lato', sans-serif;
    font-weight: 300;
    text-align: left;
    font-size: 18px;
    color: #676767;
         }
         .tb1{
             height:30px;
             width:250px;
             font-family:monospace;
             font-size:30px
          
              
         }
         .lbl1{
             
                 font-size: 20px;
    font-family: Arial, sans-serif;
    background-color: #f0f0f0;
    padding: 5px;
    margin: 10px 0;
         }
         .btn1{
             margin-left:400px;
             width:200px;
             font-size:30px
         }
         .lbl1{
             width:1000px;
             margin-left:100px;
             font-family:monospace;
             font-size:30px;
         }
        
          .label1{
            font-family:monospace;
            font-size:30px;
        }
         .label2{
            font-family:monospace;
            font-size:30px;
        }
   </style>
</head>
<body>
    <form id="form1" runat="server">
        <div id="div1" runat="server">
            <h1 class="h1class">Search Customer</h1>
            
            <div> <h3 class="h3Class">Enter Customer Name : </h3>&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp
            <asp:TextBox Class="tb1" id="tb1" runat="server" ></asp:TextBox> </div>
      
            <asp:Button class="btn1" ID="btn1" runat="server" Text="Search"></asp:Button>
            <br />
              <br />
              <br />
             
           <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False">
    <Columns>
        <asp:BoundField DataField="customer_name" HeaderText="Product ID" />
        <asp:BoundField DataField="customer_id" HeaderText="Product Description" />
        <asp:BoundField DataField="customer_state" HeaderText="Product Finish" />
        <asp:BoundField DataField="customer_city" HeaderText="Standard Price" />
    </Columns>
</asp:GridView>

            <hr />
             <asp:Label runat="server" id="lbl2" Text="Label"><h1></h1></asp:Label>
            </div>
    </form>
</body>
</html>
