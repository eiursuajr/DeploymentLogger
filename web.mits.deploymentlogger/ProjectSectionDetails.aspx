<%@ Page Language="C#" MasterPageFile="~/default.master" AutoEventWireup="true" CodeFile="ProjectSectionDetails.aspx.cs"
    Inherits="ProjectSectionDetails" %>

<%@ Register Src="Controls/ProjectInfo.ascx" TagName="ProjectInfo" TagPrefix="uc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">

    <script language="javascript" type="text/javascript">
        function UpdateValidation(source, arguments)
        {
            arguments.IsValid = true;
            if(document.getElementById("<% = ProjectSectionDetailsView.Rows[0].Controls[1].Controls[1].ClientID %>").value.length == 0)
                arguments.IsValid = false;
        }
    </script>

    <div class="pagecaption">
        Project Section Details</div>
    <uc1:ProjectInfo ID="ProjectInfo1" runat="server" />
    <asp:DetailsView ID="ProjectSectionDetailsView" runat="server" GridLines="None" DefaultMode="Edit"
        AutoGenerateRows="False" DataKeyNames="ProjectSectionID" DataSourceID="ProjectSectionDataSource"
        OnItemCommand="ProjectSectionDetailsView_ItemCommand" OnItemUpdated="ProjectSectionDetailsView_ItemUpdated">
        <EditRowStyle CssClass="fieldname" />
        <CommandRowStyle CssClass="commandrow" />
        <Fields>
            <asp:TemplateField HeaderText="Name">
                <ItemTemplate>
                    <asp:TextBox ID="Name" runat="server" Columns="60" Text='<%# Bind("Name") %>'></asp:TextBox>
                    <asp:CustomValidator ID="CustomValidator1" runat="server" ClientValidationFunction="UpdateValidation"
                        ErrorMessage="*" CssClass="error"></asp:CustomValidator>
                </ItemTemplate>
                <ControlStyle Width="320px" />
                <ItemStyle CssClass="field" />
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Description">
                <ItemTemplate>
                    <asp:TextBox ID="Description" runat="server" TextMode="MultiLine" Columns="60" Rows="8"
                        Text='<%# Bind("Description") %>'></asp:TextBox>
                </ItemTemplate>
                <HeaderStyle VerticalAlign="Top" />
                <ItemStyle CssClass="field" />
            </asp:TemplateField>
            <asp:CommandField ShowEditButton="True" />
        </Fields>
    </asp:DetailsView>
    <asp:ObjectDataSource ID="ProjectSectionDataSource" runat="server" OldValuesParameterFormatString="{0}"
        SelectMethod="LoadProjectSectionByPrimaryKey" TypeName="DL_WEB.DAL.Client.ProjectSection"
        UpdateMethod="Update" OnUpdated="ProjectSectionDataSource_Updated">
        <UpdateParameters>
            <asp:Parameter Name="projectSectionID" Type="Int32" />
            <asp:QueryStringParameter DefaultValue="0" Name="projectID" QueryStringField="ProjectID"
                Type="Int32" />
            <asp:Parameter Name="name" Type="String" />
            <asp:Parameter Name="description" Type="String" />
        </UpdateParameters>
        <SelectParameters>
            <asp:QueryStringParameter DefaultValue="0" Name="projectSectionID" QueryStringField="ProjectSectionID"
                Type="Int32" />
        </SelectParameters>
    </asp:ObjectDataSource>
</asp:Content>
