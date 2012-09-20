<%@ Page Language="C#" MasterPageFile="~/default.master" AutoEventWireup="true" CodeFile="ProjectNotificationDetails.aspx.cs"
    Inherits="ProjectNotificationDetails" %>

<%@ Register Src="Controls/ProjectInfo.ascx" TagName="ProjectInfo" TagPrefix="uc1" %>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">

    <script type="text/javascript" language="javascript">
        function Delete()
        {
            return confirm('Do you really want to delete project notification?');
        }
    </script>

    <a class="newitem" href="projectnotifications.aspx?ProjectID=<% = this.ProjectID %>">
        &lt;&nbsp;Back to List</a><br />
    <br />
    <uc1:ProjectInfo ID="ProjectInfo1" runat="server" />
    <table>
        <tr>
            <td class="fieldname">
                Notification Type</td>
            <td>
                <asp:DropDownList ID="NotificationTypeList" runat="server" DataValueField="NotificationTypeID"
                    DataTextField="Name" DataSourceID="NotificationTypeDataSource" AutoPostBack="true"
                    OnDataBound="NotificationTypeList_DataBound" OnSelectedIndexChanged="NotificationTypeList_SelectedIndexChanged">
                </asp:DropDownList></td>
        </tr>
    </table>
    <asp:Panel ID="Panel1" runat="server" GroupingText="Roles" Width="100%">
        <a class="newitem" href="projectnotificationitem.aspx?NotificationTypeID=<% = this.NotificationTypeID %>&amp;ProjectID=<% = this.ProjectID %>&amp;type=role">
            Add</a><br />
        <br />
        <asp:GridView ID="RoleList" runat="server" CellPadding="4" ForeColor="#333333" GridLines="None"
            DataSourceID="RoleDataSource" AutoGenerateColumns="False" DataKeyNames="ProjectNotificationID"
            OnRowDeleted="ProjectNotificationList_RowDeleted">
            <HeaderStyle CssClass="tableheader" />
            <FooterStyle CssClass="tablefooter" />
            <PagerStyle CssClass="tablepager" />
            <RowStyle CssClass="tablerow" />
            <AlternatingRowStyle CssClass="tablerowalt" />
            <Columns>
                <asp:BoundField DataField="Name" HeaderText="Name" />
                <asp:TemplateField>
                    <ItemTemplate>
                        <asp:LinkButton CommandArgument='<%# Bind("ProjectNotificationID") %>' CommandName="Delete"
                            ID="DeleteButton" runat="server" OnClientClick="return Delete();" Text="Delete"></asp:LinkButton>
                    </ItemTemplate>
                </asp:TemplateField>
            </Columns>
        </asp:GridView>
    </asp:Panel>
    <asp:Panel ID="Panel2" runat="server" GroupingText="Users" Width="100%">
        <a class="newitem" href="projectnotificationitem.aspx?NotificationTypeID=<% = this.NotificationTypeID %>&amp;ProjectID=<% = this.ProjectID %>&amp;type=user">
            Add</a><br />
        <br />
        <asp:GridView ID="UserList" runat="server" CellPadding="4" ForeColor="#333333" GridLines="None"
            DataKeyNames="ProjectNotificationID" DataSourceID="UserDataSource" AutoGenerateColumns="False"
            OnRowDeleted="ProjectNotificationList_RowDeleted">
            <HeaderStyle CssClass="tableheader" />
            <FooterStyle CssClass="tablefooter" />
            <PagerStyle CssClass="tablepager" />
            <RowStyle CssClass="tablerow" />
            <AlternatingRowStyle CssClass="tablerowalt" />
            <Columns>
                <asp:BoundField DataField="Login" HeaderText="Login" />
                <asp:BoundField DataField="IsInactive" HeaderText="Is Inactive" />
                <asp:BoundField DataField="IsApproved" HeaderText="Is Approved" />
                <asp:BoundField DataField="IsLockedOut" HeaderText="Is Locked Out" />
                <asp:TemplateField>
                    <ItemTemplate>
                        <asp:LinkButton CommandArgument='<%# Bind("ProjectNotificationID") %>' CommandName="Delete"
                            ID="DeleteButton" runat="server" OnClientClick="return Delete();" Text="Delete"></asp:LinkButton>
                    </ItemTemplate>
                </asp:TemplateField>
            </Columns>
        </asp:GridView>
    </asp:Panel>
    <asp:Panel ID="Panel3" runat="server" GroupingText="Additional" Width="100%">
        <a class="newitem" href="projectnotificationitem.aspx?NotificationTypeID=<% = this.NotificationTypeID %>&amp;ProjectID=<% = this.ProjectID %>&amp;type=addressbook">
            Add</a><br />
        <br />
        <asp:GridView ID="AddressBookList" runat="server" CellPadding="4" ForeColor="#333333"
            GridLines="None" DataKeyNames="ProjectNotificationID" DataSourceID="AddressBookDataSource"
            AutoGenerateColumns="False" OnRowDeleted="ProjectNotificationList_RowDeleted">
            <HeaderStyle CssClass="tableheader" />
            <FooterStyle CssClass="tablefooter" />
            <PagerStyle CssClass="tablepager" />
            <RowStyle CssClass="tablerow" />
            <AlternatingRowStyle CssClass="tablerowalt" />
            <Columns>
                <asp:BoundField DataField="FullName" HeaderText="Full Name" />
                <asp:BoundField DataField="PrimaryEmail" HeaderText="Primary Email" />
                <asp:BoundField DataField="HomePhone" HeaderText="Home Phone" />
                <asp:BoundField DataField="WorkPhone" HeaderText="Work Phone" />
                <asp:BoundField DataField="SecondaryEmail" HeaderText="Secondary Email" />
                <asp:BoundField DataField="IsShared" HeaderText="Is Shared" />
                <asp:TemplateField>
                    <ItemTemplate>
                        <asp:LinkButton CommandArgument='<%# Bind("ProjectNotificationID") %>' CommandName="Delete"
                            ID="DeleteButton" runat="server" OnClientClick="return Delete();" Text="Delete"></asp:LinkButton>
                    </ItemTemplate>
                </asp:TemplateField>
            </Columns>
        </asp:GridView>
    </asp:Panel>
    <asp:ObjectDataSource ID="NotificationTypeDataSource" runat="server" OldValuesParameterFormatString="{0}"
        SelectMethod="LoadAllNotificationType" TypeName="DL_WEB.DAL.Client.NotificationType">
    </asp:ObjectDataSource>
    <asp:ObjectDataSource ID="RoleDataSource" runat="server" OldValuesParameterFormatString="{0}"
        SelectMethod="LoadAllRoleByNotificationTypeID" TypeName="DL_WEB.DAL.Client.ProjectNotification"
        DeleteMethod="Delete">
        <SelectParameters>
            <asp:QueryStringParameter DefaultValue="0" Name="notificationTypeID" QueryStringField="NotificationTypeID"
                Type="Int32" />
            <asp:QueryStringParameter DefaultValue="0" Name="projectID" QueryStringField="ProjectID"
                Type="Int32" />
        </SelectParameters>
        <DeleteParameters>
            <asp:Parameter Name="projectNotificationID" Type="Int32" />
        </DeleteParameters>
    </asp:ObjectDataSource>
    <asp:ObjectDataSource ID="UserDataSource" runat="server" OldValuesParameterFormatString="{0}"
        SelectMethod="LoadAllUserByNotificationTypeID" TypeName="DL_WEB.DAL.Client.ProjectNotification"
        DeleteMethod="Delete">
        <SelectParameters>
            <asp:QueryStringParameter DefaultValue="0" Name="notificationTypeID" QueryStringField="NotificationTypeID"
                Type="Int32" />
            <asp:QueryStringParameter DefaultValue="0" Name="projectID" QueryStringField="ProjectID"
                Type="Int32" />
        </SelectParameters>
        <DeleteParameters>
            <asp:Parameter Name="projectNotificationID" Type="Int32" />
        </DeleteParameters>
    </asp:ObjectDataSource>
    <asp:ObjectDataSource ID="AddressBookDataSource" runat="server" OldValuesParameterFormatString="{0}"
        SelectMethod="LoadAllAddressBookByNotificationTypeID" TypeName="DL_WEB.DAL.Client.ProjectNotification"
        DeleteMethod="Delete">
        <SelectParameters>
            <asp:QueryStringParameter DefaultValue="0" Name="notificationTypeID" QueryStringField="NotificationTypeID"
                Type="Int32" />
            <asp:QueryStringParameter DefaultValue="0" Name="projectID" QueryStringField="ProjectID"
                Type="Int32" />
        </SelectParameters>
        <DeleteParameters>
            <asp:Parameter Name="projectNotificationID" Type="Int32" />
        </DeleteParameters>
    </asp:ObjectDataSource>
</asp:Content>
