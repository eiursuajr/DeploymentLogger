<%@ Page Language="C#" AutoEventWireup="true" CodeFile="ProjectGroupDetails.aspx.cs"
    MasterPageFile="~/default.master" Inherits="ProjectGroupDetails" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">

    <script language="javascript" type="text/javascript">
    <!--
        function NameValidation(source, arguments)
        {
            arguments.IsValid = RequiredValidate("<% = tbName.ClientID %>");
        }
    //-->
    </script>

    <div class="pageCaption">
        Project Group Details</div>
    <table>
        <tr>
            <td class="fieldname">
                Name:</td>
            <td class="field">
                <asp:TextBox ID="tbName" runat="server" Columns="57" Width="320px" MaxLength="255"></asp:TextBox>
                <asp:CustomValidator ID="CustomValidator1" runat="server" ClientValidationFunction="NameValidation"
                    ErrorMessage="*" CssClass="error"></asp:CustomValidator></td>
        </tr>
        <tr>
            <td class="fieldname" valign="top">
                Description:</td>
            <td class="field">
                <asp:TextBox ID="tbDescription" runat="server" TextMode="MultiLine" Columns="60"
                    Rows="8" MaxLength="1024"></asp:TextBox></td>
        </tr>
        <tr class="commandrow">
            <td colspan="2">
                <asp:LinkButton ID="UpdateLink" runat="server" Text="Update" OnClick="UpdateLink_Click"></asp:LinkButton>
                <a href="projectgroups.aspx">Cancel</a>
            </td>
        </tr>
    </table>
</asp:Content>
