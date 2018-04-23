<%@ Page Language="vb" AutoEventWireup="true" Inherits="Default" EnableViewState="false" validateRequest="false" Codebehind="Default.aspx.vb" %>

<%@ Register Assembly="DevExpress.Web.v10.2" Namespace="DevExpress.Web.ASPxRoundPanel" TagPrefix="dxrp" %>
<%@ Register Assembly="DevExpress.Web.v10.2" Namespace="DevExpress.Web.ASPxPanel" TagPrefix="dxrp" %>
<%@ Register Assembly="DevExpress.Web.v10.2" Namespace="DevExpress.Web.ASPxSplitter" TagPrefix="dxsp" %>
<%@ Register Assembly="DevExpress.Web.v10.2" Namespace="DevExpress.Web.ASPxGlobalEvents" TagPrefix="dxge" %>
<%@ Register Assembly="DevExpress.ExpressApp.Web.v10.2" Namespace="DevExpress.ExpressApp.Web.Templates.ActionContainers" TagPrefix="cc2" %>
<%@ Register Assembly="DevExpress.ExpressApp.Web.v10.2" Namespace="DevExpress.ExpressApp.Web.Controls" TagPrefix="cc4" %>
<%@ Register Assembly="DevExpress.ExpressApp.Web.v10.2" Namespace="DevExpress.ExpressApp.Web.Templates.Controls" TagPrefix="tc" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
	<title>Main Page</title>
	<meta http-equiv="Expires" content="0" />
