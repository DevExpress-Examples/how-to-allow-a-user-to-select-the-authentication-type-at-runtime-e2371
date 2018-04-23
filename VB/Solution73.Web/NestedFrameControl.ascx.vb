Imports Microsoft.VisualBasic
Imports System
Imports System.Data
Imports System.Configuration
Imports System.Collections
Imports System.Web
Imports System.Web.Security
Imports System.Web.UI
Imports System.Web.UI.WebControls
Imports System.Web.UI.WebControls.WebParts
Imports System.Web.UI.HtmlControls
Imports DevExpress.ExpressApp.Templates
Imports DevExpress.ExpressApp.Utils
Imports DevExpress.Persistent.Base
Imports System.Collections.Generic
Imports DevExpress.ExpressApp
Imports DevExpress.ExpressApp.Web.Layout

Partial Public Class NestedFrameControl
	Inherits System.Web.UI.UserControl
	Implements IFrameTemplate
	Private contextMenu As ContextActionsMenu
	Protected Overrides Sub OnPreRender(ByVal e As EventArgs)
		MyBase.OnPreRender(e)
	End Sub
	Protected Overrides Sub OnLoad(ByVal e As EventArgs)
		MyBase.OnLoad(e)
	End Sub
	Protected Overrides Sub OnInit(ByVal e As EventArgs)
		MyBase.OnInit(e)
	End Sub
	Public Sub New()
		contextMenu = New ContextActionsMenu(Me, "Edit", "RecordEdit", "ListView")
	End Sub
	Public Overrides Sub Dispose()
		For Each container As IActionContainer In GetContainers()
			container.Dispose()
		Next container
		ToolBar.Dispose()
		If contextMenu IsNot Nothing Then
			contextMenu.Dispose()
			contextMenu = Nothing
		End If
		MyBase.Dispose()
	End Sub
	#Region "IFrameTemplate Members"
	Public ReadOnly Property DefaultContainer() As IActionContainer Implements IFrameTemplate.DefaultContainer
'INSTANT VB NOTE: Embedded comments are not maintained by Instant VB
'ORIGINAL LINE: get { return /*ViewContainer*/ null; }
		Get
			Return Nothing
		End Get
	End Property
	Public Function GetContainers() As ICollection(Of IActionContainer) Implements IFrameTemplate.GetContainers
		Dim result As New List(Of IActionContainer)()
		If contextMenu IsNot Nothing Then
			result.AddRange(contextMenu.Containers)
		End If
		result.AddRange(ToolBar.ActionContainers)
		Return result
	End Function
	Public Sub SetView(ByVal view As DevExpress.ExpressApp.View) Implements IFrameTemplate.SetView
		ViewSite.Controls.Clear()
		If view IsNot Nothing Then
			contextMenu.CreateControls(view)
			view.CreateControls()
			ViewSite.Controls.Add(CType(view.Control, Control))
			ViewCaptionLabel.Text = view.Caption
			Dim imageInfo As ImageInfo = ImageLoader.Instance.GetImageInfo(view.Model.ModelClass.ImageName)
			If imageInfo.IsEmpty Then
				ViewImage.Visible = False
				ViewImage.ImageUrl = Nothing
			Else
				ViewImage.ImageUrl = imageInfo.ImageUrl
			End If
		End If
	End Sub
	#End Region
End Class
