<%@ Page Language="C#" MasterPageFile="~/default.master" AutoEventWireup="true" CodeFile="Organizations.aspx.cs"
    Inherits="Organizations" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">

    <script type="text/javascript" language="javascript">
    <!--
    function Delete(userCount)
    {
        var msg = 'Do you really want to delete organization?';
        if (userCount > 0)
            msg = 'This organization contains ' + userCount + ' user' + (userCount > 1 ? 's' : '') + '.\r\n' + msg
        return confirm(msg);
    }
    //-->
    </script>

    <div class="pagecaption">
        Organizations</div>
    <asp:HyperLink NavigateUrl="~/OrganizationEdit.aspx" ID="NewOrganizationLink" runat="server"
        CssClass="newitem" Text="New Organization"></asp:HyperLink><br />
    <br />
    <asp:GridView ID="OrganizationList" runat="server" AutoGenerateColumns="False" CellPadding="4"
        GridLines="None" DataKeyNames="OrganizationID">
        <HeaderStyle CssClass="tableheader" />
        <FooterStyle CssClass="tablefooter" />
        <PagerStyle CssClass="tablepager" />
        <RowStyle CssClass="tablerow" />
        <AlternatingRowStyle CssClass="tablerowalt" />
        <Columns>
            <asp:HyperLinkField DataNavigateUrlFields="OrganizationID" DataNavigateUrlFormatString="OrganizationEdit.aspx?OrganizationID={0}"
                DataTextField="Name" HeaderText="Name" />
            <asp:BoundField DataField="DatabaseName" HeaderText="Database Name" />
            <asp:TemplateField>
                <ItemTemplate>
                    <a href='Organizations.aspx?Action=delete&OrganizationID=<%# Eval("OrganizationID") %>'
                        onclick='return Delete(<%# Eval("UserCount") %>);'>Delete</a>
                </ItemTemplate>
            </asp:TemplateField>
        </Columns>
    </asp:GridView>
</asp:Content>
