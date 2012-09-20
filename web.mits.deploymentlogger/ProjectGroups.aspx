<%@ Page Language="C#" MasterPageFile="~/default.master" AutoEventWireup="true" CodeFile="ProjectGroups.aspx.cs"
    Inherits="ProjectGroups" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">

    <script type="text/javascript" language="javascript">
        function ConfirmDelete()
        {
            return confirm('Do you really want to delete project group?');
        }
    </script>

    <div class="pagecaption">
        Project Groups</div>
    <asp:HyperLink ID="NewProjectGroupLink" runat="server" CssClass="newitem" NavigateUrl="~/projectgroupdetails.aspx"
        Text="New Project Group"></asp:HyperLink><br />
    <br />
    <asp:GridView ID="ProjectGroupList" runat="server" AutoGenerateColumns="False" CellPadding="4"
        DataSourceID="ProjectGroupDataSource" GridLines="None" OnRowCommand="ProjectGroupList_RowCommand"
        DataKeyNames="ProjectGroupID" OnRowDeleted="ProjectGroupList_RowDeleted">
        <HeaderStyle CssClass="tableheader" />
        <FooterStyle CssClass="tablefooter" />
        <PagerStyle CssClass="tablepager" />
        <RowStyle CssClass="tablerow" />
        <AlternatingRowStyle CssClass="tablerowalt" />
        <Columns>
            <asp:HyperLinkField DataNavigateUrlFields="ProjectGroupID" DataNavigateUrlFormatString="ProjectGroupDetails.aspx?id={0}"
                DataTextField="Name" HeaderText="Project Group" />
            <asp:BoundField HeaderText="Description" DataField="Description" HtmlEncode="false" />
            <asp:TemplateField ShowHeader="False">
                <ItemTemplate>
                    <asp:LinkButton ID="linkbDelete" runat="server" OnClientClick="return ConfirmDelete();"
                        CommandName="Delete" CommandArgument='<%# Bind("ProjectGroupID") %>' Text="Delete"></asp:LinkButton>
                </ItemTemplate>
            </asp:TemplateField>
        </Columns>
    </asp:GridView>
    <asp:ObjectDataSource ID="ProjectGroupDataSource" runat="server" SelectMethod="LoadAllProjectGroup"
        TypeName="DL_WEB.DAL.Client.ProjectGroup" DeleteMethod="Delete">
        <DeleteParameters>
            <asp:Parameter Name="projectGroupID" Type="Int32" />
        </DeleteParameters>
    </asp:ObjectDataSource>
</asp:Content>
