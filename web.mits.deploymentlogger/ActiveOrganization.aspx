<%@ Page Language="C#" MasterPageFile="~/default.master" AutoEventWireup="true" CodeFile="ActiveOrganization.aspx.cs" Inherits="ActiveOrganization" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <h1>
        <strong><span style="font-size: 16pt">Choose your company</span></strong>&nbsp;</h1>
    Before you'll be able to work with a system you should choose your company from
    the list:<br />
    <br />
    <asp:BulletedList ID="bullistOrgs" runat="server" BulletStyle="Circle" DisplayMode="LinkButton" OnClick="bullistOrgs_Click">
    </asp:BulletedList>
</asp:Content>

