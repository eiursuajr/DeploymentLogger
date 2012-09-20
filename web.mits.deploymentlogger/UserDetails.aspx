<%@ Page Language="C#" MasterPageFile="~/default.master" AutoEventWireup="true" CodeFile="UserDetails.aspx.cs"
    Inherits="UserDetails" %>

<%@ Register Assembly="RadWindow.Net2" Namespace="Telerik.WebControls" TagPrefix="radW" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">

    <script type="text/javascript" language="javascript">
    <!--
    function ShowDialog()
    {
        ValidateSubmit = false;
	    var oWnd = window.radopen(null, "DialogWindow");
	    oWnd.SetUrl(oWnd.GetUrl());
    }
    
    function Delete()
    {
        return confirm('Do you really want to delete company information?');
    }
    
    <%  if (this.UserID == 0) 
        {   %>
    var ValidateSubmit = true;
    document.forms[0].onsubmit = function ()
    {
        if (ValidateSubmit)
        {
            var ValidationResult = WebForm_OnSubmit();
            if (ValidationResult)
                alert('The user is inactive now.\r\nPlease change the password to activate the user.');
            return ValidationResult;
        }
        return true;
    }
    <%  }   %>
	//-->
    </script>

    <div class="pagecaption">
        User Details</div>
    <table>
        <tr>
            <td class="fieldname" style="width: 85px;">
                Login</td>
            <td>
                <asp:TextBox ID="tbLogin" runat="server" Columns="58" MaxLength="64" AutoCompleteType="Email"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="tbLogin"
                    ErrorMessage="*" CssClass="error"></asp:RequiredFieldValidator></td>
        </tr>
        <tr>
            <td class="fieldname" valign="top">
                Is Inactive</td>
            <td>
                <asp:CheckBox ID="cbIsInactive" runat="server"></asp:CheckBox></td>
        </tr>
        <tr>
            <td class="fieldname">
                Is Approved</td>
            <td>
                <asp:CheckBox ID="cbIsApproved" runat="server"></asp:CheckBox></td>
        </tr>
        <tr>
            <td colspan="2">
                <asp:Panel ID="Panel1" runat="server" GroupingText="Personal Information" HorizontalAlign="Left">
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
                    </table>
                </asp:Panel>
            </td>
        </tr>
        <tr>
            <td colspan="2">
                <asp:Panel ID="Panel2" runat="server" GroupingText="Company Information" Height="100%"
                    Width="100%" HorizontalAlign="Left">
                    <a id="AddLink" href="javascript:ShowDialog();" class="newitem">Add Company Role</a><br />
                    <br />
                    <asp:GridView ID="gvUserRoles" runat="server" DataSourceID="UserOrganizationRoleDataSource"
                        CellPadding="4" GridLines="None" AllowSorting="True" AutoGenerateColumns="False"
                        OnRowCommand="GridView1_RowCommand">
                        <HeaderStyle CssClass="tableheader" />
                        <FooterStyle CssClass="tablefooter" />
                        <PagerStyle CssClass="tablepager" />
                        <RowStyle CssClass="tablerow" />
                        <AlternatingRowStyle CssClass="tablerowalt" />
                        <Columns>
                            <asp:BoundField DataField="OrganizationName" HeaderText="Organization" />
                            <asp:BoundField DataField="RoleName" HeaderText="Role" />
                            <asp:TemplateField>
                                <ItemTemplate>
                                    <asp:LinkButton CommandName="RemoveRole" ID="DeleteButton" runat="server" OnClientClick="return Delete();"
                                        Text="Delete"></asp:LinkButton>
                                </ItemTemplate>
                            </asp:TemplateField>
                        </Columns>
                    </asp:GridView>
                    <asp:ObjectDataSource ID="UserOrganizationRoleDataSource" runat="server" SelectMethod="LoadUserOrganizationRole_Session"
                        TypeName="DL_WEB.DAL.Master.OrganizationUserRole">
                        <SelectParameters>
                            <asp:QueryStringParameter DefaultValue="0" Name="iUserID" QueryStringField="UserID"
                                Type="Int32" />
                            <asp:SessionParameter DefaultValue="null" Name="UserRoles" SessionField="UserRoles" />
                        </SelectParameters>
                    </asp:ObjectDataSource>
                </asp:Panel>
            </td>
        </tr>
        <tr class="commandrow">
            <td colspan="2">
                <asp:LinkButton ID="linkbtnSave" runat="server" OnClick="linkbtnSave_Click" OnClientClick="ValidateSubmit = true;">Update</asp:LinkButton>
                &nbsp;<asp:LinkButton ID="CancelLink" runat="server" CausesValidation="false" OnClientClick="ValidateSubmit = false;"
                    OnClick="CancelLink_Click">Cancel</asp:LinkButton>
            </td>
        </tr>
    </table>
    <radW:RadWindowManager ID="RadWindowManager1" runat="server" Modal="True" Behavior="Close,Move">
        <Windows>
            <radW:RadWindow ID="DialogWindow" runat="server" Width="450px" Height="150px" Modal="true"
                Title="Add User to Organization" VisibleStatusbar="false" OpenerElementId="AddLink"
                NavigateUrl="OrganizationUserRoleDetails.aspx" />
        </Windows>
    </radW:RadWindowManager>
</asp:Content>
