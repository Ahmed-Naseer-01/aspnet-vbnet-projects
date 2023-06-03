Imports System.Data.SqlClient
Imports System.Data
Imports System.Reflection.Emit
Partial Class lab07_customer_interfac
    Inherits System.Web.UI.Page
    Dim myIDproduct As Int32
    Dim MyOrder_id As Integer
    Dim myConnectionStr As String = "workstation id=pvfcdbs01.mssql.somee.com;packet size=4096;user id=Ahmed01_SQLLogin_2;pwd=3m8wl51ewc;data source=pvfcdbs01.mssql.somee.com;persist security info=False;initial catalog=pvfcdbs01"
    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

        myIDproduct = Me.ViewState("productID")
        Dim myQuery As String = "SELECT ORDER_ID FROM ORDER_T WHERE ORDER_ID = (SELECT MAX(ORDER_ID) FROM ORDER_t) "

        Dim MyConn As New SqlConnection(myConnectionStr)
        Dim myCommand As New SqlCommand(myQuery, MyConn)
        Dim reader As SqlDataReader

        Try
            MyConn.Open()
            reader = myCommand.ExecuteReader()

            reader.Read()
            MyOrder_id = Convert.ToInt32(reader("ORDER_ID"))


            reader.Close()
        Catch ex As Exception
            recomendedItem.InnerText = "Error occured : "
            recomendedItem.InnerText &= ex.Message

        Finally
            MyConn.Close()
        End Try

    End Sub

    Protected Sub ProdSearchButton_Click(sender As Object, e As EventArgs) Handles ProdSearchButton.Click
        AddToCartButton.Enabled = True


        Dim connectionStr As String = "Data Source=AHMED;Initial Catalog=pvfc;Integrated Security=True"

        Dim Qury As String = "SELECT  Product_id ,Product_Description, Product_Finish , Standard_Price  "
        Qury &= " FROM PRODUCT_T "
        Qury &= "WHERE Product_Description LIKE " & "'" & SearchTextBox.Text & "%'"



        Dim conn As New SqlConnection(connectionStr)
        Dim command As New SqlCommand(Qury, conn)
        Dim read As SqlDataReader

        Try
            conn.Open()
            read = command.ExecuteReader()

            Dim table As New DataTable()
            table.Columns.Add("Product Description")
            table.Columns.Add("Product Finish")
            table.Columns.Add("Standard Price")
            table.Columns.Add("Product ID")

            While read.Read()
                Dim row As DataRow = table.NewRow()
                row("Product Description") = read("Product_Description")
                row("Product Finish") = read("Product_Finish")
                row("Standard Price") = read("Standard_Price")
                row("Product ID") = read("product_id")
                table.Rows.Add(row)
            End While

            GridView1.DataSource = table
            GridView1.DataBind()

            read.Close()
            conn.Close()



        Catch ex As Exception

            ProductDetailLabel.Text = "We got an error: "
            ProductDetailLabel.Text &= ex.Message
            ProductDetailLabel.Visible = True
        Finally
            conn.Close()
        End Try



    End Sub

    Protected Sub AddToCartButton_Click(sender As Object, e As EventArgs) Handles AddToCartButton.Click
        MyOrder_id += 1
        Dim MCustomer_id As String = Request.QueryString("MYCustomer_id").ToString
        ConfirmOrderDiv.Visible = True

        Dim InsertQuery As String = "INSERT INTO Order_t ( Order_Id, Customer_Id , Order_Date )"
        InsertQuery &= "VALUES ( @Order_Id , @Customer_Id , @Order_Date)"

        Dim myConn As New SqlConnection(myConnectionStr)
        Dim myComm As New SqlCommand(InsertQuery, myConn)

        myComm.Parameters.AddWithValue("@Order_id", MyOrder_id)
        myComm.Parameters.AddWithValue("@Customer_id", MCustomer_id)
        myComm.Parameters.AddWithValue("@Order_Date", Date.Now())

        Try
            myConn.Open()
            myComm.ExecuteNonQuery()
            MsgBox("order successful!")
            prodDetails.Visible = True


        Catch ex As Exception
            MsgBox("An error occurred: " & ex.Message)

        Finally
            myConn.Close()
        End Try

    End Sub

    Protected Sub confirmButton_Click(sender As Object, e As EventArgs) Handles confirmButton.Click


        Dim InsertQuery As String = "INSERT INTO Order_line_t ( Order_Id, Product_Id , Ordered_Quantity)"
        InsertQuery &= "VALUES ( @Order_Id , @Product_Id  , @Ordered_Quantity)"

        Dim myConn As New SqlConnection(myConnectionStr)
        Dim myComm As New SqlCommand(InsertQuery, myConn)

        myComm.Parameters.AddWithValue("@Order_id", MyOrder_id)
        myComm.Parameters.AddWithValue("@Product_Id ", myIDproduct)
        myComm.Parameters.AddWithValue("@Ordered_Quantity ", Convert.ToInt32(QuantityTextBox.Text))

        Try
            myConn.Open()
            myComm.ExecuteNonQuery()
            MsgBox("order confirmed!")

        Catch ex As Exception
            MsgBox("An error occurred: " & ex.Message)

        Finally
            myConn.Close()
        End Try

    End Sub

    Private Sub customer_interface_PreRender(sender As Object, e As EventArgs) Handles Me.PreRender
        Me.ViewState("productID") = myIDproduct
    End Sub
End Class