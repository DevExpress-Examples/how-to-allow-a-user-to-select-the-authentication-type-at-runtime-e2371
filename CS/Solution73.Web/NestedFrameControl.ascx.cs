using System;
using System.Data;
using System.Configuration;
using System.Collections;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;
using DevExpress.ExpressApp.Templates;
using DevExpress.ExpressApp.Utils;
using DevExpress.Persistent.Base;
using System.Collections.Generic;
using DevExpress.ExpressApp;
using DevExpress.ExpressApp.Web.Layout;

public partial class NestedFrameControl : System.Web.UI.UserControl, IFrameTemplate {
    private ContextActionsMenu contextMenu;
    protected override void OnPreRender(EventArgs e) {
        base.OnPreRender(e);
    }
    protected override void OnLoad(EventArgs e) {
        base.OnLoad(e);
    }
    protected override void OnInit(EventArgs e) {
        base.OnInit(e);
    }
    public NestedFrameControl() {
        contextMenu = new ContextActionsMenu(this, "Edit", "RecordEdit", "ListView");
    }
    public override void Dispose() {
        foreach (IActionContainer container in GetContainers()) {
            container.Dispose();
        }
        ToolBar.Dispose();
        if (contextMenu != null) {
            contextMenu.Dispose();
            contextMenu = null;
        }
        base.Dispose();
    }
    #region IFrameTemplate Members
    public IActionContainer DefaultContainer {
        get { return /*ViewContainer*/ null; }
    }
    public ICollection<IActionContainer> GetContainers() {
        List<IActionContainer> result = new List<IActionContainer>();
        if (contextMenu != null) {
            result.AddRange(contextMenu.Containers);
        }
        result.AddRange(ToolBar.ActionContainers);
        return result;
    }
    public void SetView(DevExpress.ExpressApp.View view) {
        ViewSite.Controls.Clear();
        if (view != null) {
            contextMenu.CreateControls(view);
            view.CreateControls();
            ViewSite.Controls.Add((Control)view.Control);
            ViewCaptionLabel.Text = view.Caption;
            ImageInfo imageInfo = ImageLoader.Instance.GetImageInfo(view.Model.ModelClass.ImageName);
            if (imageInfo.IsEmpty) {
                ViewImage.Visible = false;
                ViewImage.ImageUrl = null;
            }
            else {
                ViewImage.ImageUrl = imageInfo.ImageUrl;
            }
        }
    }
    #endregion
}
