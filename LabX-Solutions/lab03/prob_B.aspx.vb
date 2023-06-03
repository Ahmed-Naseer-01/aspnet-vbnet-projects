Partial Class lab03_prob_B
    Inherits System.Web.UI.Page
    Private Sub ImgButton_ServerClick(ByVal sender As Object, ByVal e As ImageClickEventArgs) Handles ImgButton.ServerClick
        If e.Y < 101 And e.Y > 1 And e.X > 0 And e.X < 100 Then
            result.InnerText = "You clicked RED Region."
            result.Style.Add("color", "red")
        ElseIf e.Y < 103 And e.Y > 1 And e.X > 100 And e.X < 197 Then
            result.InnerText = "You clicked BLUE Region."
            result.Style.Add("color", "blue")
        ElseIf e.Y > 101 And e.X < 101 Then
            result.InnerText = "You clicked Green Region."
            result.Style.Add("color", "green")
        ElseIf e.Y > 101 And e.X < 197 Then
            result.InnerText = "You clicked Yellow Region."
            result.Style.Add("color", "yellow")
        End If
    End Sub
End Class