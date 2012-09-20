<%@ Page Language="C#" MasterPageFile="~/default.master" AutoEventWireup="true" CodeFile="OrganizationEdit.aspx.cs"
    Inherits="OrganizationEdit" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">

    <script language="javascript" type="text/javascript">
    <!--
    function NameValidation(source, arguments)
    {
        arguments.IsValid = RequiredValidate("<% = OrganizationDetailsView.Rows[0].Controls[1].Controls[1].ClientID %>");
    }

    function DatabaseValidation(source, arguments)
    {
        arguments.IsValid = ListValidate("<% = OrganizationDetailsView.Rows[2].Controls[1].Controls[1].ClientID %>");
    }
    //-->
    </script>

    <asp:DetailsView ID="OrganizationDetailsView" runat="server" GridLines="None" DefaultMode="Edit"
        DataSourceID="OrganizationDataSource" AutoGenerateRows="False" DataKeyNames="OrganizationID"
        Caption="Organization Details" AutoGenerateEditButton="True" OnItemCommand="OrganizationDetailsView_ItemCommand"
        OnItemUpdated="OrganizationDetailsView_ItemUpdated">
        <EditRowStyle CssClass="fieldname" />
        <CommandRowStyle CssClass="commandrow" />
        <Fields>
            <asp:TemplateField HeaderText="Name">
                <ItemTemplate>
                    <asp:TextBox ID="Name" runat="server" MaxLength="255" Columns="60" Text='<%# Bind("Name") %>'></asp:TextBox>
                    <asp:CustomValidator ID="CustomValidator1" runat="server" ClientValidationFunction="NameValidation"
                        ErrorMessage="*" CssClass="error"></asp:CustomValidator>
                </ItemTemplate>
                <ItemStyle CssClass="field" />
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Description">
                <ItemTemplate>
                    <asp:TextBox ID="Description" runat="server" MaxLength="50" Columns="60" Text='<%# Bind("Description") %>'></asp:TextBox>
                </ItemTemplate>
                <ItemStyle CssClass="field" />
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Database">
                <ItemTemplate>
                    <asp:DropDownList SelectedValue='<%# Bind("DatabaseID") %>' AppendDataBoundItems="true"
                        ID="DatabaseID" runat="server" DataSourceID="DatabaseDataSource" DataTextField="Name"
                        DataValueField="DatabaseID" OnInit="List_Init">
                        <asp:ListItem Value="0">[Please select...]</asp:ListItem>
                    </asp:DropDownList>
                    <asp:CustomValidator ID="CustomValidator2" runat="server" ClientValidationFunction="DatabaseValidation"
                        ErrorMessage="*" CssClass="error"></asp:CustomValidator>
                </ItemTemplate>
                <ItemStyle CssClass="field" />
            </asp:TemplateField>
        </Fields>
    </asp:DetailsView>
    <asp:ObjectDataSource ID="OrganizationDataSource" runat="server" SelectMethod="LoadOrganizationByPrimaryKey"
        TypeName="DL_WEB.DAL.Master.Organization" InsertMethod="Update" UpdateMethod="Update">
        <SelectParameters>
            <asp:QueryStringParameter DefaultValue="0" Name="OrganizationID" QueryStringField="OrganizationID"
                Type="Int32" />
        </SelectParameters>
        <UpdateParameters>
            <asp:Parameter Name="organizationID" Type="Int32" />
            <asp:Parameter Name="name" Type="String" />
            <asp:Parameter Name="description" Type="String" />
            <asp:Parameter Name="databaseID" Type="Int32" />
        </UpdateParameters>
        <InsertParameters>
            <asp:Parameter Name="organizationID" Type="Int32" />
            <asp:Parameter Name="name" Type="String" />
            <asp:Parameter Name="description" Type="String" />
            <asp:Parameter Name="databaseID" Type="Int32" />
        </InsertParameters>
    </asp:ObjectDataSource>
    <asp:ObjectDataSource ID="DatabaseDataSource" runat="server" SelectMethod="LoadAllDatabases"
        TypeName="DL_WEB.DAL.Master.Database"></asp:ObjectDataSource>
</asp:Content>
