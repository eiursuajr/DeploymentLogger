<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/default.master" MaintainScrollPositionOnPostback="true"
    CodeFile="DeploymentLogReport.aspx.cs" Inherits="Reports_DeploymentLogReport"
    Title="DeploymentLog Report" EnableSessionState="True" %>

<%@ Register Src="../Controls/ProjectInfo.ascx" TagName="ProjectInfo" TagPrefix="uc3" %>
<%@ Register Src="../Controls/LogEntryTypes.ascx" TagName="LogEntryTypes" TagPrefix="uc2" %>
<%@ Register Assembly="skmRss" Namespace="skmRss" TagPrefix="skm" %>
<%@ Register Src="../Controls/ImpactLevel.ascx" TagName="ImpactLevel" TagPrefix="uc1" %>
<%@ MasterType VirtualPath="~/default.master" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <table border="0" cellpadding="0" cellspacing="0">
        <tr align="left">
            <td align="left" colspan="2">
                <uc3:ProjectInfo ID="ucProjectInfo" runat="server" />
                <br />
            </td>
        </tr>
        <tr align="left">
            <td align="left">
                <uc1:ImpactLevel ID="ucImpactLevel" runat="server" />
            </td>
            <td>
                <asp:HyperLink ID="hlSubscribe" runat="server">Subscribe</asp:HyperLink>
            </td>
        </tr>
        <tr>
            <td colspan="2">
                <br />
                <uc2:LogEntryTypes ID="ucLogEntryTypes" runat="server" />
            </td>
        </tr>
        <tr>
            <td colspan="2">
                <asp:Label ID="lblErrorMessage" runat="server" Text="Error message" Visible="false"></asp:Label>
                <skm:RssFeed ID="ucRssFeed" runat="server" CacheDuration="0" MaxItems="1000" Width="400pt"
                    OnItemDataBound="ucRssFeed_ItemDataBound" Timeout="5000000" OnPreRender="ucRssFeed_PreRender">
                    <ItemStyle BackColor="White" />
                    <AlternatingItemStyle BackColor="#E0E0E0"></AlternatingItemStyle>
                    <HeaderStyle Font-Size="12pt" HorizontalAlign="Center" Font-Bold="True" ForeColor="White"
                        BackColor="#000040"></HeaderStyle>
                    <ItemTemplate>
                        <table>
                            <tr valign="top">
                                <td valign="top">
                                    <asp:Image ID="imgCategory" runat="server" ImageUrl="<%# Container.DataItem.Link %>"
                                        AlternateText="<%# Container.DataItem.Category %>" />
                                </td>
                                <td valign="top">
                                    <asp:Label ID="lblTitle" runat="server" Text='<%# Container.DataItem.Title %>' EnableViewState="false"></asp:Label>
                                    <br />
                                    <i>
                                        <%# Container.DataItem.PubDate.ToString("MM/dd/yyyy") %>
                                    </i>
                                    <br />
                                    <%# Container.DataItem.Description %>
                                </td>
                            </tr>
                        </table>
                    </ItemTemplate>
                </skm:RssFeed>
            </td>
        </tr>
    </table>
</asp:Content>
