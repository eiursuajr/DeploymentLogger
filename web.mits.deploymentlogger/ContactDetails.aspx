<%@ Page Language="C#" MasterPageFile="~/default.master" AutoEventWireup="true" CodeFile="ContactDetails.aspx.cs"
    Inherits="ContactDetails" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">

    <script language="javascript" type="text/javascript">
    <!--
        function FirstNameValidation(source, arguments)
        {
            arguments.IsValid = RequiredValidate("<% = AddressBookDetailsView.Rows[0].Controls[1].Controls[1].ClientID %>");
        }
        
        function LastNameValidation(source, arguments)
        {
            arguments.IsValid = RequiredValidate("<% = AddressBookDetailsView.Rows[1].Controls[1].Controls[1].ClientID %>");
        }
        
        function PrimaryEmailValidation(source, arguments)
        {
            arguments.IsValid = EmailValidate("<% = AddressBookDetailsView.Rows[5].Controls[1].Controls[1].ClientID %>");
        }
    //-->
    </script>

    <asp:DetailsView ID="AddressBookDetailsView" runat="server" GridLines="None" DataKeyNames="EntryID"
        AutoGenerateRows="False" DefaultMode="Edit" DataSourceID="AddressBookDataSource"
        OnItemUpdated="AddressBookDetailsView_ItemUpdated" OnItemCommand="AddressBookDetailsView_ItemCommand"
        Caption="Contact details">
        <EditRowStyle CssClass="fieldname" />
        <CommandRowStyle CssClass="commandrow" />
        <Fields>
            <asp:TemplateField HeaderText="First Name">
                <ItemTemplate>
                    <asp:TextBox ID="FirstName" runat="server" MaxLength="255" Columns="60" Text='<%# Bind("FirstName") %>'></asp:TextBox>
                    <asp:CustomValidator ID="CustomValidator1" runat="server" ClientValidationFunction="FirstNameValidation"
                        ErrorMessage="*" CssClass="error"></asp:CustomValidator>
                </ItemTemplate>
                <ControlStyle Width="320px" />
                <ItemStyle CssClass="field" />
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Last Name">
                <ItemTemplate>
                    <asp:TextBox ID="LastName" runat="server" MaxLength="255" Columns="60" Text='<%# Bind("LastName") %>'></asp:TextBox>
                    <asp:CustomValidator ID="CustomValidator2" runat="server" ClientValidationFunction="LastNameValidation"
                        ErrorMessage="*" CssClass="error"></asp:CustomValidator>
                </ItemTemplate>
                <ControlStyle Width="320px" />
                <ItemStyle CssClass="field" />
            </asp:TemplateField>
            <asp:BoundField DataField="MiddleName" HeaderText="Middle Name" ItemStyle-CssClass="field"
                ControlStyle-Width="320px" />
            <asp:BoundField DataField="HomePhone" HeaderText="Home Phone" ItemStyle-CssClass="field"
                ControlStyle-Width="320px" />
            <asp:BoundField DataField="WorkPhone" HeaderText="Work Phone" ItemStyle-CssClass="field"
                ControlStyle-Width="320px" />
            <asp:TemplateField HeaderText="Primary Email">
                <ItemTemplate>
                    <asp:TextBox ID="PrimaryEmail" runat="server" MaxLength="50" Columns="60" Text='<%# Bind("PrimaryEmail") %>'></asp:TextBox>
                    <asp:CustomValidator ID="CustomValidator3" runat="server" ClientValidationFunction="PrimaryEmailValidation"
                        ErrorMessage="*" CssClass="error"></asp:CustomValidator>
                </ItemTemplate>
                <ControlStyle Width="320px" />
                <ItemStyle CssClass="field" />
            </asp:TemplateField>
            <asp:BoundField DataField="SecondaryEmail" HeaderText="Secondary Email" ItemStyle-CssClass="field"
                ControlStyle-Width="320px" />
            <asp:CheckBoxField DataField="IsShared" HeaderText="Is Shared" ItemStyle-CssClass="field"
                ControlStyle-Width="320px" />
            <asp:BoundField DataField="BusinessAddress" HeaderText="Business Address" ItemStyle-CssClass="field"
                ControlStyle-Width="320px" />
            <asp:BoundField DataField="Company" HeaderText="Company" ItemStyle-CssClass="field"
                ControlStyle-Width="320px" />
            <asp:BoundField DataField="HomeAddress" HeaderText="HomeAddress" ItemStyle-CssClass="field"
                ControlStyle-Width="320px" />
            <asp:BoundField DataField="JobTitle" HeaderText="JobTitle" ItemStyle-CssClass="field"
                ControlStyle-Width="320px" />
            <asp:CommandField ShowEditButton="True" />
        </Fields>
    </asp:DetailsView>
    <asp:Label ID="UserIDLabel" runat="server" Visible="false"></asp:Label>
    <asp:ObjectDataSource ID="AddressBookDataSource" runat="server" OldValuesParameterFormatString="{0}"
        SelectMethod="LoadAddressBookByPrimaryKey" TypeName="DL_WEB.DAL.Client.AddressBook"
        UpdateMethod="Update" OnUpdated="AddressBookDataSource_Updated">
        <SelectParameters>
            <asp:QueryStringParameter DefaultValue="0" Name="entryID" QueryStringField="EntryID"
                Type="Int32" />
        </SelectParameters>
        <UpdateParameters>
            <asp:Parameter Name="entryID" Type="Int32" />
            <asp:Parameter Name="firstName" Type="String" />
            <asp:Parameter Name="lastName" Type="String" />
            <asp:Parameter Name="middleName" Type="String" />
            <asp:Parameter Name="homePhone" Type="String" />
            <asp:Parameter Name="workPhone" Type="String" />
            <asp:Parameter Name="primaryEmail" Type="String" />
            <asp:Parameter Name="secondaryEmail" Type="String" />
            <asp:ControlParameter ControlID="UserIDLabel" DefaultValue="0" Name="userID" PropertyName="Text"
                Type="Int32" />
            <asp:Parameter Name="isShared" Type="Boolean" />
            <asp:Parameter Name="businessAddress" Type="String" />
            <asp:Parameter Name="company" Type="String" />
            <asp:Parameter Name="homeAddress" Type="String" />
            <asp:Parameter Name="jobTitle" Type="String" />
        </UpdateParameters>
    </asp:ObjectDataSource>
</asp:Content>
