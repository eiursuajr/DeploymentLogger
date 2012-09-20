<%@ Page Language="C#" MasterPageFile="~/default.master" AutoEventWireup="true" CodeFile="UserPassword.aspx.cs"
    Inherits="UserPassword" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">

    <script language="javascript" type="text/javascript">
    <!--
    setTimeout("HideElement('<% = ErrorLabel.ClientID %>')", 5000);
    
    function HideElement(elementId)
    {
        var elem = document.getElementById(elementId);
        if (elem)
            elem.style.display = 'none'
    }
    //-->
    </script>

    <div class="pagecaption">
        Change password</div>
    <table>
        <tr>
            <td class="fieldname">
                Login</td>
            <td class="field" style="width: 80%">
                <asp:TextBox ID="Login" runat="server" Columns="58" ReadOnly="True" MaxLength="50"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="*"
                    CssClass="error" ControlToValidate="Login"></asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td class="fieldname">
                New Password</td>
            <td class="field">
                <asp:TextBox ID="NewPassword" runat="server" Columns="58" TextMode="Password" MaxLength="50"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="*"
                    CssClass="error" ControlToValidate="NewPassword"></asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr valign="top">
            <td class="fieldname" style="white-space: nowrap">
                Confirm New Password</td>
            <td class="field">
                <asp:TextBox ID="NewPassword1" runat="server" Columns="58" TextMode="Password" MaxLength="50"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator3" Display="Dynamic" runat="server"
                    ErrorMessage="*" CssClass="error" ControlToValidate="NewPassword1"></asp:RequiredFieldValidator>
                <br />
                <asp:CompareValidator ID="CompareValidator1" runat="server" ControlToCompare="NewPassword"
                    ControlToValidate="NewPassword1" CssClass="error" Display="Dynamic" Font-Size="12px"
                    ErrorMessage="The Confirm New Password must match the New Password entry.<br />"></asp:CompareValidator>
                <asp:Label ID="ErrorLabel" runat="server" CssClass="error" Visible="false" Font-Size="12px">New Password invalid. New Password length minimum: {0}.<br /> Non-alphanumeric characters required: {1}.</asp:Label>
            </td>
        </tr>
        <tr>
            <td>
            </td>
            <td>
                <asp:LinkButton ID="ChangeButton" runat="server" CssClass="newitem" Text="Change Password"
                    OnClick="ChangeButton_Click"></asp:LinkButton>&nbsp; <a href="userlist.aspx" class="newitem">
                        Cancel</a>
            </td>
        </tr>
    </table>
</asp:Content>
