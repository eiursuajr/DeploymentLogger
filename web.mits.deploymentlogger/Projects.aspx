<%@ Page Language="C#" MasterPageFile="~/default.master" AutoEventWireup="true" CodeFile="Projects.aspx.cs"
    Inherits="Projects" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div class="pagecaption">
        Projects</div>
    <asp:HyperLink NavigateUrl="~/projectdetails.aspx" ID="NewProjectLink" runat="server"
        CssClass="newitem" Text="New Project"></asp:HyperLink><br />
    <br />
    <asp:GridView ID="gvProjects" runat="server" AutoGenerateColumns="False" CellPadding="4"
        GridLines="None" AllowPaging="True" OnRowDataBound="gvProjects_RowDataBound"
        DataSourceID="ProjectDataSource">
        <HeaderStyle CssClass="tableheader" />
        <FooterStyle CssClass="tablefooter" />
        <PagerStyle CssClass="tablepager" />
        <RowStyle CssClass="tablerow" />
        <AlternatingRowStyle CssClass="tablerowalt" />
        <Columns>
            <asp:HyperLinkField DataNavigateUrlFields="ProjectID" DataNavigateUrlFormatString="ProjectDetails.aspx?ProjectID={0}"
                DataTextField="Name" HeaderText="Name" />
            <asp:TemplateField HeaderText="Status">
                <ItemTemplate>
                    <asp:Label ID="ProjectStatusName" runat="server"></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Project Category">
                <ItemTemplate>
                    <asp:Label ID="ProjectCategoryName" runat="server"></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Start Date">
                <ItemTemplate>
                    <%# String.Format("{0:d}", Eval("StartDate"))%>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Finish Date">
                <ItemTemplate>
                    <%# String.Format("{0:d}", Eval("FinishDate"))%>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:HyperLinkField DataNavigateUrlFields="ProjectID" DataNavigateUrlFormatString="Updates.aspx?ProjectID={0}"
                Text="Updates" />
            <asp:HyperLinkField DataNavigateUrlFields="ProjectID" DataNavigateUrlFormatString="AvailableLogEntries.aspx?ProjectID={0}"
                Text="Log Entries" />
            <asp:HyperLinkField DataNavigateUrlFields="ProjectID" DataNavigateUrlFormatString="ProjectNotifications.aspx?ProjectID={0}"
                Text="Assigned Notifications" />
            <asp:HyperLinkField DataNavigateUrlFields="ProjectID" DataNavigateUrlFormatString="ProjectSections.aspx?ProjectID={0}"
                Text="Sections" />
            <asp:TemplateField>
                <ItemTemplate>
                    <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl='<%# String.Format("~/Reports/DeploymentLogReport.aspx?ProjectID={0}&OrganizationID={1}", Eval("ProjectID"), OrganizationID) %>'
                        Text="Deployment Log"></asp:HyperLink>
                </ItemTemplate>
            </asp:TemplateField>
        </Columns>
    </asp:GridView>
    <asp:ObjectDataSource ID="ProjectDataSource" runat="server" SelectMethod="LoadAllProjectByOrganizationID"
        TypeName="DL_WEB.DAL.Client.Project">
        <SelectParameters>
            <asp:SessionParameter DefaultValue="0" Name="organizationID" SessionField="OrganizationID"
                Type="Int32" />
        </SelectParameters>
    </asp:ObjectDataSource>
</asp:Content>
