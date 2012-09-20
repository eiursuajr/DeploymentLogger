<%@ Page Language="C#" MasterPageFile="~/default.master" AutoEventWireup="true" CodeFile="UserList.aspx.cs"
    Inherits="UserList" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <span class="pagecaption">Users</span><br />
    <br />
    <asp:HyperLink ID="NewUserLink" runat="server" CssClass="newitem" NavigateUrl="~/UserDetails.aspx"
        Text="New User"></asp:HyperLink><br />
    <br />
    <asp:GridView ID="gvUsers" runat="server" AllowPaging="True" AutoGenerateColumns="False"
        CellPadding="4" DataSourceID="UserDataSource" GridLines="None">
        <HeaderStyle CssClass="tableheader" />
        <FooterStyle CssClass="tablefooter" />
        <PagerStyle CssClass="tablepager" />
        <RowStyle CssClass="tablerow" />
        <AlternatingRowStyle CssClass="tablerowalt" />
        <Columns>
            <asp:HyperLinkField DataNavigateUrlFields="UserID" DataNavigateUrlFormatString="UserDetails.aspx?UserID={0}"
                DataTextField="Email" HeaderText="Email" />
            <asp:BoundField DataField="LastLoginDate" HeaderText="Last Login" />
            <asp:BoundField DataField="IsApproved" HeaderText="Is Approved" />
            <asp:BoundField DataField="IsInactive" HeaderText="Is Inactive" />
            <asp:TemplateField>
                <ItemTemplate>
                    <a href="Userpassword.aspx?Login=<%# Server.UrlEncode(Convert.ToString(Eval("Login"))) %>">
                        change password</a>
                </ItemTemplate>
            </asp:TemplateField>
        </Columns>
    </asp:GridView>
    <asp:ObjectDataSource ID="UserDataSource" runat="server" SelectMethod="LoadAllUser"
        TypeName="DL_WEB.DAL.Master.User"></asp:ObjectDataSource>
</asp:Content>
