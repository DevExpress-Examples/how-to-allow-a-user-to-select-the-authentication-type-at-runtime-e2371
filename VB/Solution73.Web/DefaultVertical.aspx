<%@ Page Language="vb" AutoEventWireup="true" Inherits="DefaultVertical" EnableViewState="false"
    ValidateRequest="false" CodeBehind="DefaultVertical.aspx.vb" %>

<%@ Register Assembly="DevExpress.Web.v11.1" Namespace="DevExpress.Web.ASPxRoundPanel"
    TagPrefix="dxrp" %>
<%@ Register Assembly="DevExpress.Web.v11.1" Namespace="DevExpress.Web.ASPxPanel"
    TagPrefix="dxrp" %>
<%@ Register Assembly="DevExpress.Web.v11.1" Namespace="DevExpress.Web.ASPxSplitter"
    TagPrefix="dx" %>
<%@ Register Assembly="DevExpress.Web.v11.1" Namespace="DevExpress.Web.ASPxGlobalEvents"
    TagPrefix="dxge" %>
<%@ Register Assembly="DevExpress.ExpressApp.Web.v11.1" Namespace="DevExpress.ExpressApp.Web.Templates.ActionContainers"
    TagPrefix="cc2" %>
<%@ Register Assembly="DevExpress.ExpressApp.Web.v11.1" Namespace="DevExpress.ExpressApp.Web.Controls"
    TagPrefix="cc4" %>
<%@ Register Assembly="DevExpress.ExpressApp.Web.v11.1" Namespace="DevExpress.ExpressApp.Web.Templates.Controls"
    TagPrefix="tc" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Main Page</title>
    <meta http-equiv="Expires" content="0" />
