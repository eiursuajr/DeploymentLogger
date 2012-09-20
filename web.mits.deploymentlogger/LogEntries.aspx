<%@ Page Language="C#" AutoEventWireup="true" CodeFile="LogEntries.aspx.cs" Inherits="LogEntries"
    MasterPageFile="~/default.master" %>

<%@ Register Src="Controls/ProjectInfo.ascx" TagName="ProjectInfo" TagPrefix="uc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <uc1:ProjectInfo ID="ProjectInfo1" runat="server" />
    <asp:Panel ID="Panel1" runat="server" GroupingText="Pending Log Entries" Width="100%">
        <asp:GridView ID="gvLogEntryList" runat="server" CellPadding="4" GridLines="None"
            AutoGenerateColumns="False" DataKeyNames="LogEntryID" DataSourceID="LogEntryDataSource"
            OnRowCommand="LogEntryList_RowCommand">
            <HeaderStyle CssClass="tableheader" />
            <FooterStyle CssClass="tablefooter" />
            <PagerStyle CssClass="tablepager" />
            <RowStyle CssClass="tablerow" />
            <AlternatingRowStyle CssClass="tablerowalt" />
            <Columns>
                <asp:BoundField DataField="LogEntryID" />
                <asp:BoundField DataField="Header" HeaderText="Name" />
                <asp:BoundField DataField="TimeStamp" DataFormatString="{0:MM/dd/yyyy}" HeaderText="Enter Date" />
                <asp:BoundField DataField="Description" HeaderText="Description" HtmlEncode="false" />
                <asp:BoundField DataField="TypeName" HeaderText="Type" />
                <asp:BoundField DataField="StatusName" HeaderText="Status" />
                <asp:ButtonField Text="Include" CommandName="Include" />
            </Columns>
        </asp:GridView>
        <asp:Label ID="ProjectIDLabel" runat="server" Text="0" Visible="false"></asp:Label>
    </asp:Panel>
    <asp:ObjectDataSource ID="LogEntryDataSource" runat="server" OldValuesParameterFormatString="{0}"
        SelectMethod="LoadAllPendingLogEntryByProjectID" TypeName="DL_WEB.DAL.Client.LogEntry"
        UpdateMethod="IncludeInUpdate">
        <SelectParameters>
            <asp:ControlParameter ControlID="ProjectIDLabel" DefaultValue="0" Name="projectID"
                PropertyName="Text" Type="Int32" />
        </SelectParameters>
        <UpdateParameters>
            <asp:Parameter Name="logEntryID" Type="Int32" />
            <asp:QueryStringParameter DefaultValue="0" Name="updateID" QueryStringField="UpdateID"
                Type="Int32" />
        </UpdateParameters>
    </asp:ObjectDataSource>
</asp:Content>
