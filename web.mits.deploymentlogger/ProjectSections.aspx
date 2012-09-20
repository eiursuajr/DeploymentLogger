<%@ Page Language="C#" MasterPageFile="~/default.master" AutoEventWireup="true" CodeFile="ProjectSections.aspx.cs"
    Inherits="ProjectSections" %>

<%@ Register Src="Controls/ProjectInfo.ascx" TagName="ProjectInfo" TagPrefix="uc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">

    <script type="text/javascript" language="javascript">
        function ConfirmDelete()
        {
            return confirm('Do you really want to delete project section?');
        }
    </script>

    <uc1:ProjectInfo ID="ProjectInfo1" runat="server" />
    <asp:Panel ID="Panel1" runat="server" GroupingText="Project Sections" Width="100%">
        <asp:HyperLink ID="NewProjectSectionLink" CssClass="newitem" runat="server" NavigateUrl="~/projectsectiondetails.aspx">New Project Section</asp:HyperLink><br />
        <br />
        <asp:GridView ID="SectionsList" runat="server" AutoGenerateColumns="False" CellPadding="4"
            GridLines="None" DataKeyNames="ProjectSectionID" DataSourceID="ProjectSectionDataSource"
            OnRowDeleted="SectionsList_RowDeleted" OnRowCommand="SectionsList_RowCommand">
            <HeaderStyle CssClass="tableheader" />
            <FooterStyle CssClass="tablefooter" />
            <PagerStyle CssClass="tablepager" />
            <RowStyle CssClass="tablerow" />
            <AlternatingRowStyle CssClass="tablerowalt" />
            <Columns>
                <asp:HyperLinkField DataNavigateUrlFields="ProjectSectionID,ProjectID" DataNavigateUrlFormatString="ProjectSectionDetails.aspx?ProjectSectionID={0}&ProjectID={1}"
                    DataTextField="Name" HeaderText="Name" />
                <asp:TemplateField>
                    <ItemTemplate>
                        <asp:LinkButton CommandName="Delete" CommandArgument='<%# Bind("ProjectSectionID") %>'
                            ID="DeleteButton" runat="server" OnClientClick="return ConfirmDelete();" Text="Delete"></asp:LinkButton>
                    </ItemTemplate>
                </asp:TemplateField>
            </Columns>
        </asp:GridView>
    </asp:Panel>
    <asp:ObjectDataSource ID="ProjectSectionDataSource" runat="server" DeleteMethod="Delete"
        SelectMethod="LoadAllProjectSectionByProjectID" TypeName="DL_WEB.DAL.Client.ProjectSection"
        OldValuesParameterFormatString="{0}">
        <DeleteParameters>
            <asp:Parameter Name="projectSectionID" Type="Int32" />
        </DeleteParameters>
        <SelectParameters>
            <asp:QueryStringParameter DefaultValue="0" Name="projectID" QueryStringField="ProjectID"
                Type="Int32" />
        </SelectParameters>
    </asp:ObjectDataSource>
</asp:Content>
