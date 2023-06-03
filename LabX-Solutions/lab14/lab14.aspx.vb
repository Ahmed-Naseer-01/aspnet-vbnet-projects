Imports System.Data
Imports System.Data.SqlClient
Imports System.Drawing
Imports System.Net.NetworkInformation
Partial Class lab14_lab14

    Inherits System.Web.UI.Page
    Dim dsPubs As New DataSet()
    Dim connectionString As String = "Data Source=AHMED;Initial Catalog=pvfc;Integrated Security=True"
    Dim con As New SqlConnection(connectionString)
    Dim selectSQL As String = "SELECT au_lname, au_fname, au_id , phone, address, city , state , zip, contract FROM Authors"
    Dim cmd As New SqlCommand(selectSQL, con)
    Dim adapter As New SqlDataAdapter(cmd)
    Private Sub FillAuthorList()

        Try
            con.Open()
            ' All the information in transferred with one command.
            adapter.Fill(dsPubs, "authors")
        Catch err As Exception
            lblResults.Text = "Error reading list of names. "
            lblResults.Text &= err.Message
        Finally
            con.Close()
        End Try
        For Each rowAuthor As DataRow In dsPubs.Tables("authors").Rows
            Dim li As New ListItem
            li.Text = rowAuthor("au_fname") & ", " & rowAuthor("au_lname")
            dropDownList.Items.Add(li)
        Next
    End Sub
    Private Sub _Default_Load(sender As Object, e As EventArgs) Handles Me.Load

        If IsPostBack = False Then
            FillAuthorList()
        End If
    End Sub
    Private Sub createNew() Handles createNewBtn.Click, insertNewBtn.Click
        divCreate.Visible = True
    End Sub
    Private Sub create() Handles CreateBtn.Click
        Try
            con.Open()
            ' All the information in transferred with one command.
            adapter.Fill(dsPubs, "authors")
        Catch err As Exception
            lblResults.Text = "Error reading list of names. "
            lblResults.Text &= err.Message
        Finally
            con.Close()
        End Try
        Dim rowNew As DataRow
        rowNew = dsPubs.Tables("Authors").NewRow
        rowNew("au_id") = idTB.Text
        rowNew("au_fname") = firstNameTb.Text
        rowNew("au_lname") = lastNameTb.Text
        rowNew("phone") = phoneTb.Text
        rowNew("address") = addressTb.Text
        rowNew("city") = cityTb.Text
        rowNew("state") = CType(stateTb.Text, String)
        rowNew("zip") = zipTb.Text
        rowNew("contract") = Val(contractCb.Checked)
        dsPubs.Tables("Authors").Rows.Add(rowNew)
        Dim added As Integer = 0
        Try
            ' Create the CommandBuilder.
            Dim cb As New SqlCommandBuilder(adapter)
            ' Retrieve an updated DataAdapter.
            adapter = cb.DataAdapter
            ' Update the database using the DataSet.
            con.Open()
            added = adapter.Update(dsPubs, "Authors")
        Catch Err As Exception
            lblResults.Text = "Error inserting record. "
            lblResults.Text &= Err.Message
        Finally
            con.Close()
        End Try
        ' If the insert succeeded, refresh the author list.
        If added > 0 Then
            FillAuthorList()
        End If
        divCreate.Visible = False
    End Sub
End Class
