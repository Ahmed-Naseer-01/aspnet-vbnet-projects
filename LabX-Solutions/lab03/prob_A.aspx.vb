Partial Class lab03_prob_A
    Inherits System.Web.UI.Page
    Private Sub _Default_Load(sender As Object, e As EventArgs) Handles Me.Load
        If Me.IsPostBack = False Then
            Dim currency1 As New ListItem
            currency1.Text = "Euro"
            currency1.Value = "0.85"
            Dim currency2 As New ListItem
            currency2.Text = "Japenese Yen"
            currency2.Value = "110.33"
            Dim currency3 As New ListItem
            currency3.Text = "Canadian Dollars"
            currency3.Value = "1.2"
            SelectCurrency.Items.Add(currency1)
            SelectCurrency.Items.Add(currency2)
            SelectCurrency.Items.Add(currency3)
            GraphImage.Visible = False
        End If
    End Sub
    Protected Sub Convert_ServerClick(ByVal sender As Object, ByVal e As System.EventArgs) Handles Convert.ServerClick
        Dim Amount As Decimal = Val(inputAmount.Value)
        Dim item As ListItem = SelectCurrency.Items(SelectCurrency.SelectedIndex)
        ResultDiv.InnerText = (Amount).ToString() & " US Dollars = " & (Amount *
       Val(SelectCurrency.Value)).ToString() & " " & item.Text
    End Sub
    Protected Sub ShowGraph_ServerClick(ByVal sender As Object, ByVal e As System.EventArgs) Handles ShowGraph.ServerClick
        GraphImage.Src = "Pic" & SelectCurrency.SelectedIndex.ToString() & ".png"
        GraphImage.Alt = "Currency Graph"
        GraphImage.Visible = True
    End Sub
End Class
