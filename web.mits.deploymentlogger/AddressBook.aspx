<%@ Page Language="C#" MasterPageFile="~/default.master" AutoEventWireup="true" CodeFile="AddressBook.aspx.cs"
    Inherits="AddressBook" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">

    <script type="text/javascript" language="javascript">
        function ConfirmDelete()
        {
            return confirm('Do you really want to delete entry?');
        }
    </script>

    <div class="pagecaption">
        Address Book</div>
    <asp:HyperLink ID="NewContactLink" runat="server" CssClass="newitem" Text="Add Contact"
        NavigateUrl="~/contactdetails.aspx"></asp:HyperLink><br />
    <br />
    <asp:GridView ID="gvAddressBookList" runat="server" CellPadding="4" GridLines="None"
        DataKeyNames="EntryID" AutoGenerateColumns="False">
        <HeaderStyle CssClass="tableheader" />
        <FooterStyle CssClass="tablefooter" />
        <PagerStyle CssClass="tablepager" />
        <RowStyle CssClass="tablerow" />
        <AlternatingRowStyle CssClass="tablerowalt" />
        <Columns>
            <asp:HyperLinkField DataTextField="FirstName" DataTextFormatString="{0}" DataNavigateUrlFields="EntryID"
                DataNavigateUrlFormatString="~/ContactDetails.aspx?EntryID={0}" HeaderText="Name" />
            <asp:BoundField DataField="PrimaryEmail" HeaderText="Primary Email" />
            <asp:BoundField DataField="HomePhone" HeaderText="Home Phone" />
            <asp:BoundField DataField="WorkPhone" HeaderText="Work Phone" />
            <asp:BoundField DataField="SecondaryEmail" HeaderText="Secondary Email" />
            <asp:BoundField DataField="IsShared" HeaderText="Shared Contact" />
            <asp:TemplateField>
                <ItemTemplate>
                    <a href='AddressBook.aspx?EntryID=<%# Eval("EntryID") %>&action=delete' onclick="return ConfirmDelete();">
                        Delete</a>
                </ItemTemplate>
            </asp:TemplateField>
        </Columns>
    </asp:GridView>
</asp:Content>
