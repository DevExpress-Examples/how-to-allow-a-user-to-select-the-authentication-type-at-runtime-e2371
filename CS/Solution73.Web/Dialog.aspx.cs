using System;
using System.Web.UI;
using DevExpress.ExpressApp;
using DevExpress.ExpressApp.Web;
using System.Collections.Generic;
using DevExpress.ExpressApp.Utils;
using DevExpress.ExpressApp.Editors;
using DevExpress.ExpressApp.Templates;
using DevExpress.ExpressApp.Web.TestScripts;

public partial class DialogPage : System.Web.UI.Page, IWindowTemplate, ILookupPopupFrameTemplate {
    private ContextActionsMenu contextMenu;
    protected override void InitializeCulture() {
        if (WebApplication.Instance != null)
            WebApplication.Instance.InitializeCulture();
    }
    protected void Page_Load(object sender, EventArgs e) {
        contextMenu = new ContextActionsMenu(this, "ListView");
        WebApplication.Instance.CreateControls(this);
    }
    protected void Page_Prerender(object sender, EventArgs e) {
        if (TestScriptsManager.EasyTestEnabled) {
            ViewCaptionLabel.Attributes[EasyTestTagHelper.TestField] = "FormCaption";
            ViewCaptionLabel.Attributes[EasyTestTagHelper.TestControlClassName] = JSLabelTestControl.ClassName;
        }
    }
    public override void Dispose() {
        if (contextMenu != null) {
            contextMenu.Dispose();
            contextMenu = null;
        }
        base.Dispose();
    }

    #region IFrameTemplate Members
    private bool isSizeable;
    public IActionContainer DefaultContainer {
        get { return null; }
    }
    public ICollection<IActionContainer> GetContainers() {
        List<IActionContainer> result = new List<IActionContainer>();
        result.AddRange(contextMenu.Containers);
        result.AddRange(Holder1.ActionContainers);
        result.AddRange(SearchActionContainer.ActionContainers);
        return result;
    }
    public void SetView(DevExpress.ExpressApp.View view) {
        this.ViewSite.Controls.Clear();
        if (view != null) {
            contextMenu.CreateControls(view);
            view.CreateControls();
            ViewSite.Controls.Add((Control)view.Control);
            this.ViewCaptionLabel.Text = view.Caption;
            Header.Title = view.Caption + " - " + WebApplication.Instance.Title;
            ImageInfo imageInfo = ImageLoader.Instance.GetLargeImageInfo(view.Model.ModelClass.ImageName);
            if (imageInfo.IsEmpty) {
                ViewImage.Visible = false;
            }
            else {
                ViewImage.ImageUrl = imageInfo.ImageUrl;
            }
            if (view is DetailView) {
                //SearchActionContainer.Visible = false;
                //ObjectsCreationActionContainer.Visible = false;
            }
        }
    }
    public bool IsSizeable {
        get { return isSizeable; }
        set { isSizeable = value; }
    }
    public void SetCaption(string caption) { }
    public void SetStatus(System.Collections.Generic.ICollection<string> statusMessages) { }

    #endregion

    #region ILookupPopupFrameTemplate Members

    public bool IsSearchEnabled {
        get { return SearchActionContainer.Visible; }
        set { SearchActionContainer.Visible = value; }
    }

    public void SetStartSearchString(string searchString) { }

    #endregion
}
