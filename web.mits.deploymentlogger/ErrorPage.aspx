<%@ Page Language="C#" MasterPageFile="~/default.master" AutoEventWireup="true" CodeFile="ErrorPage.aspx.cs" Inherits="ErrorPage" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <fieldset>
        <legend>An error occurred...</legend>
        <p>
            <asp:Label ID="errorMessage" runat="Server" /></p>
        <p>
        <a href="#" onclick="stacktracePanel.style.display=(stacktracePanel.style.display=='inline'?'none':'inline');return false;">
                Show detailed error information</a></p>
        <div id="stacktracePanel" style="display: none">
            <pre><asp:Label ID="stacktrace" Runat="Server" />
			</pre>
        </div>
        <p />
    </fieldset>
</asp:Content>
