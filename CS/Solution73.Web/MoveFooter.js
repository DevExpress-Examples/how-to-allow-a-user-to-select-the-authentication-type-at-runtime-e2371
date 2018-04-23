var DXagent = navigator.userAgent.toLowerCase();
var DXopera = (DXagent.indexOf("opera") > -1);
var DXsafari = DXagent.indexOf("safari") > -1;
var DXie = (DXagent.indexOf("msie") > -1 && !DXopera);
var DXns = (DXagent.indexOf("mozilla") > -1 || DXagent.indexOf("netscape") > -1 || DXagent.indexOf("firefox") > -1) && !DXsafari && !DXie && !DXopera;
var resizeTimeout = null;

function DXattachEventToElement(element, eventName, func) {
    if (element) {
        if (DXns || DXsafari)
            element.addEventListener(eventName, func, true);
        else {
            if (eventName.toLowerCase().indexOf("on") != 0)
                eventName = "on" + eventName;
            element.attachEvent(eventName, func);
        }
    }
}
function DXGetElement(id) {
    if (document.getElementById != null) {
        return document.getElementById(id);
    }
    if (document.all != null) {
        return document.all[id];
    }
    if (document.layers != null) {
        return document.layers[id];
    }
    return null;
}
function DXGetElementHeight(id) {
    var el = DXGetElement(id);
    if (el) {
        return parseInt(el.offsetHeight);
    }
    return 0;
}
function DXGetWindowHeight() {
    var height = 0;
    if (typeof (window.innerHeight) == 'number') {
        height = window.innerHeight;
    } else if (document.documentElement && document.documentElement.clientHeight) {
        height = document.documentElement.clientHeight;
    } else if (document.body && document.body.clientHeight) {
        height = document.body.clientHeight;
    }
    var margin = 0;
    if (document.body.currentStyle) {
        margin = parseInt(document.body.currentStyle.margin);
    }
    return parseInt(height) - (margin * 2);
}
function DXGetWindowWidth() {
    var width = 0;
    if (typeof (window.clientWidth) == 'number') {
        width = window.clientWidth;
    } else if (document.documentElement && document.documentElement.clientWidth) {
        width = document.documentElement.clientWidth;
    } else if (document.body && document.body.clientWidth) {
        width = document.body.clientWidth;
    }
    var margin = 0;
    if (document.body.currentStyle) {
        margin = parseInt(document.body.currentStyle.margin);
    }
    return parseInt(width) - (margin * 2);
}
function DXMoveFooter() {
    SetupPane();
    var leftPaneContentHeight = DXGetElementHeight('LP');
    var rightPaneContentHeight = DXGetElementHeight('CP');
    var maxPaneContentHeight = (leftPaneContentHeight > rightPaneContentHeight ? leftPaneContentHeight : rightPaneContentHeight);
    var currentSplitterHeight = splitter.GetHeight();

    var bodyVisibleHeight = document.body.offsetHeight;
    var splitterHeightForSmallContent = DXGetWindowHeight() - (bodyVisibleHeight - currentSplitterHeight) - GetBrowserDependentAdditionalHeight();

    var newSplitterHeight = splitterHeightForSmallContent > maxPaneContentHeight ? splitterHeightForSmallContent : maxPaneContentHeight;
    var size = newSplitterHeight - DXGetElementHeight("CP") - 20;

    if (!__aspxIE) {
        splitter.SetHeight(newSplitterHeight);
    }
    else {
        document.getElementById("footer2").style.height = ((size >= 0) ? size : 0) + "px";
    }
    SetupPane();
    resizeTimeout = null;
}
function GetBrowserDependentAdditionalHeight() {
    if (__aspxOpera) {
        return 19;
    }
    if (__aspxChrome || __aspxFirefox) {
        return 17;
    }
    return 0;
}
function GetBrowserDependentAdditionalWidth() {
    if (__aspxOpera) {
        return 0;
    }
    if (__aspxChrome) {
        return 17;
    }
    return 0;
}
function SetupPane() {
    var contentPaneDiv = splitter.GetPaneByName("Content").helper.GetContentContainerElement();
    contentPaneDiv.style.width = "100%";
    contentPaneDiv.style.display = "table";
    var leftPaneDiv = splitter.GetPaneByName("Left").helper.GetContentContainerElement();

    leftPaneDiv.style.display = "table";
}
function SupressApplyingScrollPosition() {
    splitter.Init.AddHandler(SetupPane);
    splitter.PaneResizeCompleted.AddHandler(DXMoveFooter);
    splitter.ApplyScrollPosition = function() { return; };
    var leftPane = splitter.GetPaneByName("Left");
    if (leftPane) {
        leftPane.ApplyScrollPosition = function() { return; };
    }
    var contentPane = splitter.GetPaneByName("Content");
    if (contentPane) {
        contentPane.ApplyScrollPosition = function() { return; };
    }
    if (__aspxIE) {
        splitter.UpdatePanesVisible = function() { return; };
    }
    splitter.OnWindowResize = function() { return; };
    GetXAFClientGlobalEvents().PageControlActiveTabChanged.AddHandler(SetupPane);
}
function DXWindowOnResize(evt) {
    if (resizeTimeout) {
        window.clearTimeout(resizeTimeout);
    }
    resizeTimeout = window.setTimeout(DXMoveFooter, 100);
} 
