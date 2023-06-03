Partial Class lab04_prob_01
    Inherits System.Web.UI.Page
    Private Sub _Default_Load(sender As Object, e As EventArgs) Handles Me.Load
        Dim languages() As String = {"C++", "Java", "Kotlin", "C", "Assembly", "VB.NET",
       "Fortran"}
        Dim size As Decimal = languages.Length()
        If Me.IsPostBack = False Then
            For i = 0 To size - 1
                cb1.Items.Add(languages(i))
            Next
        End If
    End Sub
    Private Sub showLanguages() Handles btn1.ServerClick
        label1.Text = "You Choose : <b></br>"
        Dim listItem As ListItem
        For Each listItem In cb1.Items
            If (listItem.Selected) Then
                label1.Text &= "</br>" + listItem.Text
            End If
        Next
    End Sub
End Class
