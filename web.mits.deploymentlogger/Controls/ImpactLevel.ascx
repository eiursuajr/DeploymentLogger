<%@ Control Language="C#" AutoEventWireup="true" CodeFile="ImpactLevel.ascx.cs" Inherits="UserControls_ImpactLevel" %>
<div id="divImpactLevel">
    <table border="0" cellpadding="0" cellspacing="0" id="ImpactLevel">
        <tr align="left">
            <td valign="top" align="left" class="fieldname">
                <asp:Label ID="Label1" runat="server" Text="Impact Level&nbsp;&nbsp;&nbsp;" EnableViewState="false"></asp:Label>
            </td>
            <td valign="top" align="left">
                <asp:DropDownList ID="ddlImpactLevel" runat="server" AutoPostBack="True" Width="100pt"
                    OnSelectedIndexChanged="ddlImpactLevel_SelectedIndexChanged">
                    <%--<asp:ListItem Selected="True" Value="0">Select Impact Level</asp:ListItem>--%>
                </asp:DropDownList>
            </td>
        </tr>
    </table>
</div>
