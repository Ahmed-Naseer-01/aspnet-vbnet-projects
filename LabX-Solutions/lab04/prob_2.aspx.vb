Imports System.Drawing
Partial Class lab04_prob_2
    Inherits System.Web.UI.Page
    Private Sub _Default_Load(sender As Object, e As EventArgs) Handles Me.Load
        If Me.IsPostBack = False Then
        End If
    End Sub
    Protected Sub createTable() Handles btnCreate.Click
        Dim row, col As Decimal
        row = CType(textBoxRows.Text, Decimal)
        col = CType(textBoxColumns.Text, Decimal)
        For i = 0 To row - 1
            Dim tableRow As New TableRow
            For j = 0 To col - 1
                Dim tableCell As New TableCell
                Dim textLabel As New Label With {
                .Text = "Example Cell (" & (i + 1).ToString() & "," & (j + 1).ToString() &
               ")"
                }
                If checkBoxBorder.Checked Then
                    tableCell.Style.Add("border", "5px solid gray")
                End If
                tableCell.Style.Add("max-width", "80px")
                tableCell.Controls.Add(textLabel)
                tableRow.Controls.Add(tableCell)
            Next
            table.Controls.Add(tableRow)
        Next
    End Sub
End Class