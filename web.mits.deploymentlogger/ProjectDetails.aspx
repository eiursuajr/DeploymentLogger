<%@ Page Language="C#" MasterPageFile="~/default.master" AutoEventWireup="true" CodeFile="ProjectDetails.aspx.cs"
    Inherits="ProjectDetails" %>

<%@ Register Assembly="RadEditor.Net2" Namespace="Telerik.WebControls" TagPrefix="radE" %>

<%@ Register Assembly="RadCalendar.Net2" Namespace="Telerik.WebControls" TagPrefix="radCln" %>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">

    <script language="javascript" type="text/javascript">
    <!--
        function ProjectGroupValidation(source, arguments)
        {
            arguments.IsValid = ListValidate("<% = ProjectDetailsView.Rows[0].Controls[1].Controls[1].ClientID %>");
        }
        
        function ProjectStatusValidation(source, arguments)
        {
            arguments.IsValid = ListValidate("<% = ProjectDetailsView.Rows[5].Controls[1].Controls[1].ClientID %>");
        }
        
        function ProjectCategoryValidation(source, arguments)
        {
            arguments.IsValid = ListValidate("<% = ProjectDetailsView.Rows[6].Controls[1].Controls[1].ClientID %>");
        }
        
        function StartDateValidation(source, arguments)
        {
            arguments.IsValid = DateValidate("<% = ProjectDetailsView.Rows[3].Controls[1].Controls[0].ClientID %>");
        }
        
        function FinishDateValidation(source, arguments)
        {
            arguments.IsValid = DateValidate("<% = ProjectDetailsView.Rows[4].Controls[1].Controls[0].ClientID %>");
        }
    
        function NameValidation(source, arguments)
        {
            arguments.IsValid = RequiredValidate("<% = ProjectDetailsView.Rows[1].Controls[1].Controls[1].ClientID %>");
        }
    //-->
    </script>

    <asp:DetailsView ID="ProjectDetailsView" runat="server" GridLines="None" DefaultMode="Edit"
        DataSourceID="ProjectDataSource" AutoGenerateRows="False" DataKeyNames="ProjectID"
        OnItemUpdated="ProjectDetailsView_ItemUpdated" OnItemCommand="ProjectDetailsView_ItemCommand"
        Caption="Project Details">
        <EditRowStyle CssClass="fieldname" />
        <CommandRowStyle CssClass="commandrow" />
        <Fields>
            <asp:TemplateField HeaderText="Project&#160;Group">
                <ItemTemplate>
                    <asp:DropDownList SelectedValue='<%# Bind("ProjectGroupID") %>' AppendDataBoundItems="true"
                        ID="ProjectGroupID" runat="server" DataSourceID="ProjectGroupDataSource" DataTextField="Name"
                        DataValueField="ProjectGroupID" OnInit="List_Init">
                        <asp:ListItem Value="0">[Please select...]</asp:ListItem>
                    </asp:DropDownList>
                    <asp:CustomValidator ID="CustomValidator2" runat="server" ClientValidationFunction="ProjectGroupValidation"
                        ErrorMessage="*" CssClass="error"></asp:CustomValidator>
                </ItemTemplate>
                <ItemStyle CssClass="field" />
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Name">
                <ItemTemplate>
                    <asp:TextBox ID="Name" runat="server" MaxLength="255" Columns="60" Text='<%# Bind("Name") %>'></asp:TextBox>
                    <asp:CustomValidator ID="CustomValidator1" runat="server" ClientValidationFunction="NameValidation"
                        ErrorMessage="*" CssClass="error"></asp:CustomValidator>
                </ItemTemplate>
                <ControlStyle Width="320px" />
                <ItemStyle CssClass="field" />
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Description">
                <ItemTemplate>
                    <radE:RadEditor ID="reDescription" runat="server" Html='<%# Bind("Description") %>' ShowSubmitCancelButtons="False" CatalogIconImageUrl="" ConvertTagsToLower="True" ConvertToXhtml="False" CopyCssToFormatBlockTool="False" Description="" DocumentsFilters="*.*" EnableClientSerialize="True" EnableContextMenus="True" EnableDocking="True" EnableEnhancedEdit="True" EnableHtmlIndentation="True" EnableServerSideRendering="True" EnableTab="True" Height="213px" ImagesFilters="*.gif,*.xbm,*.xpm,*.png,*.ief,*.jpg,*.jpe,*.jpeg,*.tiff,*.tif,*.rgb,*.g3f,*.xwd,*.pict,*.ppm,*.pgm,*.pbm,*.pnm,*.bmp,*.ras,*.pcd,*.cgm,*.mil,*.cal,*.fif,*.dsf,*.cmx,*.wi,*.dwg,*.dxf,*.svf" MediaFilters="*.asf,*.asx,*.wm,*.wmx,*.wmp,*.wma,*.wax,*.wmv,*.wvx,*.avi,*.wav,*.mpeg,*.mpg,*.mpe,*.mov,*.m1v,*.mp2,*.mpv2,*.mp2v,*.mpa,*.mp3,*.m3u,*.mid,*.midi,*.rm,*.rma,*.rmi,*.rmv,*.aif,*.aifc,*.aiff,*.au,*.snd" OnClientCancel="" OnClientCommandExecuted="" OnClientCommandExecuting="" OnClientLoad="" OnClientModeChange="" OnClientSubmit="" OnFileDelete="" OnFileUpload="" PassSessionData="True" RenderAsTextArea="False" TemplateFilters="*.html,*.htm" Title="" TitleIconImageUrl="" TitleUrl="" ToolbarMode="Default" ToolsFile="~/RadControls/DescriptionEditor.xml" ToolsWidth="" UseFixedToolbar="False" Width="200px" ShowHtmlMode="False" ShowPreviewMode="False">
                    </radE:RadEditor>
                </ItemTemplate>
                <ItemStyle CssClass="field" />
                <HeaderStyle VerticalAlign="Top" />
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Start Date">
                <ItemTemplate>
                    <asp:TextBox ID="StartDate" MaxLength="10" runat="server" Columns="10" Text='<%# Bind("StartDate", "{0:d}") %>'></asp:TextBox>
                    <img src="images/datePick.gif" style="cursor: pointer" height="16" width="17" alt="Pick Date"
                        onclick="return ToggleCalendar(event, '<% = ProjectDetailsView.Rows[3].Controls[1].Controls[0].ClientID %>', '<% = calendar.ClientID %>')"
                        onkeypress="return ToggleCalendar(event, '<% = ProjectDetailsView.Rows[3].Controls[1].Controls[0].ClientID %>', '<% = calendar.ClientID %>')" />
                    <asp:CustomValidator ID="CustomValidator5" runat="server" ClientValidationFunction="StartDateValidation"
                        ErrorMessage="*" CssClass="error"></asp:CustomValidator>
                </ItemTemplate>
                <ItemStyle CssClass="field" />
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Finish Date">
                <ItemTemplate>
                    <asp:TextBox ID="FinishDate" MaxLength="10" runat="server" Columns="10" Text='<%# Bind("FinishDate", "{0:d}") %>'></asp:TextBox>
                    <img src="images/datePick.gif" style="cursor: pointer" height="16" width="17" alt="Pick Date"
                        onclick="return ToggleCalendar(event, '<% = ProjectDetailsView.Rows[4].Controls[1].Controls[0].ClientID %>', '<% = calendar.ClientID %>')"
                        onkeypress="return ToggleCalendar(event, '<% = ProjectDetailsView.Rows[4].Controls[1].Controls[0].ClientID %>', '<% = calendar.ClientID %>')" />
                    <asp:CustomValidator ID="CustomValidator6" runat="server" ClientValidationFunction="FinishDateValidation"
                        ErrorMessage="*" CssClass="error"></asp:CustomValidator>
                </ItemTemplate>
                <ItemStyle CssClass="field" />
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Project Status">
                <ItemTemplate>
                    <asp:DropDownList SelectedValue='<%# Bind("ProjectStatusID") %>' AppendDataBoundItems="true"
                        ID="ProjectStatusID" runat="server" DataSourceID="ProjectStatusDataSource" DataTextField="Name"
                        DataValueField="ProjectStatusID" OnInit="List_Init">
                        <asp:ListItem Value="0">[Please select...]</asp:ListItem>
                    </asp:DropDownList>
                    <asp:CustomValidator ID="CustomValidator3" runat="server" ClientValidationFunction="ProjectStatusValidation"
                        ErrorMessage="*" CssClass="error"></asp:CustomValidator>
                </ItemTemplate>
                <ItemStyle CssClass="field" />
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Project&#160;Category">
                <ItemTemplate>
                    <asp:DropDownList SelectedValue='<%# Bind("ProjectCategoryID") %>' AppendDataBoundItems="true"
                        ID="ProjectCategoryID" runat="server" DataSourceID="ProjectCategoryDataSource"
                        DataTextField="Name" DataValueField="ProjectCategoryID" OnInit="List_Init">
                        <asp:ListItem Value="0">[Please select...]</asp:ListItem>
                    </asp:DropDownList>
                    <asp:CustomValidator ID="CustomValidator4" runat="server" ClientValidationFunction="ProjectCategoryValidation"
                        ErrorMessage="*" CssClass="error"></asp:CustomValidator>
                </ItemTemplate>
                <ItemStyle CssClass="field" />
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Related Items" HeaderStyle-VerticalAlign="top">
                <EditItemTemplate>
                    <asp:HyperLink runat="server" ID="lnkUpdates" Text="Project Updates" NavigateUrl='<%# string.Format("~/Updates.aspx?ProjectID={0}", ProjectID) %>'></asp:HyperLink><br>
                    <asp:HyperLink runat="server" ID="lnkLogEntries" Text="Pending Project Log Entries" NavigateUrl='<%# string.Format("~/AvailableLogEntries.aspx?ProjectID={0}", ProjectID) %>'></asp:HyperLink><br>
                    <asp:HyperLink runat="server" ID="lnkNotifications" Text="Project Notifications" NavigateUrl='<%# string.Format("~/ProjectNotifications.aspx?ProjectID={0}", ProjectID) %>'></asp:HyperLink><br>
                    <asp:HyperLink runat="server" ID="lnkSections" Text="Project Sections" NavigateUrl='<%# string.Format("~/ProjectSections.aspx?ProjectID={0}", ProjectID) %>'></asp:HyperLink><br>
                    <asp:HyperLink runat="server" ID="lnkDeploymentLog" Text="Project Deployment Log Report" NavigateUrl='<%# string.Format("~/Reports/DeploymentLog.aspx?ProjectID={0}&OrganizationID={1}", ProjectID, OrganizationID) %>'></asp:HyperLink>
                </EditItemTemplate>
                <InsertItemTemplate>
                    <hr>
                </InsertItemTemplate>
                <ItemStyle CssClass="field" />
            </asp:TemplateField>
            <asp:CommandField ShowEditButton="True" />
        </Fields>
    </asp:DetailsView>
    <div id="calendarContainer" style="display: none;">
        <radCln:RadCalendar ID="calendar" runat="server" AutoPostBackOnNavigation="False"
            BorderStyle="Solid" BorderWidth="0px" CssClass="calendarWrapper" DayNameFormat="FirstLetter"
            Font-Names="Arial,Verdana,Tahoma" ForeColor="Black" PresentationType="Interactive"
            Style="border-left-color: #ececec; border-bottom-color: #ececec; border-top-color: #ececec;
            border-right-color: #ececec" Font-Size="Medium" Skin="Modern" CssFile="~/RadControls/Calendar/Skins/Modern/Calendar.css">
            <ClientEvents OnDateSelected="window.ChangeInput"></ClientEvents>
        </radCln:RadCalendar>
    </div>
    <asp:ObjectDataSource ID="ProjectDataSource" runat="server" SelectMethod="LoadProjectByPrimaryKey"
        TypeName="DL_WEB.DAL.Client.Project" UpdateMethod="Update" OldValuesParameterFormatString="{0}"
        OnUpdated="ProjectDataSource_Updated">
        <SelectParameters>
            <asp:QueryStringParameter DefaultValue="0" Name="ProjectID" QueryStringField="ProjectID"
                Type="Int32" />
        </SelectParameters>
        <UpdateParameters>
            <asp:Parameter Name="projectID" Type="Int32" />
            <asp:Parameter Name="projectGroupID" Type="Int32" />
            <asp:Parameter Name="name" Type="String" />
            <asp:Parameter Name="description" Type="String" />
            <asp:Parameter Name="startDate" Type="DateTime" />
            <asp:Parameter Name="finishDate" Type="DateTime" />
            <asp:Parameter Name="projectStatusID" Type="Int32" />
            <asp:Parameter Name="projectCategoryID" Type="Int32" />
            <asp:SessionParameter DefaultValue="0" Name="organizationID" SessionField="OrganizationID"
                Type="Int32" />
        </UpdateParameters>
    </asp:ObjectDataSource>
    <asp:ObjectDataSource ID="ProjectGroupDataSource" runat="server" SelectMethod="LoadAllProjectGroup"
        TypeName="DL_WEB.DAL.Client.ProjectGroup"></asp:ObjectDataSource>
    <asp:ObjectDataSource ID="ProjectStatusDataSource" runat="server" SelectMethod="LoadAllProjectStatus"
        TypeName="DL_WEB.DAL.Client.ProjectStatus"></asp:ObjectDataSource>
    <asp:ObjectDataSource ID="ProjectCategoryDataSource" runat="server" SelectMethod="LoadAllProjectCategory"
        TypeName="DL_WEB.DAL.Client.ProjectCategory"></asp:ObjectDataSource>
</asp:Content>
