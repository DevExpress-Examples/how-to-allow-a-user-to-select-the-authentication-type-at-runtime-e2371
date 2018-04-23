Imports Microsoft.VisualBasic
Imports System
Imports System.Collections.Generic
Imports System.Web.UI
Imports DevExpress.ExpressApp.Templates
Imports DevExpress.ExpressApp.Web
Imports DevExpress.ExpressApp.Web.Templates
Imports DevExpress.ExpressApp.Web.Templates.ActionContainers

Partial Public Class DefaultVertical
    Inherits BaseXafPage
    Private Sub CallbackManager_PreRender(ByVal sender As Object, ByVal e As EventArgs)
        Dim isVisible As Boolean = False
        For Each control As Control In TRP.Controls
            If TypeOf control Is ActionContainerHolder Then
                If (CType(control, ActionContainerHolder)).HasActiveActions() Then
                    isVisible = True
                    Exit For
                End If
            End If
        Next control
        TRP.Visible = isVisible
    End Sub
    Protected Sub Page_Load(ByVal sender As Object, ByVal e As EventArgs)
        AddHandler CallbackManager.PreRender, AddressOf CallbackManager_PreRender
        WebApplication.Instance.CreateControls(Me)
    End Sub
	Protected Overrides Function CreateContextActionsMenu() As ContextActionsMenu
		Return New ContextActionsMenu(Me, "Edit", "RecordEdit", "ObjectsCreation", "ListView", "Reports")
	End Function
	Protected Overrides Function GetDefaultContainer() As IActionContainer
        Return TB.FindActionContainerById("View")
	End Function
	Public Overrides Sub SetStatus(ByVal statusMessages As System.Collections.Generic.ICollection(Of String))
		InfoMessagesPanel.Text = String.Join("<br>", New List(Of String)(statusMessages).ToArray())
    End Sub
    Protected Overrides Sub OnViewChanged(ByVal view As DevExpress.ExpressApp.View)
        ViewSiteControl = VSC
        MyBase.OnViewChanged(view)
    End Sub

End Class
