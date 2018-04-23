Imports Microsoft.VisualBasic
Imports System
Imports System.Collections.Generic
Imports System.Web.UI
Imports DevExpress.ExpressApp.Templates
Imports DevExpress.ExpressApp.Web
Imports DevExpress.ExpressApp.Web.Templates
Imports DevExpress.ExpressApp.Web.Templates.ActionContainers

Partial Public Class [Default]
    Inherits BaseXafPage
    Protected Sub Page_Load(ByVal sender As Object, ByVal e As EventArgs)
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