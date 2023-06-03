Imports System.Data.Common
Imports System.Data.SqlClient
Imports System.Reflection.Emit
Partial Class lab08_customer_interface
    Inherits System.Web.UI.Page
    Dim MyProductId As Integer
    Dim MyOrder_id As Integer
    Dim MCustomer_id As String
    Dim myConnectionStr As String = "workstation id=pvfcdbs01.mssql.somee.com;packet size=4096;user id=Ahmed01_SQLLogin_2;pwd=3m8wl51ewc;data source=pvfcdbs01.mssql.somee.com;persist security info=False;initial catalog=pvfcdbs01"
    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        MyProductId = Me.ViewState("productID")
        MyOrder_id = Me.ViewState("Order_id")
        AlsoLikeLabel.Text = ""


        'adding items in dropDown menu
        If Not IsPostBack Then
            Dim listQuery As String = "SELECT PRODUCT_DESCRIPTION , PRODUCT_ID FROM PRODUCT_t"

            Dim myConnection As New SqlConnection(myConnectionStr)
            Dim myCommand As New SqlCommand(listQuery, myConnection)
            Dim reader As SqlDataReader

            Try

                myConnection.Open()
                reader = myCommand.ExecuteReader()

                While reader.Read()
                    ProductSelectDropDownList.Items.Add(reader("PRODUCT_DESCRIPTION"))
                End While



            Catch ex As Exception

            End Try

            getOrderId()
            MyOrder_id += 1
        End If







    End Sub

    Protected Sub ProductSelectDropDownList_SelectedIndexChanged(sender As Object, e As EventArgs) Handles ProductSelectDropDownList.SelectedIndexChanged
        MCustomer_id = Request.QueryString("MYCustomer_id").ToString()

        Dim Qury As String = "SELECT  Product_id ,Product_Description, Product_Finish , Standard_Price  "
        Qury &= " FROM PRODUCT_T "
        Qury &= "WHERE Product_Description = '" & ProductSelectDropDownList.SelectedItem.ToString & "'"



        Dim conn As New SqlConnection(myConnectionStr)
        Dim command As New SqlCommand(Qury, conn)
        Dim read As SqlDataReader

        Try
            conn.Open()
            read = command.ExecuteReader()

            read.Read()


            productDetailLabel.Text = read("Product_Description") & " | " & read("Product_Finish")
            productDetailLabel.Text &= " | " & read("Standard_Price") & " | " & read("product_id")
            productDetailLabel.Visible = True
            MyProductId = read("product_id")

            read.Close()



        Catch ex As Exception


        Finally
            conn.Close()
        End Try


        insertHistory()
        SimilarSearched_Products()
        BuyButton.Enabled = True
        QuantityLabel.Visible = True
        QuantityTextBox.Visible = True


    End Sub

    Protected Sub insertHistory()

        Dim InsertQuery As String = "INSERT INTO Searched_product (Customer_id , Product_Id ) "
        InsertQuery &= "VALUES (@Customer_id , @Product_Id)"




        Dim conn As New SqlConnection(myConnectionStr)
        Dim MyComm As New SqlCommand(InsertQuery, conn)

        MyComm.Parameters.AddWithValue("@Customer_id", MCustomer_id)
        MyComm.Parameters.AddWithValue("@Product_Id", MyProductId)

        Try
            conn.Open()
            MyComm.ExecuteNonQuery()

        Catch ex As Exception
            MsgBox("An error occurred: " & ex.Message)

        Finally
            conn.Close()

        End Try


    End Sub
    Protected Sub SimilarSearched_Products()

        Dim AlsoLikeQury As String = "SELECT DISTINCT top 5 PRODUCT_DESCRIPTION , PRODUCT_FINISH FROM PRODUCT_t , Searched_product"
        AlsoLikeQury &= " WHERE PRODUCT_t .Product_Id  = Searched_product . Product_Id   "
        AlsoLikeQury &= " AND Searched_product.Product_Id IN (SELECT DISTINCT PRODUCT_ID FROM Searched_product "
        AlsoLikeQury &= " WHERE CUSTOMER_ID IN (SELECT CUSTOMER_ID FROM Searched_product "
        AlsoLikeQury &= " WHERE Product_Id ='" & MyProductId & "' GROUP BY Customer_id )) "

        Dim conn As New SqlConnection(myConnectionStr)
        Dim myCommand As New SqlCommand(AlsoLikeQury, conn)
        Dim productReader As SqlDataReader

        Try
            conn.Open()

            productReader = myCommand.ExecuteReader()

            While productReader.Read()
                'to display information

                AlsoLikeLabel.Text &= productReader("PRODUCT_DESCRIPTION") & " | " & productReader("PRODUCT_FINISH") & "<br/>"
                AlsoLikeLabel.Visible = True


            End While



            productReader.Close()




        Catch ex As Exception
            AlsoLikeProductDiv.InnerText = "Error Occured " & ex.Message


        Finally
            conn.Close()

        End Try

    End Sub

    Private Sub customer_interface_PreRender(sender As Object, e As EventArgs) Handles Me.PreRender
        Me.ViewState("productID") = MyProductId
        Me.ViewState("Order_id") = MyOrder_id
        'Me.ViewState("AlsoLikeData") = AlsoLikeLabel.Text


    End Sub

    Protected Sub BuyButton_Click(sender As Object, e As EventArgs) Handles BuyButton.Click

        addToOrder_t()
        addToOrder_line_t()
        SimilarOrderedProducts()

    End Sub




    Protected Sub getOrderId()




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
            AlsoLikeProductDiv.InnerText = "Error occured : "
            AlsoLikeProductDiv.InnerText &= ex.Message

        Finally
            MyConn.Close()
        End Try

    End Sub


    'need to do
    Protected Sub addToOrder_t()


        Dim MCustomer_id As String = Request.QueryString("MYCustomer_id").ToString

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



        Catch ex As Exception


        Finally
            myConn.Close()
        End Try
    End Sub


    'need to do
    Protected Sub addToOrder_line_t()
        Dim InsertQuery As String = "INSERT INTO Order_line_t ( Order_Id, Product_Id , Ordered_Quantity)"
        InsertQuery &= "VALUES ( @Order_Id , @Product_Id  , @Ordered_Quantity)"

        Dim myConn As New SqlConnection(myConnectionStr)
        Dim myComm As New SqlCommand(InsertQuery, myConn)

        myComm.Parameters.AddWithValue("@Order_id", MyOrder_id)
        myComm.Parameters.AddWithValue("@Product_Id ", MyProductId)
        myComm.Parameters.AddWithValue("@Ordered_Quantity ", Convert.ToInt32(QuantityTextBox.Text))

        Try
            myConn.Open()
            myComm.ExecuteNonQuery()
            MsgBox("order confirmed!")

        Catch ex As Exception


        Finally
            myConn.Close()
        End Try
    End Sub



    Protected Sub SimilarOrderedProducts()


        Dim AlsoLikeQury As String = "SELECT  DISTINCT top 5 PRODUCT_DESCRIPTION , PRODUCT_FINISH FROM PRODUCT_t , Order_line_t "
        AlsoLikeQury &= " WHERE PRODUCT_T.Product_Id  = Order_line_t .Product_Id  "
        AlsoLikeQury &= " AND ORDER_LINE_T.Product_Id  IN (SELECT DISTINCT PRODUCT_ID FROM ORDER_LINE_T "
        AlsoLikeQury &= " WHERE ORDER_ID IN (SELECT Order_Id FROM Order_line_t "
        AlsoLikeQury &= " WHERE Product_Id = '" & MyProductId & "' GROUP BY Order_Id)) "

        Dim MyConnection As New SqlConnection(myConnectionStr)
        Dim myCommand As New SqlCommand(AlsoLikeQury, MyConnection)
        Dim productReader As SqlDataReader

        Try
            MyConnection.Open()

            productReader = myCommand.ExecuteReader()
            Dim myLabel As New Label()


            While productReader.Read()

                AlsoLikeLabel.Text &= productReader("PRODUCT_DESCRIPTION").ToString() & " | " & productReader("PRODUCT_FINISH").ToString() & "<br />"
                AlsoLikeLabel.Visible = True



            End While



            productReader.Close()




        Catch ex As Exception
            AlsoLikeProductDiv.InnerText = "Error Occured " & ex.Message


        Finally
            MyConnection.Close()

        End Try
    End Sub
End Class