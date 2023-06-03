Imports System.Data.SqlClient
Partial Class lab07_loginPage
    Inherits System.Web.UI.Page
    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

    End Sub

    Protected Sub loginButton_Click(sender As Object, e As EventArgs) Handles loginButton.Click
        Dim connStr As String = "workstation id=pvfcdbs01.mssql.somee.com;packet size=4096;user id=Ahmed01_SQLLogin_2;pwd=3m8wl51ewc;data source=pvfcdbs01.mssql.somee.com;persist security info=False;initial catalog=pvfcdbs01"

        Dim varifyCustomerQuery As String = "SELECT Customer_Id   FROM CUSTOMER_t "
        varifyCustomerQuery &= "WHERE CUSTOMER_t.username = '" & emailTextBox.Text & "' AND CUSTOMER_t.passwords= '" & passwordTextBox.Text & "'  "

        Dim varifyEmployee As String = "SELECT EMPLOYEE_ID FROM EMPLOYEE_t "
        varifyEmployee &= "WHERE EMPLOYEE_t.username = '" & emailTextBox.Text & "' AND EMPLOYEE_t.passwords= '" & passwordTextBox.Text & "'"


        Dim Myconnection As New SqlConnection(connStr)
        Dim commandCustomer As New SqlCommand(varifyCustomerQuery, Myconnection)
        Dim commandEmployee As New SqlCommand(varifyEmployee, Myconnection)

        Dim readerCustomerId As SqlDataReader
        Dim readerEmplyeeId As SqlDataReader

        Myconnection.Open()

        readerCustomerId = commandCustomer.ExecuteReader()
        Try





            readerCustomerId.Read()
            Dim customer_id As String = readerCustomerId("Customer_Id")
            If (Not customer_id Is Nothing) Then
                Response.Redirect("customer_interface.aspx?MYCustomer_id=" + customer_id)


            End If
            readerCustomerId.Close()



        Catch ex As Exception
            readerCustomerId.Close()

            readerEmplyeeId = commandEmployee.ExecuteReader()

            Try
                readerEmplyeeId.Read()
                Dim MyEmployee_id As String = readerEmplyeeId("Employee_id")

                If (Not MyEmployee_id Is Nothing) Then
                    Server.Transfer("employe_interface.aspx")


                End If
                readerEmplyeeId.Close()




            Catch qx As Exception
                readerEmplyeeId.Close()

                Try
                    incorrectUserPasswordLabel.Visible = True
                Catch vx As Exception
                    incorrectUserPasswordLabel.Text = "Error occured "
                    incorrectUserPasswordLabel.Text &= vx.Message
                    incorrectUserPasswordLabel.Visible = True
                End Try

            End Try




        Finally

            Myconnection.Close()

        End Try



    End Sub

    Protected Sub Button2_Click(sender As Object, e As EventArgs)
        Response.Redirect("AccountCreation.aspx")
    End Sub
End Class