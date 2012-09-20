<%@ Page Language="C#" MasterPageFile="~/default.master" AutoEventWireup="true" CodeFile="AvailableLogEntries.aspx.cs"
    Inherits="AvailableLogEntries" %>

<%@ Register Src="Controls/ProjectInfo.ascx" TagName="ProjectInfo" TagPrefix="uc1" %>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">

    <script type="text/javascript" language="javascript">
        function ConfirmDelete()
        {
            return confirm('Do you really want to delete log entry?');
        }
    </script>

    <uc1:ProjectInfo ID="ProjectInfo1" runat="server" />
    <asp:Panel ID="Panel1" runat="server" GroupingText="Pending Log Entries" Width="100%">
        <asp:HyperLink ID="NewLogEntryLink" CssClass="newitem" runat="server" NavigateUrl="~/logentrydetails.aspx">New Log Entry</asp:HyperLink>
        <br /><br />
        <asp:GridView ID="LogEntryList" runat="server" CellPadding="4" GridLines="None" AutoGenerateColumns="False"
            DataKeyNames="LogEntryID" DataSourceID="LogEntryDataSource" OnRowCommand="LogEntryList_RowCommand"
            OnRowDeleted="LogEntryList_RowDeleted">
            <HeaderStyle CssClass="tableheader" />
            <FooterStyle CssClass="tablefooter" />
            <PagerStyle CssClass="tablepager" />
            <RowStyle CssClass="tablerow" />
            <AlternatingRowStyle CssClass="tablerowalt" />
            <Columns>
                <asp:HyperLinkField DataNavigateUrlFields="LogEntryID,ProjectID" DataNavigateUrlFormatString="LogEntryDetails.aspx?LogentryID={0}&ProjectID={1}"
                    DataTextField="Header" HeaderText="Name" />
                <asp:BoundField DataField="TimeStamp" DataFormatString="{0:MM/dd/yyyy}" HeaderText="Enter Date" />
                <asp:BoundField DataField="Description" HeaderText="Description" HtmlEncode="false" />
                <asp:BoundField DataField="TypeName" HeaderText="Type" />
                <asp:BoundField DataField="StatusName" HeaderText="Status" />
                <asp:TemplateField>
                    <ItemTemplate>
                        <asp:LinkButton CommandArgument='<%# Bind("LogEntryID") %>' CommandName="Delete"
                            ID="DeleteButton" runat="server" OnClientClick="return ConfirmDelete();" Text="Delete"></asp:LinkButton>
                    </ItemTemplate>
                </asp:TemplateField>
            </Columns>
        </asp:GridView>
    </asp:Panel>
    <asp:ObjectDataSource ID="LogEntryDataSource" runat="server" OldValuesParameterFormatString="{0}"
        SelectMethod="LoadAllPendingLogEntryByProjectID" TypeName="DL_WEB.DAL.Client.LogEntry"
        UpdateMethod="IncludeInUpdate" DeleteMethod="Delete">
        <SelectParameters>
            <asp:QueryStringParameter DefaultValue="0" Name="projectID" QueryStringField="ProjectID"
                Type="Int32" />
        </SelectParameters>
        <UpdateParameters>
            <asp:Parameter Name="logEntryID" Type="Int32" />
            <asp:QueryStringParameter DefaultValue="0" Name="updateID" QueryStringField="UpdateID"
                Type="Int32" />
        </UpdateParameters>
        <DeleteParameters>
            <asp:Parameter Name="logEntryID" Type="Int32" />
        </DeleteParameters>
    </asp:ObjectDataSource>
</asp:Content>
