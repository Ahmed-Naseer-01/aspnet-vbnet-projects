Imports System.Data
Imports System.Data.SqlClient
Partial Class lab12_lab12
    Inherits System.Web.UI.Page

    Private Sub lab_12_Load(sender As Object, e As EventArgs) Handles Me.Load
        If IsPostBack = False Then
            Dim SqlConnection As New SqlConnection
            SqlConnection.ConnectionString = "Data Source=AHMED;Initial Catalog=pvfc;Integrated Security=True"
            Dim sqllistItem As New SqlCommand
            sqllistItem.Connection = SqlConnection
            sqllistItem.CommandText = "select distinct Customer_city from customer_t where customer_city is not null;"
            SqlConnection.Open()
            Dim dr As SqlDataReader
            dr = sqllistItem.ExecuteReader()
            While dr.Read()
                Dim listItem As New ListItem
                listItem.Text = dr("Customer_city")
                DropDownList.Items.Add(listItem)
            End While
            SqlConnection.Close()
        End If
        DropDownList.Style.Add("font-size", "20px")
    End Sub

    Protected Sub radioButtonList_SelectedIndexChanged(sender As Object, e As EventArgs) Handles radioButtonList.SelectedIndexChanged
        Dim SqlConnection As New SqlConnection
        SqlConnection.ConnectionString = "Data Source=AHMED;Initial Catalog=pvfc;Integrated Security=True"
        Dim maxPriceSql As New SqlCommand
        maxPriceSql.Connection = SqlConnection
        maxPriceSql.CommandText = "select product_description from product_t where standard_price =(select max(standard_price) from PRODUCT_t);"
        Dim minPriceSql As New SqlCommand
        minPriceSql.Connection = SqlConnection
        minPriceSql.CommandText = "select product_description from product_t where standard_price =(select min(standard_price) from PRODUCT_t);"
        Dim flagMax As String
        flagMax = radioButtonList.SelectedValue.ToString
        If flagMax = "Maximum" Then
            SqlConnection.Open()
            Dim dr As SqlDataReader
            dr = maxPriceSql.ExecuteReader()
            dr.Read()
            TextBox1.Text = dr("product_description")
            SqlConnection.Close()
        ElseIf flagMax = "Minimum" Then
            SqlConnection.Open()
            Dim dr As SqlDataReader
            dr = minPriceSql.ExecuteReader()
            dr.Read()
            TextBox1.Text = dr("product_description")
            SqlConnection.Close()
        Else
            TextBox1.Text = ""
        End If
        TextBox1.Style.Add("font-size", "20px")
    End Sub

    Protected Sub DropDownList_SelectedIndexChanged(sender As Object, e As EventArgs) Handles DropDownList.SelectedIndexChanged
        Dim city As String
        city = DropDownList.SelectedValue.ToString
        Dim SqlConnection As New SqlConnection
        SqlConnection.ConnectionString = "Data Source=AHMED;Initial Catalog=pvfc;Integrated Security=True"
        Dim prodCostSql As New SqlCommand
        prodCostSql.Connection = SqlConnection
        prodCostSql.CommandText = "select sum(tt) as TotalCost from (select (Ordered_Quantity*Standard_Price) as tt from customer_t,order_t ,order_line_t,product_t "
        prodCostSql.CommandText &= " where customer_t.Customer_Id = ORDER_t.customer_id and order_t.order_Id = ORDER_line_t.order_id and "
        prodCostSql.CommandText &= " order_line_t.product_Id = product_t.product_id and Customer_City = '" & city & "' )as tt;"
        SqlConnection.Open()
        Dim dr As SqlDataReader
        dr = prodCostSql.ExecuteReader()
        dr.Read()
        Dim str As String
        str = dr("TotalCost").ToString
        If str = "" Then
            TextBox2.Text = "No Orders"
        Else
            TextBox2.Text = str
        End If
        TextBox2.Style.Add("font-size", "10px")
        SqlConnection.Close()
    End Sub
End Class

