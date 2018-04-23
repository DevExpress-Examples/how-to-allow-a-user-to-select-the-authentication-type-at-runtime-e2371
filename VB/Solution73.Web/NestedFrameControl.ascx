<%@ Control Language="vb" AutoEventWireup="true" EnableViewState="false" Inherits="NestedFrameControl" Codebehind="NestedFrameControl.ascx.vb" %>
<%@ Register Assembly="DevExpress.ExpressApp.Web.v10.1" Namespace="DevExpress.ExpressApp.Web.Templates.ActionContainers" TagPrefix="cc2" %>
			<cc2:ActionContainerHolder runat="server" ID="ToolBar" CssClass="ToolBar" ContainerStyle="ToolBar" ImageTextStyle="CaptionAndImage" Orientation="Horizontal" Categories="ObjectsCreation;Link;Edit;RecordEdit;View;Reports;Diagnostic;Filters">
				<%--<cc2:WebActionContainer ID="ContextObjectsCreationActionContainer" runat="server" ContainerId="ObjectsCreation"/>
				<cc2:WebActionContainer ID="RecordEditContainer" runat="server" ContainerId="RecordEdit"/>
				<cc2:WebActionContainer ID="ViewContainer" runat="server" ContainerId="View"/>
				<cc2:WebActionContainer ID="DiagnosticActionContainer" runat="server" ContainerId="Diagnostic"/>
				<cc2:WebActionContainer ID="FiltersActionContainer" runat="server" ContainerId="Filters"/>--%>
			</cc2:ActionContainerHolder>
			<asp:Panel ID="ViewSite" runat="server"> </asp:Panel>
			<!--table border="0" cellpadding="0" cellspacing="0">
				<tr>
					<td class="NestedViewImage">
						<asp:Image ID="ViewImage" runat="server" ImageUrl="~/Images/ViewImage.png" />
					</td>
					<td style="height: 30px">
						<asp:Label ID="ViewCaptionLabel" CssClass="NestedViewCaption" runat="server" Text="Contact list" />
					</td>
				</tr>
			</table-->