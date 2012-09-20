<%@ Page Language="C#" MasterPageFile="~/default.master" AutoEventWireup="true" CodeFile="RoleActions.aspx.cs"
    Inherits="RoleActions" %>

<%@ Register TagPrefix="radT" Namespace="Telerik.WebControls" Assembly="RadTreeView" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <asp:LinkButton ID="UpdateLinkButton" runat="server" CssClass="newitem" OnClick="UpdateLinkButton_Click">&lt;&nbsp;Back to Roles</asp:LinkButton>
    <br /><br />
    <radT:RadTreeView ID="RadTree1" AutoPostBack="True" runat="server" Width="100%" Height="600px"
        AutoPostBackOnCheck="True" CheckBoxes="True" OnNodeBound="RadTree1_NodeBound"
        OnNodeCheck="RadTree1_NodeCheck" />
</asp:Content>
