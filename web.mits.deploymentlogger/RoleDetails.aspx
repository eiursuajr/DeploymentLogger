<%@ Page Language="C#" MasterPageFile="~/default.master" AutoEventWireup="true" CodeFile="RoleDetails.aspx.cs"
    Inherits="RoleDetails" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">

    <script language="javascript" type="text/javascript">
    <!--
        function NameValidation(source, arguments)
        {
            arguments.IsValid = RequiredValidate("<% = RoleDetailsView.Rows[0].Controls[1].Controls[1].ClientID %>");
        }
    //-->
    </script>

    <asp:DetailsView ID="RoleDetailsView" runat="server" AutoGenerateRows="False" DataSourceID="RolesDataSource"
        DefaultMode="Edit" GridLines="none" DataKeyNames="RoleID" OnItemCommand="RoleDetailsView_ItemCommand"
        OnItemUpdated="RoleDetailsView_ItemUpdated" Caption="Role Details">
        <EditRowStyle CssClass="fieldname" />
        <CommandRowStyle CssClass="commandrow" />
        <Fields>
            <asp:TemplateField HeaderText="Name">
                <ItemTemplate>
                    <asp:TextBox ID="Name" runat="server" MaxLength="50" Columns="60" Text='<%# Bind("Name") %>'></asp:TextBox>
                    <asp:CustomValidator ID="CustomValidator1" runat="server" ClientValidationFunction="NameValidation"
                        ErrorMessage="*" CssClass="error"></asp:CustomValidator>
                </ItemTemplate>
                <ControlStyle Width="320px" />
                <ItemStyle CssClass="field" />
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Description" ItemStyle-CssClass="field" HeaderStyle-VerticalAlign="top">
                <ItemTemplate>
                    <asp:TextBox ID="Description" runat="server" Text='<%# Bind("Description") %>' TextMode="MultiLine"
                        Columns="60" Rows="8" MaxLength="1024"></asp:TextBox>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:CommandField ShowEditButton="True" />
        </Fields>
    </asp:DetailsView>
    <asp:ObjectDataSource ID="RolesDataSource" runat="server" InsertMethod="Update" SelectMethod="LoadRoleByPrimaryKey"
        TypeName="DL_WEB.DAL.Master.Role" UpdateMethod="Update">
        <UpdateParameters>
            <asp:Parameter Name="RoleID" Type="Int32" />
            <asp:Parameter Name="Name" Type="String" />
            <asp:Parameter Name="Description" Type="String" />
        </UpdateParameters>
        <SelectParameters>
            <asp:QueryStringParameter DefaultValue="0" Name="RoleID" QueryStringField="RoleID"
                Type="Int32" />
        </SelectParameters>
        <InsertParameters>
            <asp:Parameter Name="RoleID" Type="Int32" />
            <asp:Parameter Name="Name" Type="String" />
            <asp:Parameter Name="Description" Type="String" />
        </InsertParameters>
    </asp:ObjectDataSource>
</asp:Content>
