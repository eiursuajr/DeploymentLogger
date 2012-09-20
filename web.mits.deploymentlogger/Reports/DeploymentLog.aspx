<%@ Page Language="C#" AutoEventWireup="true" CodeFile="DeploymentLog.aspx.cs" Inherits="DeploymentLog" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title runat="server"></title>
    <!--<link href="../styles.css" rel="stylesheet" type="text/css" />-->
</head>
<body class="report_body">
    <form id="form1" runat="server">
        <asp:Label ID="MessageLabel" runat="server" CssClass="error" Visible="false">You have requested report with wrong Project ID or Organization ID</asp:Label>
        <asp:Panel ID="MainPanel" runat="server">
            <table>
                <tr>
                    <td valign="top">
                        <div style="width: 424px; height: 50px" id="divImpactLevel" runat="server">
                            <asp:DropDownList ID="ddlImpactLevel" runat="server" Width="320px" AutoPostBack="True">
                                <asp:ListItem Selected="True" Value="0">Select Impact Level</asp:ListItem>
                            </asp:DropDownList>
                            <br />
                            <img src="../images/puce_cross.gif" alt="Fixed" height="9" width="9" style="padding: 1px;
                                margin: 2px" />
                            Fixed
                            <img src="../images/plus_ico.gif" alt="New" height="9" width="9" style="padding: 1px;
                                margin: 2px" />
                            Added
                            <img src="../images/check_ico.gif" alt="Changed/Improved" height="9" width="9" style="padding: 1px;
                                margin: 2px" />
                            Improved/Changed
                            <img src="../images/info_ico.gif" alt="Information" height="9" width="9" style="padding: 1px;
                                margin: 2px" />
                            Information</div>
                    </td>
                    <td align="center" style="width: 133px;" valign="top">
                        <asp:HyperLink ID="hlSubscribe" runat="server">subscribe</asp:HyperLink></td>
                </tr>
            </table>
            <asp:Label ID="Label1" runat="server" Text="Version History" CssClass="report_header" /><br />
            <asp:Table ID="tblHistory" runat="server" CellPadding="3" CellSpacing="0" />
        </asp:Panel>
    </form>
</body>
</html>
