<%@ Page Language="C#" MasterPageFile="~/default.master" AutoEventWireup="true" CodeFile="UserProfile.aspx.cs"
    Inherits="UserProfile" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div class="pagecaption">
        Account Summary</div>
    <table>
        <tr>
            <td class="fieldname">
                First Name</td>
            <td>
                <asp:Label ID="tbFirstName" runat="server"></asp:Label>
            </td>
        </tr>
        <tr>
            <td class="fieldname">
                Last Name</td>
            <td>
                <asp:Label ID="tbLastName" runat="server"></asp:Label></td>
        </tr>
        <tr>
            <td class="fieldname">
                Middle Name</td>
            <td>
                <asp:Label ID="tbMiddleName" runat="server"></asp:Label></td>
        </tr>
        <tr>
            <td class="fieldname">
                Job Title</td>
            <td>
                <asp:Label ID="tbJobTitle" runat="server"></asp:Label></td>
        </tr>
        <tr>
            <td class="fieldname">
                Home Phone</td>
            <td>
                <asp:Label ID="tbHomePhone" runat="server"></asp:Label></td>
        </tr>
        <tr>
            <td class="fieldname">
                Work Phone</td>
            <td>
                <asp:Label ID="tbWorkPhone" runat="server"></asp:Label></td>
        </tr>
    </table>
    <br />
    <a href="UserProfileEdit.aspx">Edit personal info</a><br />
    <a href="ChangePassword.aspx">Change password</a>
</asp:Content>
