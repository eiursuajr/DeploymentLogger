<%@ Page Language="C#" MasterPageFile="~/default.master" AutoEventWireup="true" CodeFile="ProjectNotifications.aspx.cs"
    Inherits="ProjectNotifications" %>

<%@ Register Src="Controls/ProjectInfo.ascx" TagName="ProjectInfo" TagPrefix="uc1" %>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">

    <script type="text/javascript" language="javascript">
        function ConfirmDelete()
        {
            return confirm('Do you really want to delete project notification?');
        }
    </script>

    <uc1:ProjectInfo ID="ProjectInfo1" runat="server" />
    <asp:Panel ID="Panel1" runat="server" GroupingText="Assigned Notifications" Width="100%">
        <asp:HyperLink ID="NewProjectNotificationLink" CssClass="newitem" runat="server"
            NavigateUrl="~/projectnotificationdetails.aspx">New Project Notification</asp:HyperLink><br />
        <br />
        <asp:GridView ID="ProjectNotificationList" runat="server" CellPadding="4" GridLines="None"
            DataSourceID="ProjectNotificationDataSource" AutoGenerateColumns="False" DataKeyNames="NotificationTypeID">
            <HeaderStyle CssClass="tableheader" />
            <FooterStyle CssClass="tablefooter" />
            <PagerStyle CssClass="tablepager" />
            <RowStyle CssClass="tablerow" />
            <AlternatingRowStyle CssClass="tablerowalt" />
            <Columns>
                <asp:HyperLinkField DataNavigateUrlFields="NotificationTypeID,ProjectID" DataNavigateUrlFormatString="ProjectNotificationDetails.aspx?NotificationTypeID={0}&amp;ProjectID={1}"
                    DataTextField="Name" HeaderText="Notification Type" />
                <asp:BoundField DataField="Description" HeaderText="Description" HtmlEncode="false" />
                <asp:TemplateField>
                    <ItemTemplate>
                        <a href='ProjectNotifications.aspx?NotificationTypeID=<%# Eval("NotificationTypeID") %>&ProjectID=<%# Eval("ProjectID") %>&action=delete'
                            onclick="return ConfirmDelete();">Delete</a>
                    </ItemTemplate>
                </asp:TemplateField>
            </Columns>
        </asp:GridView>
    </asp:Panel>
    <asp:ObjectDataSource ID="ProjectNotificationDataSource" runat="server" SelectMethod="LoadAllUniqueProjectNotificationByProjectID"
        TypeName="DL_WEB.DAL.Client.ProjectNotification">
        <SelectParameters>
            <asp:QueryStringParameter DefaultValue="0" Name="projectID" QueryStringField="ProjectID"
                Type="Int32" />
        </SelectParameters>
    </asp:ObjectDataSource>
</asp:Content>
