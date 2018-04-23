using System;
using System.Collections.Generic;
using System.Web.UI;
using DevExpress.ExpressApp.Templates;
using DevExpress.ExpressApp.Web;
using DevExpress.ExpressApp.Web.Templates;
using DevExpress.ExpressApp.Web.Templates.ActionContainers;

public partial class Default : BaseXafPage {
    private void Splitter_PreRender(object sender, EventArgs e) {
        Spl.PreRender -= new EventHandler(Splitter_PreRender);
        Spl.GetPaneByName("Left").Visible = VTC.HasActiveActions() || DAC.HasActiveActions();
        Spl.GetPaneByName("EMAPane").Visible = EMA.HasActiveActions();
    }
	protected void Page_Load(object sender, EventArgs e) {
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