</head>
<body class="VerticalTemplate BodyBackColor">
    <div id="PageContent" class="PageContent" style="height: 100%">
        <form id="form2" runat="server">
        <div style="height: 100%">
			<cc4:ASPxProgressControl ID="ProgressControl" runat="server" />
            <dx:ASPxSplitter ID="Spl" runat="server" Width="100%" Height="100%" Orientation="Vertical" FullscreenMode="true"
                SaveStateToCookiesID="SeparatorPosDefaultVertical" SaveStateToCookies="true">
                <Panes>
                    <dx:SplitterPane Name="Header" AllowResize="False" Separator-Visible="False" PaneStyle-BorderBottom-BorderStyle="None"
                        Size="79px">
                        <ContentCollection>
                            <dx:SplitterContentControl ID="SCC3" runat="server">
                                <div id="VerticalTemplateHeader" class="VerticalTemplateHeader">
                                    <table cellpadding="0" cellspacing="0" border="0" class="Top" width="100%">
                                        <tr>
                                            <td class="Logo">
                                                <asp:HyperLink runat="server" NavigateUrl="~/" ID="LogoLink">
                                                    <cc4:ThemedImageControl ID="TIC" DefaultThemeImageLocation="App_Themes/{0}/Xaf" ImageName="Logo.png"
                                                        BorderWidth="0px" runat="server" />
                                                </asp:HyperLink>
                                            </td>
                                            <td class="Security">
                                                <cc2:ActionContainerHolder runat="server" ID="SAC" CssClass="Security" Categories="Security"
                                                    ContainerStyle="Links" SeparatorHeight="23px" ShowSeparators="True" />
                                            </td>
                                        </tr>
                                    </table>
                                    <table border="0" cellpadding="0" cellspacing="0" width="100%" class="ACPanel">
                                        <tr class="Content">
                                            <td class="Content WithPaddings" align="right">
                                                <cc2:ActionContainerHolder ID="ShC" runat="server" Categories="RootObjectsCreation;Appearance;Search;FullTextSearch"
                                                    ContainerStyle="Links" CssClass="TabsContainer" SeparatorHeight="15px" />
                                            </td>
                                        </tr>
                                    </table>
                                </div>
                            </dx:SplitterContentControl>
                        </ContentCollection>
                    </dx:SplitterPane>
                    <dx:SplitterPane AllowResize="False" Separator-Visible="False">
                        <Panes>
                            <dx:SplitterPane Name="Left" ScrollBars="Auto" Size="200px">
                                <ContentCollection>
                                    <dx:SplitterContentControl ID="SCC4" runat="server">
                                        <div id="LP" class="LeftPane">
                                            <cc2:NavigationActionContainer ID="NC" runat="server" CssClass="xafNavigationBarActionContainer"
                                                ContainerId="ViewsNavigation" AutoCollapse="True" />
                                            <div id="TP" class="ToolsActionContainerPanel">
                                                <dxrp:ASPxRoundPanel ID="TRP" runat="server" HeaderText="Tools">
                                                    <PanelCollection>
                                                        <dxrp:PanelContent ID="PanelContent1" runat="server">
                                                            <cc2:ActionContainerHolder ID="VTC" runat="server" Menu-Width="100%" Categories="Tools"
                                                                Orientation="Vertical" ContainerStyle="Links" ShowSeparators="False" />
                                                        </dxrp:PanelContent>
                                                    </PanelCollection>
                                                </dxrp:ASPxRoundPanel>
                                                <cc2:ActionContainerHolder ID="DAC" runat="server" Orientation="Vertical" Categories="Diagnostic"
                                                    BorderWidth="0px" ContainerStyle="Links" ShowSeparators="False" />
                                                <br />
                                            </div>
                                        </div>
                                    </dx:SplitterContentControl>
                                </ContentCollection>
                            </dx:SplitterPane>
                            <dx:SplitterPane>
                                <Panes>
                                    <dx:SplitterPane Name="ViewHeader" AllowResize="False" Separator-Visible="False"
                                        PaneStyle-BorderBottom-BorderStyle="None" Size="100px">
                                        <ContentCollection>
                                            <dx:SplitterContentControl ID="SCC5" runat="server">
                                                <cc2:ActionContainerHolder CssClass="ACH MainToolbar" runat="server" ID="TB" ContainerStyle="ToolBar"
                                                    Orientation="Horizontal" Categories="ObjectsCreation;Edit;RecordEdit;View;Export;Reports;Filters">
                                                    <Menu Width="100%" ItemAutoWidth="False" ClientInstanceName="mainMenu">
                                                        <BorderTop BorderStyle="None" />
                                                        <BorderLeft BorderStyle="None" />
                                                        <BorderRight BorderStyle="None" />
                                                    </Menu>
                                                </cc2:ActionContainerHolder>
                                                <table border="0" cellpadding="0" cellspacing="0" class="MainContent" width="100%">
                                                    <tr>
                                                        <td class="ViewHeader">
                                                            <table cellpadding="0" cellspacing="0" border="0" width="100%" class="ViewHeader">
                                                                <tr>
                                                                    <td class="ViewImage">
                                                                        <cc4:ViewImageControl ID="VIC" runat="server" />
                                                                    </td>
                                                                    <td class="ViewCaption">
                                                                        <h1>
                                                                            <cc4:ViewCaptionControl ID="VCC" runat="server">
                                                                            </cc4:ViewCaptionControl>
                                                                        </h1>
                                                                        <cc2:NavigationHistoryActionContainer ID="VHC" runat="server" CssClass="NavigationHistoryLinks"
                                                                            ContainerId="ViewsHistoryNavigation" Delimiter=" / " />
                                                                    </td>
                                                                    <td align="right">
                                                                        <cc2:ActionContainerHolder runat="server" ID="RNC" ContainerStyle="Links" Orientation="Horizontal"
                                                                            Categories="RecordsNavigation" UseLargeImage="True" ImageTextStyle="Image" CssClass="RecordsNavigationContainer">
                                                                            <Menu Width="100%" ItemAutoWidth="False" HorizontalAlign="Right" />
                                                                        </cc2:ActionContainerHolder>
                                                                    </td>
                                                                </tr>
                                                            </table>
                                                        </td>
                                                    </tr>
                                                </table>
                                            </dx:SplitterContentControl>
                                        </ContentCollection>
                                    </dx:SplitterPane>
                                    <dx:SplitterPane Name="EMAPane" AllowResize="False" Separator-Visible="False" PaneStyle-BorderBottom-BorderStyle="None"
                                        Size="35px" MinSize="20px">
                                        <ContentCollection>
                                            <dx:SplitterContentControl ID="SCC6" runat="server">
                                                <cc2:ActionContainerHolder runat="server" ID="EMA" ContainerStyle="Links" Orientation="Horizontal"
                                                    Categories="Save;UndoRedo" CssClass="EditModeActions">
                                                    <Menu Width="100%" ItemAutoWidth="False" HorizontalAlign="Right" />
                                                </cc2:ActionContainerHolder>
                                            </dx:SplitterContentControl>
                                        </ContentCollection>
                                    </dx:SplitterPane>
                                    <dx:SplitterPane Name="Content" AllowResize="False" Separator-Visible="False" ScrollBars="Auto">
                                        <ContentCollection>
                                            <dx:SplitterContentControl ID="SCC7" runat="server">
                                                <div id="CP">
                                                    <table border="0" cellpadding="0" cellspacing="0" class="MainContent" width="100%">
                                                        <tr class="Content">
                                                            <td class="Content">
                                                                <tc:ErrorInfoControl ID="ErrorInfo" Style="margin: 10px 0px 10px 0px" runat="server">
                                                                </tc:ErrorInfoControl>
                                                                <cc4:ViewSiteControl ID="VSC" runat="server" />
                                                                <div id="Spacer" class="Spacer">
                                                                </div>
                                                            </td>
                                                        </tr>
                                                        <tr class="Content">
                                                            <td class="Content Links" align="center">
                                                                <cc2:QuickAccessNavigationActionContainer CssClass="NavigationLinks" ID="QC" runat="server"
                                                                    ContainerId="ViewsNavigation" ImageTextStyle="Caption" ShowSeparators="True" />
                                                            </td>
                                                        </tr>
                                                    </table>
                                                </div>
                                            </dx:SplitterContentControl>
                                        </ContentCollection>
                                    </dx:SplitterPane>
                                </Panes>
                            </dx:SplitterPane>
                        </Panes>
                    </dx:SplitterPane>
                    <dx:SplitterPane Name="Footer" AllowResize="False" Separator-Visible="False" PaneStyle-BorderBottom-BorderStyle="None"
                        Size="80px">
                        <ContentCollection>
                            <dx:SplitterContentControl ID="SCC10" runat="server">
                                <table cellpadding="0" cellspacing="0" border="0" style="width: 100%; height: 100%"
                                    class="BodyBackColor">
                                    <tr>
                                        <td align="center">
                                            <asp:Literal ID="InfoMessagesPanel" runat="server" Text="" Visible="False"></asp:Literal>
                                            <div id="Footer" class="Footer">
                                                <table cellpadding="0" cellspacing="0" border="0" width="100%">
                                                    <tr>
                                                        <td align="left">
                                                            <div class="FooterCopyright">
                                                                <cc4:AboutInfoControl ID="AIC" runat="server">Copyright text</cc4:AboutInfoControl>
                                                            </div>
                                                        </td>
                                                    </tr>
                                                </table>
                                            </div>
                                        </td>
                                    </tr>
                                </table>
                            </dx:SplitterContentControl>
                        </ContentCollection>
                    </dx:SplitterPane>
                </Panes>
            </dx:ASPxSplitter>
        </div>
        </form>
    </div>
</body>
</html>
