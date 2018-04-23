Imports Microsoft.VisualBasic
Imports System
Imports DevExpress.ExpressApp.Web
Imports DevExpress.ExpressApp.Editors
Imports DevExpress.ExpressApp.Web.Templates

Partial Public Class DialogPage
	Inherits BaseXafPage
    Implements ILookupPopupFrameTemplate
    Private Sub window_PagePreRender(ByVal sender As Object, ByVal e As EventArgs)
        RemoveHandler CType(sender, WebWindow).PagePreRender, AddressOf window_PagePreRender
        If SearchActionContainer.HasActiveActions() And IsSearchEnabled Then
            TableCell1.Style.Add("padding-bottom", "30px")
        End If
    End Sub
    Protected Sub Page_Load(ByVal sender As Object, ByVal e As EventArgs)
        ViewSiteControl = viewSiteControl1
        WebApplication.Instance.CreateControls(Me)
        Dim window As WebWindow = WebWindow.CurrentRequestWindow
        If window IsNot Nothing Then
            Dim clientScript As String = String.Format("var activePopupControl = GetActivePopupControl(window.parent);" & Constants.vbCrLf & _
            "if (activePopupControl != null){{" & Constants.vbCrLf & _
                "var viewImageControl = document.getElementById('{0}');" & Constants.vbCrLf & _
                "if (viewImageControl && viewImageControl.src != ''){{" & Constants.vbCrLf & _
                    "activePopupControl.SetHeaderImageUrl(viewImageControl.src);" & Constants.vbCrLf & _
                "}}" & Constants.vbCrLf & _
                "var viewCaptionControl = document.getElementById('{1}');" & Constants.vbCrLf & _
                "if (viewCaptionControl){{" & Constants.vbCrLf & _
                    "activePopupControl.SetHeaderText(viewCaptionControl.innerText);" & Constants.vbCrLf & _
                "}}" & Constants.vbCrLf & _
            "}}", viewImageControl.Control.ClientID, viewCaptionControl.Control.ClientID)
            window.RegisterStartupScript("UpdatePopupControlHeader", clientScript, True)
            AddHandler window.PagePreRender, AddressOf window_PagePreRender
        End If
    End Sub
    Public Sub New()
    End Sub
#Region "ILookupPopupFrameTemplate Members"

    Public Property IsSearchEnabled() As Boolean Implements ILookupPopupFrameTemplate.IsSearchEnabled
        Get
            Return SearchActionContainer.Visible
        End Get
        Set(ByVal value As Boolean)
            SearchActionContainer.Visible = value
        End Set
    End Property

    Public Sub SetStartSearchString(ByVal searchString As String) Implements ILookupPopupFrameTemplate.SetStartSearchString
    End Sub
    Public Sub FocusFindEditor() Implements ILookupPopupFrameTemplate.FocusFindEditor
    End Sub
#End Region
End Class
