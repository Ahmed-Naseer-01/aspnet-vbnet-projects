<%@ Application Language="VB" %>
<script runat="server">

    Sub Application_EndRequest(ByVal sender As Object, ByVal e As EventArgs)

        Dim obj1 As New Class1
        Dim result As String = obj1.topSellingProduct()

        If result = "Error" Then
            Response.Write("<hr>")
            Response.Write("<div style='display:inline-block;text-align:center'>" &
                           "&nbsp&nbsp&nbsp" &
                           "<h1 style='display:inline-block;color:maroon;text-align:center;" &
                           "text-decoration:underline overline dotted purple;font-size:70px'>" &
                           "Error Reading the Database.</h1></div>")
        Else
            Response.Write("<hr>")
            Response.Write("<div style='display:inline-block;text-align:center'>" &
                           "<label style='display:inline-block;font-size:50px;text-align:center'>" &
                           "Top Selling Product: &nbsp&nbsp&nbsp" &
                           "<h1 style='display:inline-block;color:maroon;text-align:center;" &
                           "text-decoration:underline overline dotted purple;font-size:70px'>" &
                           result & "</h1></label></div>")
        End If

    End Sub

</script>