<%@ Page Language="C#" MasterPageFile="~/default.master" AutoEventWireup="true" CodeFile="UserProfileEdit.aspx.cs"
    Inherits="UserProfileEdit" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div class="pagecaption">
        Edit personal info</div>
    <table>
        <tr>
            <td class="fieldname">
                First Name</td>
            <td>
                <asp:TextBox ID="tbFirstName" runat="server" AutoCompleteType="FirstName"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td class="fieldname">
                Last Name</td>
            <td>
                <asp:TextBox ID="tbLastName" runat="server" AutoCompleteType="LastName"></asp:TextBox></td>
        </tr>
        <tr>
            <td class="fieldname">
                Middle Name</td>
            <td>
                <asp:TextBox ID="tbMiddleName" runat="server"></asp:TextBox></td>
        </tr>
        <tr>
            <td class="fieldname">
                Job Title</td>
            <td>
                <asp:TextBox ID="tbJobTitle" runat="server"></asp:TextBox></td>
        </tr>
        <tr>
            <td class="fieldname">
                Home Phone</td>
            <td>
                <asp:TextBox ID="tbHomePhone" runat="server"></asp:TextBox></td>
        </tr>
        <tr>
            <td class="fieldname">
                Work Phone</td>
            <td>
                <asp:TextBox ID="tbWorkPhone" runat="server"></asp:TextBox></td>
        </tr>
        <tr>
            <td>
            </td>
            <td>
                <asp:LinkButton ID="linkbtnSave" CssClass="newitem" runat="server" OnClick="linkbtnSave_Click">Update</asp:LinkButton>
                &nbsp;<a href="UserProfile.aspx" class="newitem">Cancel</a>
            </td>
        </tr>
    </table>
</asp:Content>
