<%@ Page Language="C#" AutoEventWireup="true" Inherits="DefaultVertical" EnableViewState="false" validateRequest="false" Codebehind="DefaultVertical.aspx.cs" %>
<%@ Register Assembly="DevExpress.Web.v10.1" Namespace="DevExpress.Web.ASPxRoundPanel" TagPrefix="dxrp" %>
<%@ Register Assembly="DevExpress.Web.v10.1" Namespace="DevExpress.Web.ASPxPanel" TagPrefix="dxrp" %>
<%@ Register Assembly="DevExpress.ExpressApp.Web.v10.1" Namespace="DevExpress.ExpressApp.Web.Templates.ActionContainers" TagPrefix="cc2" %>
<%@ Register Assembly="DevExpress.ExpressApp.Web.v10.1" Namespace="DevExpress.ExpressApp.Web.Controls" TagPrefix="cc4" %>
<%@ Register Assembly="DevExpress.ExpressApp.Web.v10.1" Namespace="DevExpress.ExpressApp.Web.Templates.Controls" TagPrefix="tc" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
	<title>Main Page</title>
	<meta http-equiv="Expires" content="0" />
</head>
<body onload="OnLoad()" class="VerticalTemplate">
    <div id="PageContent" class="PageContent">
    <script src="MoveFooter.js" type="text/javascript"></script>
	<cc4:ProgressControl ID="ProgressControl" runat="server" ImageName="~/Images/Progress.gif" CssClass="Progress" Text="" />
	<form id="form1" runat="server">
        <table cellpadding="0" cellspacing="0" border="0" class="Top" width="100%">
            <tr>
                <td class="Logo">
                    <asp:HyperLink runat="server" NavigateUrl="~/" ID="LogoLink">
                        <asp:Image ID="LogoImage" BorderWidth="0px" runat="server" />
                    </asp:HyperLink>
                </td>
                <td class="Security">
                    <cc2:ActionContainerHolder runat="server" ID="SecurityActionContainer" CssClass="Security" Categories="Security" ContainerStyle="Links" />
                </td>
            </tr>
        </table>
        <table border="0" cellpadding="0" cellspacing="0" width="100%" style="padding-bottom: 5px;">
            <tr class="Content">
	            <td class="Content WithPaddings">
		            <table border="0" cellpadding="0" cellspacing="0" class="Search" width="100%">
			            <tr>
			                <td class="left" align="left"><cc2:ActionContainerHolder ID="VerticalNewActionContainer" runat="server" Categories="RootObjectsCreation" ContainerStyle="Links" /></td>
				            <td class="right" align="right"><cc2:ActionContainerHolder  ID="SearchActionContainer" runat="server" Categories="Search;FullTextSearch" ContainerStyle="Buttons" /></td>
			            </tr>
		            </table>
                </td>
            </tr>
        </table>
		<table border="0" cellpadding="0" cellspacing="0" class="Main" width="100%">
			<tr>
			    <td class="Left" id="left_panel">
			        <cc2:NavigationActionContainer ID="NavigationBarActionContainer" runat="server" CssClass="xafNavigationBarActionContainer" ContainerId="ViewsNavigation" AutoCollapse="True"/>
                    <dxrp:ASPxRoundPanel ID="ToolsRoundPanel" runat="server" Width="100%" CssClass="ToolsActionContainerPanel" HeaderText="Tools">
                     <PanelCollection>
                         <dxrp:PanelContent ID="PanelContent1" runat="server">
                               <cc2:ActionContainerHolder id="VerticalToolsActionContainer" runat="server" Categories="Tools" Orientation="Vertical" ContainerStyle="Links" ShowSeparators="False"/>
                         </dxrp:PanelContent>
                     </PanelCollection>
                    </dxrp:ASPxRoundPanel>
                </td>
				<td class="Right">
				    <dxrp:ASPxRoundPanel ID="ASPxRoundPanel1" runat="server" Width="100%" HeaderText="">
				        <HeaderTemplate>
                            <cc2:NavigationHistoryActionContainer ID="ViewsHistoryNavigationContainer" runat="server" CssClass="NavigationHistoryLinks" ContainerId="ViewsHistoryNavigation" Delimiter=" / "/>				    
				        </HeaderTemplate>
                    <PanelCollection>
                        <dxrp:PanelContent ID="PanelContent2" runat="server">
		            <table border="0" cellpadding="0" cellspacing="0" class="MainContent" width="100%">
			            <tr class="Content">
				            <td class="Content">
		                        <table cellpadding="0" cellspacing="0" border="0">
			                        <tr><td class="ViewImage">
					                        <asp:Image ID="ViewImage" runat="server" /></td>
				                        <td class="ViewCaption">
					                        <h1><asp:Label ID="ViewCaptionLabel" runat="server" Text="Contact list"></asp:Label></h1>
				                        </td>
			                        </tr>
		                        </table>
		                        <cc2:ActionContainerHolder runat="server" ID="ToolBar" CssClass="ToolBar" ContainerStyle="ToolBar" Orientation="Horizontal"  Categories="ObjectsCreation;Save;Edit;UndoRedo;RecordEdit;View;Reports;RecordsNavigation;Filters" >
	                            <%--    <cc2:WebActionContainer ID="ContextObjectsCreationActionContainer" runat="server" ContainerId="ObjectsCreation" />
			                        <cc2:WebActionContainer ID="TopRecordEditActionContainer" runat="server" ContainerId="RecordEdit" />
			                        <cc2:WebActionContainer ID="RecordsNavigationContainer" runat="server" ContainerId="RecordsNavigation" />
			                        <cc2:WebActionContainer ID="ViewPresentationActionContainer" runat="server" ContainerId="View" />
			                        <cc2:WebActionContainer ID="ListViewDataManagementActionContainer" runat="server" ContainerId="Filters" />--%>
		                        </cc2:ActionContainerHolder>
					            <tc:ErrorInfoControl ID="ErrorInfo" style="margin: 10px 0px 10px 0px" runat="server"></tc:ErrorInfoControl>
                                <asp:Table ID="Table1" runat="server" Width="100%" CellPadding="0" CellSpacing="0">
                                    <asp:TableRow ID="TableRow2" runat="server">
                                        <asp:TableCell runat="server" ID="ViewSite">views content here</asp:TableCell>
                                    </asp:TableRow>
                                </asp:Table>
            	                <div id="Spacer" class="Spacer"></div>
		                    </td>
	                    </tr>
			            <tr class="Content">
				            <td class="Content Links" align="center"><cc2:QuickAccessNavigationActionContainer CssClass="NavigationLinks" ID="QuickAccessNavigationActionContainer" runat="server" ContainerId="ViewsNavigation" ImageTextStyle="Caption" ShowSeparators ="True"/></td>
	                    </tr>
                    </table>
                    </dxrp:PanelContent>
                    </PanelCollection>
                    </dxrp:ASPxRoundPanel>
                </td>
			</tr>
			<tr class="Footer">
			    <td class="Left">
			    </td>
			    <td class="Right">
                    <table cellpadding="0" cellspacing="0" border="0" width="100%"><tr>
	                    <td align="left"><div class="FooterCopyright"><asp:Literal runat="server" ID="Copyright">Copyright text</asp:Literal></div></td>
	                    <td>
	                        <cc2:ActionContainerHolder ID="DiagnosticActionContainer" Wrapped="True" Orientation="Horizontal" runat="server"
					                    HorizontalAlign="Left" Categories="Diagnostic" BorderWidth="0px" CellPadding="0" CellSpacing="0" ContainerStyle="Buttons"/>
                        </td>
	                    <td align="right">
                            <asp:Literal ID="InfoMessagesPanel" runat="server" Text="" Visible="False"></asp:Literal>
                        </td>
	                    </tr>
                    </table>			    
			    </td>
			</tr>
		</table>
	</form>
	<script type="text/javascript">
	<!--
	    function OnLoad() {
	        DXMoveFooter();
            DXattachEventToElement(window, "resize", DXWindowOnResize);
        }
    //-->	    
	</script>
	</div>
</body>
</html>
