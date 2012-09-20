<%@ Page Language="C#" MasterPageFile="~/default.master" AutoEventWireup="true" CodeFile="Roles.aspx.cs"
    Inherits="Roles" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">

    <script type="text/javascript" language="javascript">
        function ConfirmDelete()
        {
            return confirm('Do you really want to delete role?');
        }
    </script>

    <div class="pagecaption">
        Roles</div>
    <asp:HyperLink ID="NewRoleLink" runat="server" CssClass="newitem" NavigateUrl="~/roledetails.aspx"
        Text="New Role"></asp:HyperLink><br />
    <br />
    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataSourceID="RolesDataSource"
        OnRowDeleted="GridView1_RowDeleted" GridLines="none" CellPadding="4">
        <HeaderStyle CssClass="tableheader" />
        <FooterStyle CssClass="tablefooter" />
        <PagerStyle CssClass="tablepager" />
        <RowStyle CssClass="tablerow" />
        <AlternatingRowStyle CssClass="tablerowalt" />
        <Columns>
            <asp:HyperLinkField DataNavigateUrlFields="RoleID" DataNavigateUrlFormatString="RoleDetails.aspx?RoleID={0}"
                DataTextField="Name" HeaderText="Name"></asp:HyperLinkField>
            <asp:HyperLinkField DataNavigateUrlFields="RoleID" DataNavigateUrlFormatString="RoleActions.aspx?RoleID={0}"
                DataTextFormatString="Permissions" HeaderText="Manage" DataTextField="RoleID"></asp:HyperLinkField>
            <asp:TemplateField ShowHeader="False">
                <ItemTemplate>
                    <asp:LinkButton ID="linkbDelete" runat="server" OnClientClick="return ConfirmDelete();"
                        CausesValidation="False" CommandName="Delete" OnCommand="linkbDelete_OnCommand"
                        CommandArgument='<%# Bind("RoleID") %>' Text="Delete"></asp:LinkButton>
                </ItemTemplate>
            </asp:TemplateField>
        </Columns>
    </asp:GridView>
    <asp:ObjectDataSource ID="RolesDataSource" runat="server" SelectMethod="LoadAllRole"
        TypeName="DL_WEB.DAL.Master.Role"></asp:ObjectDataSource>
</asp:Content>
