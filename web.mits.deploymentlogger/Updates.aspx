<%@ Page Language="C#" MasterPageFile="~/default.master" AutoEventWireup="true" CodeFile="Updates.aspx.cs"
    Inherits="Updates" %>

<%@ Register Src="Controls/ProjectInfo.ascx" TagName="ProjectInfo" TagPrefix="uc1" %>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">

    <script type="text/javascript" language="javascript">
        function ConfirmDelete()
        {
            return confirm('Do you really want to delete update?');
        }
    </script>

    <uc1:ProjectInfo ID="ProjectInfo1" runat="server" />
    <asp:Panel ID="Panel1" runat="server" GroupingText="Update History" Width="100%">
        <asp:HyperLink ID="hlNewUpdate" CssClass="newitem" runat="server" NavigateUrl="~/updatedetails.aspx">New Update</asp:HyperLink><br />
        <br />
        <asp:GridView ID="UpdateList" runat="server" AutoGenerateColumns="False" CellPadding="4"
            DataSourceID="UpdateDataSource" GridLines="None" DataKeyNames="UpdateID">
            <HeaderStyle CssClass="tableheader" />
            <FooterStyle CssClass="tablefooter" />
            <PagerStyle CssClass="tablepager" />
            <RowStyle CssClass="tablerow" />
            <AlternatingRowStyle CssClass="tablerowalt" />
            <Columns>
                <asp:HyperLinkField DataTextField="Name" HeaderText="Name" DataNavigateUrlFields="UpdateID,ProjectID"
                    DataNavigateUrlFormatString="UpdateDetails.aspx?UpdateID={0}&ProjectID={1}" />
                <asp:BoundField DataField="EnteredDate" DataFormatString="{0:MM/dd/yyyy}" HeaderText="Entered Date" />
                <asp:BoundField DataField="BuildNumber" HeaderText="Build Number" />
                <asp:TemplateField HeaderText="Build Date">
                    <ItemTemplate>
                        <%# String.Format("{0:d}", Eval("BuildDate"))%>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:BoundField DataField="UpdateGroupName" HeaderText="Update Group Name" />
                <asp:BoundField DataField="UpdateStatusName" HeaderText="Update Status Name" />
                <asp:TemplateField>
                    <ItemTemplate>
                        <a href='Updates.aspx?ProjectID=<%# Eval("ProjectID") %>&action=delete&updateid=<%# Eval("UpdateID") %>'
                            onclick="return ConfirmDelete();">Delete</a>
                    </ItemTemplate>
                </asp:TemplateField>
            </Columns>
        </asp:GridView>
    </asp:Panel>
    <asp:ObjectDataSource ID="UpdateDataSource" runat="server" SelectMethod="LoadAllUpdateByProjectID"
        TypeName="DL_WEB.DAL.Client.Update">
        <SelectParameters>
            <asp:QueryStringParameter DefaultValue="0" Name="projectID" QueryStringField="ProjectID"
                Type="Int32" />
        </SelectParameters>
    </asp:ObjectDataSource>
</asp:Content>
