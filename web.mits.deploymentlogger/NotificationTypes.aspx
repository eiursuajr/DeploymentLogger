<%@ Page Language="C#" MasterPageFile="~/default.master" AutoEventWireup="true" CodeFile="NotificationTypes.aspx.cs"
    Inherits="NotificationTypes" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">

    <script type="text/javascript" language="javascript">
        function Delete()
        {
            return confirm('Do you really want to delete notification type?');
        }
    </script>

    <div class="pagecaption">
        Notification Types</div>
    <asp:HyperLink ID="NewNotificationType" runat="server" CssClass="newitem" Text="New Notification Type"
        NavigateUrl="~/notificationtypedetails.aspx"></asp:HyperLink><br />
    <br />
    <asp:GridView ID="NotificationTypeList" runat="server" AutoGenerateColumns="False"
        CellPadding="4" GridLines="None" DataKeyNames="NotificationTypeID" DataSourceID="NotificationTypeDataSource"
        OnRowDeleted="NotificationTypeList_RowDeleted" OnRowCommand="NotificationTypeList_RowCommand">
        <HeaderStyle CssClass="tableheader" />
        <FooterStyle CssClass="tablefooter" />
        <PagerStyle CssClass="tablepager" />
        <RowStyle CssClass="tablerow" />
        <AlternatingRowStyle CssClass="tablerowalt" />
        <Columns>
            <asp:HyperLinkField DataNavigateUrlFields="NotificationTypeID" DataNavigateUrlFormatString="NotificationTypeDetails.aspx?NotificationTypeID={0}"
                DataTextField="Name" HeaderText="Name" />
            <asp:BoundField HeaderText="Description" DataField="Description" HtmlEncode="false" />
            <asp:TemplateField>
                <ItemTemplate>
                    <asp:LinkButton CommandArgument='<%# Bind("NotificationTypeID") %>' CommandName="Delete"
                        ID="DeleteButton" runat="server" OnClientClick="return Delete();" Text="Delete"></asp:LinkButton>
                </ItemTemplate>
            </asp:TemplateField>
        </Columns>
    </asp:GridView>
    <asp:ObjectDataSource ID="NotificationTypeDataSource" runat="server" OldValuesParameterFormatString="{0}"
        SelectMethod="LoadAllNotificationType" TypeName="DL_WEB.DAL.Client.NotificationType"
        DeleteMethod="Delete">
        <DeleteParameters>
            <asp:Parameter Name="notificationTypeID" Type="Int32" />
        </DeleteParameters>
    </asp:ObjectDataSource>
</asp:Content>
