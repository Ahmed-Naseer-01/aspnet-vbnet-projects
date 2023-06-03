Imports System.Data
Imports System.Data.SqlClient
Partial Class lab11_lab11
    Inherits System.Web.UI.Page
    Private Sub FillAuthorList()
        Dim connectionString As String
        connectionString = "workstation id=pvfcdbs01.mssql.somee.com;packet size=4096;user id=Ahmed01_SQLLogin_2;pwd=3m8wl51ewc;data source=pvfcdbs01.mssql.somee.com;persist security info=False;initial catalog=pvfcdbs01"
        ' Define ADO.NET objects.
        Dim selectSQL As String
        selectSQL = "SELECT au_lname, au_fname, au_id FROM Authors"
        Dim con As New SqlConnection(connectionString)
        Dim cmd As New SqlCommand(selectSQL, con)
        Dim adapter As New SqlDataAdapter(cmd)
        Dim dsPubs As New DataSet()
        ' Try to open the database and read information.
        Try
            con.Open()
            ' All the information is transferred with one command.
            adapter.Fill(dsPubs, "authors")
            cmd.CommandText = "SELECT au_id, title_id FROM titleauthor"
            adapter.Fill(dsPubs, "titleauthor")
            cmd.CommandText = "SELECT title_id, title FROM titles"
            adapter.Fill(dsPubs, "titles")
        Catch err As Exception
            lblResults.Text = "Error reading the list of names. "
            lblResults.Text &= err.Message
        Finally
            con.Close()
        End Try

        Dim Titles_TitleAuthor As New DataRelation("Titles_TitleAuthor", dsPubs.Tables("titles").Columns("title_id"), dsPubs.Tables("titleauthor").Columns("title_id"))
        Dim Authors_TitleAuthor As New DataRelation("Authors_TitleAuthor", dsPubs.Tables("authors").Columns("au_id"), dsPubs.Tables("titleauthor").Columns("au_id"))

        dsPubs.Relations.Add(Titles_TitleAuthor)
        dsPubs.Relations.Add(Authors_TitleAuthor)

        For Each rowAuthor As DataRow In dsPubs.Tables("authors").Rows
            lstAuthor.Text &= "<br /><b>" & rowAuthor("au_fname")
            lstAuthor.Text &= " " & rowAuthor("au_lname") & "</b><br />"

            For Each rowTitleAuthor As DataRow In rowAuthor.GetChildRows(Authors_TitleAuthor)
                For Each rowTitle As DataRow In rowTitleAuthor.GetParentRows(Titles_TitleAuthor)
                    lstAuthor.Text &= "&nbsp;&nbsp;"
                    lstAuthor.Text &= rowTitle("title") & "<br />"
                Next
            Next
        Next
    End Sub

    Private Sub _Default_Load(sender As Object, e As EventArgs) Handles Me.Load
        FillAuthorList()
    End Sub
End Class

