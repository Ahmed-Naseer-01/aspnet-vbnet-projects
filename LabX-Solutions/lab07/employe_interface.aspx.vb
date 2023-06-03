
Imports System.Data.SqlClient
Partial Class lab07_employe_interface
    Inherits System.Web.UI.Page
    Dim prdID As Integer
    Dim myConnectionStr As String = "workstation id=pvfcdbs01.mssql.somee.com;packet size=4096;user id=Ahmed01_SQLLogin_2;pwd=3m8wl51ewc;data source=pvfcdbs01.mssql.somee.com;persist security info=False;initial catalog=pvfcdbs01"
    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

        Dim myQuery As String = "SELECT PRODUCT_ID FROM PRODUCT_T WHERE PRODUCT_ID = (SELECT MAX(PRODUCT_ID) FROM PRODUCT_t) "

        Dim MyConn As New SqlConnection(myConnectionStr)
        Dim myCommand As New SqlCommand(myQuery, MyConn)
        Dim reader As SqlDataReader

        Try
            MyConn.Open()
            reader = myCommand.ExecuteReader()

            reader.Read()
            prdID = Convert.ToInt32(reader("PRODUCT_ID"))


            reader.Close()

        Catch ex As Exception
            Label1.Text = "Error occured : "
            Label1.Text &= ex.Message
            Label1.Visible = True
        Finally
            MyConn.Close()

        End Try


    End Sub

    Protected Sub AddProductButton_Click(sender As Object, e As EventArgs) Handles AddProductButton.Click
        ProductContents.Visible = True
    End Sub

    Protected Sub AddToInventoryButton_Click(sender As Object, e As EventArgs) Handles AddToInventoryButton.Click

        prdID = prdID + 1
        Dim insertComm As String = "INSERT INTO PRODUCT_t ( Product_Id , Product_Description , Product_Finish , Standard_Price )"
        insertComm &= "VALUES ( @Product_Id , @Product_Description , @Product_Finish , @Standard_Price)"

        Dim myConn As New SqlConnection(myConnectionStr)
        Dim myComm As New SqlCommand(insertComm, myConn)

        myComm.Parameters.AddWithValue("@Product_id", prdID)
        myComm.Parameters.AddWithValue("@Product_Description", productDescriptionTextBox.Text)
        myComm.Parameters.AddWithValue("@Product_Finish", ProductFinishTextBox.Text)
        myComm.Parameters.AddWithValue("@Standard_Price", StandardPriceTextBox.Text)

        Try
            myConn.Open()
            myComm.ExecuteNonQuery()
            MsgBox("Registration successful!")
        Catch ex As Exception
            MsgBox("An error occurred: " & ex.Message)

        Finally
            myConn.Close()
        End Try

    End Sub
End Class
