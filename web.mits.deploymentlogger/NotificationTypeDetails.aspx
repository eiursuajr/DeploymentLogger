<%@ Page Language="C#" MasterPageFile="~/default.master" AutoEventWireup="true" CodeFile="NotificationTypeDetails.aspx.cs"
    Inherits="NotificationTypeDetails" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">

    <script language="javascript" type="text/javascript">
    <!--
        function NameValidation(source, arguments)
        {
            arguments.IsValid = RequiredValidate("<% = NotificationTypeDetailsView.Rows[0].Controls[1].Controls[1].ClientID %>");
        }
    //-->
    </script>

    <asp:DetailsView ID="NotificationTypeDetailsView" runat="server" AutoGenerateRows="False"
        GridLines="None" DataKeyNames="NotificationTypeID" DataSourceID="NotificationTypeDataSource"
        DefaultMode="Edit" OnItemCommand="NotificationTypeDetailsView_ItemCommand" Caption="Notification Type Details">
        <EditRowStyle CssClass="fieldname" />
        <CommandRowStyle CssClass="commandrow" />
        <Fields>
            <asp:TemplateField HeaderText="Name">
                <ItemTemplate>
                    <asp:TextBox ID="Name" runat="server" MaxLength="255" Columns="60" Text='<%# Bind("Name") %>'></asp:TextBox>
                    <asp:CustomValidator ID="CustomValidator1" runat="server" ClientValidationFunction="NameValidation"
                        ErrorMessage="*" CssClass="error"></asp:CustomValidator>
                </ItemTemplate>
                <ControlStyle Width="320px" />
                <ItemStyle CssClass="field" />
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Description" HeaderStyle-VerticalAlign="Top">
                <ItemTemplate>
                    <asp:TextBox ID="Description" runat="server" Text='<%# Bind("Description") %>' TextMode="MultiLine"
                        Columns="60" Rows="8" MaxLength="1024"></asp:TextBox>
                </ItemTemplate>
                <ControlStyle Width="320px" />
                <ItemStyle CssClass="field" />
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Notification E-mail">
                <ItemTemplate>
                </ItemTemplate>
                <ControlStyle Width="320px" />
                <ItemStyle CssClass="field" />
            </asp:TemplateField>
            <asp:BoundField HeaderText="Default Header" DataField="NotificationEmailDefaultHeader"
                ControlStyle-Width="320px" ItemStyle-CssClass="field" />
            <asp:TemplateField HeaderText="Default Description" HeaderStyle-VerticalAlign="Top">
                <ItemTemplate>
                    <asp:TextBox ID="NotificationEmailDefaultDescription" runat="server" Text='<%# Bind("NotificationEmailDefaultDescription") %>'
                        TextMode="MultiLine" Columns="60" Rows="8" MaxLength="8000"></asp:TextBox>
                </ItemTemplate>
                <ControlStyle Width="320px" />
                <ItemStyle CssClass="field" />
            </asp:TemplateField>
            <asp:CommandField ShowEditButton="True" />
        </Fields>
    </asp:DetailsView>
    <asp:ObjectDataSource ID="NotificationTypeDataSource" runat="server" OldValuesParameterFormatString="{0}"
        SelectMethod="LoadNotificationTypeByPrimaryKey" TypeName="DL_WEB.DAL.Client.NotificationType"
        UpdateMethod="Update" OnUpdated="NotificationTypeDataSource_Updated">
        <SelectParameters>
            <asp:QueryStringParameter DefaultValue="0" Name="notificationTypeID" QueryStringField="NotificationTypeID"
                Type="Int32" />
        </SelectParameters>
        <UpdateParameters>
            <asp:Parameter Name="notificationTypeID" Type="Int32" />
            <asp:Parameter Name="name" Type="String" />
            <asp:Parameter Name="description" Type="String" />
            <asp:Parameter Name="notificationEmailDefaultHeader" Type="String" />
            <asp:Parameter Name="notificationEmailDefaultDescription" Type="String" />
        </UpdateParameters>
    </asp:ObjectDataSource>
</asp:Content>
