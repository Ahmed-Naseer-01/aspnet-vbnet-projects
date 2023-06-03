Partial Class lab02_lab02
    Inherits System.Web.UI.Page
    Protected Sub Page_Load(sender As Object, e As EventArgs) Handles Me.Load
        load_event.InnerHtml &= "load called<br />"
    End Sub
    Private Sub _Default_Disposed(sender As Object, e As EventArgs) Handles Me.Disposed
        load_event.InnerHtml &= "disposed event called<br />"
    End Sub
    Private Sub _Default_Init(sender As Object, e As EventArgs) Handles Me.Init
        load_event.InnerHtml &= "init event called<br />"
    End Sub
    Private Sub _Default_LoadComplete(sender As Object, e As EventArgs) Handles Me.LoadComplete
        load_event.InnerHtml &= "LoadComplete event called<br />"
    End Sub
    Private Sub _Default_PreInit(sender As Object, e As EventArgs) Handles Me.PreInit
        load_event.InnerHtml &= "PreInit event called<br />"
    End Sub
    Private Sub _Default_PreLoad(sender As Object, e As EventArgs) Handles Me.PreLoad
        load_event.InnerHtml &= "PreLoad event called<br />"
    End Sub
    Private Sub _Default_PreRender(sender As Object, e As EventArgs) Handles Me.PreRender
        load_event.InnerHtml &= "PreRender event called<br />"
    End Sub
    Private Sub _Default_PreRenderComplete(sender As Object, e As EventArgs) Handles Me.PreRenderComplete
        load_event.InnerHtml &= "PreRenderComplete event called<br />"
    End Sub
    Private Sub _Default_SaveStateComplete(sender As Object, e As EventArgs) Handles Me.SaveStateComplete
        load_event.InnerHtml &= "SaveStateComplete event called<br />"
    End Sub
    Private Sub _Default_Unload(sender As Object, e As EventArgs) Handles Me.Unload
        load_event.InnerHtml &= "Unload event called<br />"
    End Sub
End Class
