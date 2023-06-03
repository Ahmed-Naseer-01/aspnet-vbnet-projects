Partial Class lab05_dynamic_button
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        ' Create the text area
        Dim textArea As New HtmlTextArea()
        textArea.ID = "TextArea1"
        textArea.Attributes("rows") = "4"
        textArea.Attributes("cols") = "90"

        ' Create the first button
        Dim button1 As New HtmlButton()
        button1.ID = "Button3"
        button1.InnerText = "Button 1"
        button1.Attributes("type") = "button"
        button1.Attributes("class") = "button-style"
        AddHandler button1.ServerClick, AddressOf Button_Click

        ' Create the second button
        Dim button2 As New HtmlButton()
        button2.ID = "Button2"
        button2.InnerText = "Button 2"
        button2.Attributes("type") = "button"
        button2.Attributes("class") = "button-style"
        AddHandler button2.ServerClick, AddressOf Button_Click

        ' Add the dynamic elements to the placeholder
        PlaceHolder1.Controls.Add(textArea)
        PlaceHolder1.Controls.Add(button1)
        PlaceHolder1.Controls.Add(button2)
    End Sub

    Private Sub Button_Click(ByVal sender As Object, ByVal e As EventArgs)
        ' Handle the click event for both buttons
        Dim button As HtmlButton = DirectCast(sender, HtmlButton)
        Dim textArea As HtmlTextArea = DirectCast(Me.FindControl("TextArea1"), HtmlTextArea)

        If button.ID = "Button3" Then
            ' Handle click for Button1
            textArea.Value += "Button 1 clicked." + vbCrLf
        ElseIf button.ID = "Button2" Then
            ' Handle click for Button2
            textArea.Value += "Button 2 clicked." + vbCrLf
        End If
    End Sub

End Class
