Imports System.Text.RegularExpressions
Partial Class lab15_Validation
    Inherits System.Web.UI.Page
    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

    End Sub

    Protected Sub cmdOK_Click(sender As Object, e As EventArgs) Handles cmdOK.Click
        Dim ErrorMessage As String = "<b>Mistakes found:</b><br />"
        For Each ctrl As BaseValidator In Me.Validators
            If ctrl.IsValid = False Then
                ErrorMessage &= ctrl.ErrorMessage & "<br />"

                Dim ctrlInput As TextBox = CType(Me.FindControl(ctrl.ControlToValidate), TextBox)
                ErrorMessage &= " * Problem is with this input: "
                ErrorMessage &= ctrlInput.Text & "<br />"
            End If
        Next
        lblMessage.Text = ErrorMessage
    End Sub

    Protected Sub btnValidate_Click(sender As Object, e As EventArgs) Handles btnValidate.Click
        Dim validationExpression As String = txtExpression.Text
        Dim testString As String = txtTestString.Text

        Dim regex As New Regex(validationExpression)
        Dim match As Match = regex.Match(testString)

        If match.Success Then
            lblResult.Text = "Valid"
        Else
            lblResult.Text = "Invalid"
        End If
    End Sub

    Protected Sub btnSubmit_Click(sender As Object, e As EventArgs) Handles btnSubmit.Click
        If Page.IsValid Then
            lblResult.Text = "Form submitted successfully!"
        Else
            lblResult.Text = "Form contains errors. Please check the validation messages."
        End If
    End Sub

    Protected Sub cvEmail_ServerValidate(source As Object, args As ServerValidateEventArgs)
        Dim email As String = args.Value.Trim()
        ' Perform custom email validation logic
        If IsValidEmail(email) Then
            args.IsValid = True
        Else
            args.IsValid = False
        End If
    End Sub

    Private Function IsValidEmail(email As String) As Boolean
        ' Use regular expression to validate email format
        Dim emailRegex As New Regex("^[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\.[A-Za-z]{2,}$")
        Return emailRegex.IsMatch(email)
    End Function

    Protected Sub btnCheckEmail_Click(sender As Object, e As EventArgs) Handles btnCheckEmail.Click
        Dim email As String = txtEmail.Text.Trim()
        If IsValidEmail(email) Then
            lblEmailResult.Text = "Valid email"
        Else
            lblEmailResult.Text = "Invalid email"
        End If
    End Sub
End Class