</head>
<body onload="OnLoad()"  class="HorizontalTemplate">
	<div id="PageContent" class="PageContent">
	<script src="MoveFooter.js" type="text/javascript"></script>
	<form id="form1" runat="server">
	<dxge:ASPxGlobalEvents ClientSideEvents-EndCallback="DXUpdateSplitterSize" ID="GlobalEvents" runat="server" />
	<cc4:ASPxProgressControl ID="ProgressControl" runat="server" />
	<div id="HorizontalTemplateHeader" class="HorizontalTemplateHeader">
	<table cellpadding="0" cellspacing="0" border="0" class="Top" width="100%">
		<tr>
			<td class="Logo">
				<asp:HyperLink runat="server" NavigateUrl="~/" ID="LogoLink">
					<cc4:ThemedImageControl
						ID="themedImageControl" ImageName="Logo.png" DefaultThemeImageLocation="App_Themes/{0}/Xaf" runat="server" BorderWidth="0px" />
				</asp:HyperLink>
			</td>
			<td class="Security">
				<cc2:ActionContainerHolder runat="server" ID="SecurityActionContainer" Categories="Security" ContainerStyle="Links" ImageTextStyle="CaptionAndImage" CssClass="Security" SeparatorHeight="23px" ShowSeparators="True"/>
			</td>
		</tr>
	</table>

	<cc2:NavigationTabsActionContainer ID="NavigationTabsActionContainer" runat="server" ContainerId="ViewsNavigation" CssClass="NavigationTabsActionContainer">
		<SpaceAfterTabsTemplate>
			<cc2:ActionContainerHolder ID="VerticalNewActionContainer" runat="server" Categories="RootObjectsCreation;Appearance;Search;FullTextSearch" ContainerStyle="Links" CssClass="TabsContainer" SeparatorHeight="15px"  />
		</SpaceAfterTabsTemplate>
	</cc2:NavigationTabsActionContainer>
   </div>
		 <dxsp:ASPxSplitter ID="Splitter" runat="server" Height="500px" Width="100%" ShowCollapseBackwardButton="True" SaveStateToCookiesID="SeparatorPos" SaveStateToCookies="True" ClientInstanceName="splitter">
			 <Panes>
				 <dxsp:SplitterPane Name="Left" Size="300px" PaneStyle-Paddings-Padding="1px" PaneStyle-BorderLeft-BorderStyle="None">
					 <ContentCollection>
						 <dxsp:SplitterContentControl ID="SplitterContentControl1" runat="server">
							<div id="LeftPane" class="LeftPane">
							   <cc2:ActionContainerHolder id="VerticalToolsActionContainer" runat="server" Orientation="Vertical" Categories="Tools" BorderWidth="0px" ContainerStyle="Links" ShowSeparators="False" />
							   <cc2:ActionContainerHolder ID="DiagnosticActionContainer" runat="server" Orientation="Vertical" Categories="Diagnostic" BorderWidth="0px" ContainerStyle="Links" ShowSeparators="False" />
							   <br/>
							</div>
						 </dxsp:SplitterContentControl>
					 </ContentCollection>
				 </dxsp:SplitterPane>
				 <dxsp:SplitterPane Name="Content" PaneStyle-Paddings-Padding="0px" PaneStyle-BorderRight-BorderStyle="None" ScrollBars="Auto">
					 <ContentCollection>
						 <dxsp:SplitterContentControl ID="SplitterContentControl3" runat="server">
							<div id="ContentPane">
								<cc2:ActionContainerHolder runat="server" ID="ToolBar" ContainerStyle="ToolBar" Orientation="Horizontal"  Categories="ObjectsCreation;Edit;RecordEdit;View;Export;Reports;Filters">
									<Menu Width="100%" ItemAutoWidth="False">
										<BorderTop BorderStyle="None"/>
										<BorderLeft BorderStyle="None"/>
										<BorderRight BorderStyle="None"/>
									</Menu>
								</cc2:ActionContainerHolder>
								<table border="0" cellpadding="0" cellspacing="0" class="MainContent" width="100%">
									<tr>
										<td class="ViewHeader">
											<table cellpadding="0" cellspacing="0" border="0" width="100%" class="ViewHeader">
												<tr><td class="ViewImage">
														<cc4:viewImageControl ID="viewImageControl" runat="server" />
													</td>
													<td class="ViewCaption">
														<h1><cc4:viewCaptionControl ID="viewCaptionControl" runat="server"></cc4:ViewCaptionControl></h1>
														<cc2:NavigationHistoryActionContainer ID="ViewsHistoryNavigationContainer" runat="server" CssClass="NavigationHistoryLinks" ContainerId="ViewsHistoryNavigation" Delimiter=" / "/>
													</td>
													<td align="right">
		                                                <cc2:ActionContainerHolder runat="server" ID="RecordsNavigationContainer" ContainerStyle="Links" Orientation="Horizontal"  Categories="RecordsNavigation" UseLargeImage="True" ImageTextStyle="Image" CssClass="RecordsNavigationContainer" >
															<Menu Width="100%" ItemAutoWidth="False" HorizontalAlign="Right"/>
														</cc2:ActionContainerHolder>
													</td>
												</tr>
											</table>
                                            <cc2:ActionContainerHolder runat="server" ID="EditModeActions" ContainerStyle="Links" Orientation="Horizontal"  Categories="Save;UndoRedo" CssClass="EditModeActions">
                                                <Menu Width="100%" ItemAutoWidth="False" HorizontalAlign="Right"/>
                                            </cc2:ActionContainerHolder>
										</td>
									</tr>
									<tr class="Content">
										<td class="Content">
											<tc:ErrorInfoControl ID="ErrorInfo" style="margin: 10px 0px 10px 0px" runat="server"></tc:ErrorInfoControl>
											<cc4:ViewSiteControl ID="viewSiteControl" runat="server"/>
											<cc2:ActionContainerHolder runat="server" ID="EditModeActions2" ContainerStyle="Links" Orientation="Horizontal"  Categories="Save;UndoRedo" CssClass="EditModeActions">
												<Menu Width="100%" ItemAutoWidth="False" HorizontalAlign="Right" Paddings-PaddingTop="15px"/>
											</cc2:ActionContainerHolder>
											<div id="Spacer" class="Spacer"></div>
										</td>
									</tr>
									<tr class="Content">
										<td class="Content Links" align="center"><cc2:QuickAccessNavigationActionContainer CssClass="NavigationLinks" ID="QuickAccessNavigationActionContainer" runat="server" ContainerId="ViewsNavigation" ImageTextStyle="Caption" ShowSeparators ="True"/></td>
									</tr>
								</table>
							</div>
						 </dxsp:SplitterContentControl>
					 </ContentCollection>
				 </dxsp:SplitterPane>
			 </Panes>
		 </dxsp:ASPxSplitter>

		<asp:Literal ID="InfoMessagesPanel" runat="server" Text="" Visible="False"></asp:Literal>

		<div id="Footer" class="Footer">
		<table cellpadding="0" cellspacing="0" border="0" width="100%"><tr>
		<td align="left"><div class="FooterCopyright"><cc4:aboutInfoControl ID="aboutInfoControl" runat="server">Copyright text</cc4:AboutInfoControl></div></td>
		</tr></table></div>
	</form>
	<script type="text/javascript">
	<!--
		function OnLoad() {
			DXUpdateSplitterSize();
			DXMoveFooter();
			DXattachEventToElement(window, "resize", DXWindowOnResize);
			DXattachEventToElement(window.LeftPane, "resize", DXUpdateSplitterSize);
			DXattachEventToElement(window.ContentPane, "resize", DXUpdateSplitterSize);
		}
	//-->	    
	</script>
	</div>
</body>
</html>