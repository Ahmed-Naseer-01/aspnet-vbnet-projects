Imports System.Data.SqlClient
Imports System.Reflection.Emit
Partial Class lab07_AccountCreation
    Inherits System.Web.UI.Page
    Dim CustID As Integer
    Dim myConnectionStr As String = "workstation id=pvfcdbs01.mssql.somee.com;packet size=4096;user id=Ahmed01_SQLLogin_2;pwd=3m8wl51ewc;data source=pvfcdbs01.mssql.somee.com;persist security info=False;initial catalog=pvfcdbs01"
    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        Dim myQuery As String = "SELECT CUSTOMER_ID FROM CUSTOMER_T WHERE CUSTOMER_ID = (SELECT MAX(CUSTOMER_ID) FROM CUSTOMER_t) "

        Dim MyConn As New SqlConnection(myConnectionStr)
        Dim myCommand As New SqlCommand(myQuery, MyConn)
        Dim reader As SqlDataReader

        Try
            MyConn.Open()
            reader = myCommand.ExecuteReader()

            reader.Read()
            CustID = Convert.ToInt32(reader("CUSTOMER_ID"))
            reader.Close()
        Catch ex As Exception
            Label1.Text = "Error occured : "
            Label1.Text &= ex.Message
            Label1.Visible = True
        Finally
            MyConn.Close()

        End Try
    End Sub

    Protected Sub CreateAccountButton_Click(sender As Object, e As EventArgs) Handles CreateAccountButton.Click

        CustID += 1

        Dim insertComm As String = "INSERT INTO CUSTOMER_t ( CUSTOMER_Id , Customer_Name , Customer_Address, Customer_City ,Customer_State ,Postal_Code , username ,passwords)"
        insertComm &= "VALUES ( @CUSTOMER_Id , @Customer_Name ,@Customer_Address , @Customer_City , @Customer_State ,@Postal_Code  ,@username , @passwords )"

        Dim myConn As New SqlConnection(myConnectionStr)
        Dim myComm As New SqlCommand(insertComm, myConn)

        myComm.Parameters.AddWithValue("@CUSTOMER_Id", CustID)
        myComm.Parameters.AddWithValue("@Customer_Name", CustomerNameTextBox.Text)
        myComm.Parameters.AddWithValue("@Customer_Address ", CustomerAddressTextBox.Text)
        myComm.Parameters.AddWithValue("@Customer_City ", CustomerCityTextBox.Text)
        myComm.Parameters.AddWithValue("@Customer_State", CustomerSateTextBox.Text)
        myComm.Parameters.AddWithValue("@Postal_Code ", CustomerPostalCodeTextBox.Text)
        myComm.Parameters.AddWithValue("@username", UsernameTextBox.Text)
        myComm.Parameters.AddWithValue("@passwords ", PaswordTextBox.Text)

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
