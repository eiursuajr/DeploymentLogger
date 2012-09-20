<%@ Page Language="C#" MasterPageFile="~/default.master" AutoEventWireup="true" CodeFile="ActivityLog.aspx.cs"
    Inherits="ActivityLog" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <asp:Panel ID="Panel1" runat="server" Height="50px" Width="272px">
        <asp:MultiView ID="mvFilter" runat="server" ActiveViewIndex="0">
            <asp:View ID="viewSimpleSearch" runat="server">
                <asp:Panel ID="Panel2" runat="server" GroupingText="Filter">
                    <table>
                        <tr>
                            <td class="fieldname">
                                Start Date</td>
                            <td class="field">
                                <asp:TextBox ID="tbStartDate" MaxLength="10" Columns="10" runat="server"></asp:TextBox>
                                <asp:CompareValidator ID="CompareValidator1" runat="server" ControlToValidate="tbStartDate"
                                    ErrorMessage="*" Operator="GreaterThan" Type="Date" ValueToCompare="1/1/1980"></asp:CompareValidator>
                            </td>
                        </tr>
                        <tr>
                            <td class="fieldname">
                                End Date</td>
                            <td class="field">
                                <asp:TextBox ID="tbEndDate" MaxLength="10" Columns="10" runat="server"></asp:TextBox>
                                <asp:CompareValidator ID="CompareValidator2" runat="server" ControlToValidate="tbEndDate"
                                    ErrorMessage="*" Operator="GreaterThan" Type="Date" ValueToCompare="1/1/1980"></asp:CompareValidator>
                            </td>
                        </tr>
                        <tr class="commandrow">
                            <td colspan="2">
                                <asp:LinkButton ID="btnSearch" runat="server" OnClick="btnSearch_Click">Start&nbsp;Search</asp:LinkButton>&nbsp;
                                <asp:LinkButton ID="lnkbtnAdvSearch" runat="server" OnClick="lnkbtnAdvSearch_Click">Advanced&nbsp;Search</asp:LinkButton>
                            </td>
                        </tr>
                    </table>
                </asp:Panel>
            </asp:View>
            <asp:View ID="viewAdvSearch" runat="server">
                <asp:Panel ID="Panel3" runat="server" GroupingText="Advanced Search">
                    <table>
                        <tr class="commandrow">
                            <td colspan="2">
                                <asp:LinkButton ID="btnAdvSearch" runat="server">Start&nbsp;Search</asp:LinkButton>&nbsp;
                                <asp:LinkButton ID="linkbtnFilter" runat="server" OnClick="linkbtnFilter_Click">Search</asp:LinkButton>
                            </td>
                        </tr>
                    </table>
                </asp:Panel>
            </asp:View>
        </asp:MultiView></asp:Panel>
    <asp:Label ID="lblResults" runat="server"></asp:Label><br />
    <asp:GridView ID="gvActivityLog" runat="server" CellPadding="4" GridLines="None"
        AutoGenerateColumns="False">
        <HeaderStyle CssClass="tableheader" />
        <FooterStyle CssClass="tablefooter" />
        <PagerStyle CssClass="tablepager" />
        <RowStyle CssClass="tablerow" />
        <AlternatingRowStyle CssClass="tablerowalt" />
        <Columns>
            <asp:BoundField DataField="DateLog" HeaderText="Date" />
            <asp:BoundField DataField="ActivityTypeName" HeaderText="Activity Type" />
            <asp:BoundField DataField="Description" HeaderText="Description" HtmlEncode="false" />
        </Columns>
    </asp:GridView>
</asp:Content>
