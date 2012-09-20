<%@ Page Language="C#" MasterPageFile="~/default.master" AutoEventWireup="true" CodeFile="UpdateDetails.aspx.cs"
    Inherits="UpdateDetails" %>

<%@ Register Assembly="RadEditor.Net2" Namespace="Telerik.WebControls" TagPrefix="radE" %>
<%@ Register Src="Controls/ProjectInfo.ascx" TagName="ProjectInfo" TagPrefix="uc1" %>
<%@ Register Assembly="RadCalendar.Net2" Namespace="Telerik.WebControls" TagPrefix="radCln" %>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">

    <script type="text/javascript" language="javascript">
        function ValidateUpdateGroup(source, arguments)
        {
            arguments.IsValid = ListValidate("<% = ddlUpdateGroup.ClientID %>");
        }

        function ConfirmDelete()
        {
            return confirm('Do you really want to delete update?');
        }
    </script>

    <div class="pagecaption">
        Update Details</div>
    <uc1:ProjectInfo ID="ProjectInfo1" runat="server" />
    <table>
        <tr>
            <td class="fieldname">
                Update</td>
            <td>
                <asp:TextBox ID="tbUpdateName" runat="server" ReadOnly="True" Columns="58" MaxLength="8000"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="tbUpdateName"
                    ErrorMessage="*" CssClass="error"></asp:RequiredFieldValidator></td>
        </tr>
        <tr>
            <td valign="top" class="fieldname">
                Description</td>
            <td>
                <radE:RadEditor ID="reDescription" runat="server" Html='<%# Bind("Description") %>'
                    ShowSubmitCancelButtons="False" CatalogIconImageUrl="" ConvertTagsToLower="True"
                    ConvertToXhtml="False" CopyCssToFormatBlockTool="False" Description="" DocumentsFilters="*.*"
                    EnableClientSerialize="True" EnableContextMenus="True" EnableDocking="True" EnableEnhancedEdit="True"
                    EnableHtmlIndentation="True" EnableServerSideRendering="True" EnableTab="True"
                    Height="213px" ImagesFilters="*.gif,*.xbm,*.xpm,*.png,*.ief,*.jpg,*.jpe,*.jpeg,*.tiff,*.tif,*.rgb,*.g3f,*.xwd,*.pict,*.ppm,*.pgm,*.pbm,*.pnm,*.bmp,*.ras,*.pcd,*.cgm,*.mil,*.cal,*.fif,*.dsf,*.cmx,*.wi,*.dwg,*.dxf,*.svf"
                    MediaFilters="*.asf,*.asx,*.wm,*.wmx,*.wmp,*.wma,*.wax,*.wmv,*.wvx,*.avi,*.wav,*.mpeg,*.mpg,*.mpe,*.mov,*.m1v,*.mp2,*.mpv2,*.mp2v,*.mpa,*.mp3,*.m3u,*.mid,*.midi,*.rm,*.rma,*.rmi,*.rmv,*.aif,*.aifc,*.aiff,*.au,*.snd"
                    OnClientCancel="" OnClientCommandExecuted="" OnClientCommandExecuting="" OnClientLoad=""
                    OnClientModeChange="" OnClientSubmit="" OnFileDelete="" OnFileUpload="" PassSessionData="True"
                    RenderAsTextArea="False" TemplateFilters="*.html,*.htm" Title="" TitleIconImageUrl=""
                    TitleUrl="" ToolbarMode="Default" ToolsFile="~/RadControls/DescriptionEditor.xml"
                    ToolsWidth="" UseFixedToolbar="False" Width="200px" ShowHtmlMode="False" ShowPreviewMode="False">
                </radE:RadEditor>
            </td>
        </tr>
        <tr>
            <td class="fieldname">
                Update Status</td>
            <td>
                <asp:DropDownList ID="ddlUpdateStatus" runat="server" Width="155px">
                </asp:DropDownList></td>
        </tr>
        <tr>
            <td class="fieldname">
                Update Group</td>
            <td>
                <asp:DropDownList ID="ddlUpdateGroup" runat="server" Width="155px">
                </asp:DropDownList>
                <asp:CustomValidator ID="CustomValidator1" runat="server" ClientValidationFunction="ValidateUpdateGroup"
                    ControlToValidate="ddlUpdateGroup" ErrorMessage="*" CssClass="error"></asp:CustomValidator></td>
        </tr>
        <tr>
            <td class="fieldname">
                Build Number</td>
            <td>
                <asp:TextBox ID="tbBuuildNumber" runat="server" MaxLength="50"></asp:TextBox></td>
        </tr>
        <tr>
            <td class="fieldname">
                Build Date</td>
            <td>
                <asp:TextBox ID="tbBuildDate" MaxLength="10" Columns="10" runat="server"></asp:TextBox>
                <img src="images/datePick.gif" style="cursor: pointer" height="16" width="17" alt="Pick Date"
                    onclick="return ToggleCalendar(event, '<% = tbBuildDate.ClientID %>', '<% = calendar.ClientID %>')"
                    onkeypress="return ToggleCalendar(event, '<% = tbBuildDate.ClientID %>', '<% = calendar.ClientID %>')" />
                <asp:CompareValidator ID="CompareValidator1" runat="server" ControlToValidate="tbBuildDate"
                    ErrorMessage="*" CssClass="error" Operator="GreaterThan" Type="Date" ValueToCompare="1/1/1980"></asp:CompareValidator><div
                        id="calendarContainer" style="display: none;">
                        <radCln:RadCalendar ID="calendar" runat="server" AutoPostBackOnNavigation="False"
                            BorderStyle="Solid" BorderWidth="0px" CssClass="calendarWrapper" DayNameFormat="FirstLetter"
                            Font-Names="Arial,Verdana,Tahoma" ForeColor="Black" PresentationType="Interactive"
                            Style="border-left-color: #ececec; border-bottom-color: #ececec; border-top-color: #ececec;
                            border-right-color: #ececec" Font-Size="Medium" Skin="Modern" CssFile="~/RadControls/Calendar/Skins/Modern/Calendar.css">
                            <ClientEvents OnDateSelected="window.ChangeInput"></ClientEvents>
                        </radCln:RadCalendar>
                    </div>
            </td>
        </tr>
        <tr>
            <td>
            </td>
            <td>
                <asp:Panel ID="Panel1" runat="server" GroupingText="Log Entries" Width="100%">
                    <asp:LinkButton ID="linkbtnAddLogEntry" runat="server" CssClass="newitem" OnClick="linkbtnAddLogEntry_Click">Add Log Entry</asp:LinkButton><br />
                    <br />
                    <asp:GridView ID="LogEntryList" runat="server" AutoGenerateColumns="False" DataKeyNames="LogEntryID"
                        DataSourceID="LogEntryDataSource" GridLines="None" Width="602px">
                        <HeaderStyle CssClass="tableheader" />
                        <FooterStyle CssClass="tablefooter" />
                        <PagerStyle CssClass="tablepager" />
                        <RowStyle CssClass="tablerow" />
                        <AlternatingRowStyle CssClass="tablerowalt" />
                        <Columns>
                            <asp:TemplateField HeaderText="Entry Name">
                                <ItemTemplate>
                                    <a href='LogEntryDetails.aspx?ProjectID=<%# this.ProjectID %>&LogEntryID=<%# Eval("LogEntryID") %>'>
                                        <%# Eval("Header") %>
                                    </a>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:BoundField DataField="TimeStamp" DataFormatString="{0:MM/dd/yyyy hh:mm:ss}"
                                HeaderText="Time Stamp" />
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
            </td>
        </tr>
        <tr class="commandrow">
            <td colspan="2">
                <asp:LinkButton ID="linkbtnSave" runat="server" OnClick="linkbtnSave_Click">Update</asp:LinkButton>
                &nbsp;<a href='Updates.aspx?ProjectID=<% = this.ProjectID %>'>Cancel</a>
            </td>
        </tr>
    </table>
    <asp:ObjectDataSource ID="LogEntryDataSource" runat="server" SelectMethod="LoadAllLogEntryByUpdateID"
        TypeName="DL_WEB.DAL.Client.LogEntry" DeleteMethod="Delete" OldValuesParameterFormatString="{0}">
        <SelectParameters>
            <asp:QueryStringParameter DefaultValue="0" Name="iUpdateID" QueryStringField="UpdateID"
                Type="Int32" />
        </SelectParameters>
        <DeleteParameters>
            <asp:Parameter Name="logEntryID" Type="Int32" />
        </DeleteParameters>
    </asp:ObjectDataSource>
</asp:Content>
