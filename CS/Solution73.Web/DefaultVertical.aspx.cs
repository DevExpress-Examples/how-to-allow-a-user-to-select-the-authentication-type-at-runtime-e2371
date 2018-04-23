using System;
using System.Collections.Generic;
using System.Web.UI;
using DevExpress.ExpressApp.Templates;
using DevExpress.ExpressApp.Web;
using DevExpress.ExpressApp.Web.Templates;
using DevExpress.ExpressApp.Web.Templates.ActionContainers;

public partial class DefaultVertical : BaseXafPage {
    private void ToolsRoundPanel_PreRender(object sender, EventArgs e) {
        bool isVisible = false;
        foreach(Control control in TRP.Controls) {
            if(control is ActionContainerHolder) {
                if(((ActionContainerHolder)control).HasActiveActions()) {
                    isVisible = true;
                    break;
                }
            }
        }
        TRP.Visible = isVisible;
    }
    private void Splitter_PreRender(object sender, EventArgs e) {
        Spl.PreRender -= new EventHandler(Splitter_PreRender);
        Spl.GetPaneByName("EMAPane").Visible = EMA.HasActiveActions();
    }
	protected void Page_Load(object sender, EventArgs e) {
		CallbackManager.RegisterCallbackUpdateControl(Spl);
        TRP.PreRender += new EventHandler(ToolsRoundPanel_PreRender);
        Spl.PreRender += new EventHandler(Splitter_PreRender);
        WebApplication.Instance.CreateControls(this);
    }
    protected override ContextActionsMenu CreateContextActionsMenu() {
        return new ContextActionsMenu(this, "Edit", "RecordEdit", "ObjectsCreation", "ListView", "Reports");
    }
    protected override IActionContainer GetDefaultContainer() {
        return TB.FindActionContainerById("View");
    }
    public override void SetStatus(System.Collections.Generic.ICollection<string> statusMessages) {
		InfoMessagesPanel.Text = string.Join("<br>", new List<string>(statusMessages).ToArray());
	}
}
