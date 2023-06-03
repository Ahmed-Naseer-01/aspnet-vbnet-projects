
Imports System.Data
Imports System.Data.Common
Imports System.Data.SqlClient
Partial Class lab06_Search_customer
    Inherits System.Web.UI.Page
    Private Sub page2_Load(sender As Object, e As EventArgs) Handles Me.Load



    End Sub

    Protected Sub btnclick() Handles btn1.Click

        Dim myConnection As New SqlConnection
        myConnection.ConnectionString = "workstation id=pvfcdbs01.mssql.somee.com;packet size=4096;user id=Ahmed01_SQLLogin_2;pwd=3m8wl51ewc;data source=pvfcdbs01.mssql.somee.com;persist security info=False;initial catalog=pvfcdbs01"

        Dim sqlCommand As New SqlCommand
        sqlCommand.Connection = myConnection
        sqlCommand.CommandText = "Select * from customer_t where customer_name like '%" & tb1.Text & "%'"

        Try
            myConnection.Open()
            Dim ds As New DataSet()
            Dim adapter As New SqlDataAdapter(sqlCommand)
            adapter.Fill(ds)
            GridView1.DataSource = ds
            GridView1.DataBind()
            myConnection.Close()

        Catch ex As Exception
            lbl2.Text = "Product Not Found"
        End Try

    End Sub




End Class
