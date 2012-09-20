<%@ Page Language="C#" MasterPageFile="~/default.master" AutoEventWireup="true" CodeFile="ProjectNotificationItem.aspx.cs"
    Inherits="ProjectNotificationItem" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <table>
        <tr>
            <td class="fieldname">
                <asp:Label ID="ObjectNameLabel" runat="server"></asp:Label></td>
            <td>
                <asp:DropDownList ID="ProjectNotificationItemList" runat="server">
                </asp:DropDownList>
            </td>
        </tr>
        <tr class="commandrow">
            <td colspan="2">
                <asp:LinkButton ID="SaveButton" runat="server" OnClick="SaveButton_Click" Text="Save"></asp:LinkButton>&nbsp;
                <asp:LinkButton ID="CancelButton" runat="server" Text="Cancel" OnClick="CancelButton_Click"></asp:LinkButton>
            </td>
        </tr>
    </table>
    <asp:ObjectDataSource ID="RoleDataSource" runat="server" SelectMethod="LoadAllRole"
        TypeName="DL_WEB.DAL.Client.Role"></asp:ObjectDataSource>
</asp:Content>
