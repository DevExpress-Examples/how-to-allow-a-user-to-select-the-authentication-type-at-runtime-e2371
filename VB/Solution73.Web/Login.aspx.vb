Imports Microsoft.VisualBasic
Imports System
Imports System.Web

Imports DevExpress.ExpressApp
Imports DevExpress.ExpressApp.Templates
Imports DevExpress.ExpressApp.Web.TestScripts
Imports DevExpress.ExpressApp.Web
Imports System.Web.UI
Imports DevExpress.ExpressApp.Utils
Imports System.Collections.Generic

Partial Public Class LoginPage
	Inherits System.Web.UI.Page
	Implements IWindowTemplate, IViewSiteTemplate, ISupportViewControlAdding
	Protected Overrides Sub InitializeCulture()
		MyBase.InitializeCulture()
		WebApplication.Instance.InitializeCulture()
	End Sub
	Protected Sub Page_Load(ByVal sender As Object, ByVal e As EventArgs)
		WebApplication.Instance.CreateLogonControls(Me)
	End Sub
	#Region "IFrameTemplate Members"
	Private isSizeable_Renamed As Boolean
	Public ReadOnly Property DefaultContainer() As IActionContainer Implements DevExpress.ExpressApp.Templates.IFrameTemplate.DefaultContainer
		Get
			Return Nothing
		End Get
	End Property
	Public Function GetContainers() As ICollection(Of IActionContainer) Implements DevExpress.ExpressApp.Templates.IFrameTemplate.GetContainers
		Return PopupActions.ActionContainers
	End Function
	Public Sub SetView(ByVal view As DevExpress.ExpressApp.View) Implements DevExpress.ExpressApp.Templates.IFrameTemplate.SetView
		Me.ViewSite.Controls.Clear()
		If view IsNot Nothing Then
			view.CreateControls()
			RaiseEvent ViewControlAdding(Me, EventArgs.Empty)
			ViewSite.Controls.Add(CType(view.Control, Control))
			ViewCaptionLabel.Text = view.Caption
			Header.Title = view.Caption
			Dim imageInfo As ImageInfo = ImageLoader.Instance.GetLargeImageInfo(view.Model.ModelClass.ImageName)
			If imageInfo.IsEmpty Then
				ViewImage.Visible = False
			Else
				ViewImage.ImageUrl = imageInfo.ImageUrl
			End If
		End If
	End Sub
	Public Property IsSizeable() As Boolean Implements IWindowTemplate.IsSizeable
		Get
			Return isSizeable_Renamed
		End Get
		Set(ByVal value As Boolean)
			isSizeable_Renamed = value
		End Set
	End Property
	Public ReadOnly Property ViewSiteControl() As Object Implements IViewSiteTemplate.ViewSiteControl
		Get
			Return ViewSite
		End Get
	End Property
	Public Sub SetCaption(ByVal caption As String) Implements IWindowTemplate.SetCaption
	End Sub
	Public Sub SetStatus(ByVal statusMessages As System.Collections.Generic.ICollection(Of String)) Implements IWindowTemplate.SetStatus
	End Sub

	Public Event ViewControlAdding As EventHandler Implements ISupportViewControlAdding.ViewControlAdding
	#End Region
End Class
