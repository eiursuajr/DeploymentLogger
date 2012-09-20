<%@ Page Language="C#" MasterPageFile="~/default.master" AutoEventWireup="true" CodeFile="LogEntryDetails.aspx.cs"
    Inherits="LogEntryDetails" %>

<%@ Register Assembly="RadEditor.Net2" Namespace="Telerik.WebControls" TagPrefix="radE" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">

    <script language="javascript" type="text/javascript">
    <!--
        function HeaderValidation(source, arguments)
        {
            arguments.IsValid = RequiredValidate("<% = LogEntryDetailsView.Rows[0].Controls[1].Controls[1].ClientID %>");
        }
        
        function ProjectSectionValidation(source, arguments)
        {
            arguments.IsValid = ListValidate("<% = LogEntryDetailsView.Rows[2].Controls[1].Controls[1].ClientID %>");
        }
        
        function LogEntryTypeValidation(source, arguments)
        {
            arguments.IsValid = ListValidate("<% = LogEntryDetailsView.Rows[3].Controls[1].Controls[1].ClientID %>");
        }
        
        function LogEntryStatusValidation(source, arguments)
        {
            arguments.IsValid = ListValidate("<% = LogEntryDetailsView.Rows[4].Controls[1].Controls[1].ClientID %>");
        }
        
        function ImpactLevelValidation(source, arguments)
        {
            arguments.IsValid = ListValidate("<% = LogEntryDetailsView.Rows[5].Controls[1].Controls[1].ClientID %>");
        }
    //-->
    </script>

    <asp:DetailsView ID="LogEntryDetailsView" runat="server" GridLines="None" Caption="Log Entry Details"
        DataSourceID="LogEntryDataSource" AutoGenerateRows="False" DataKeyNames="LogEntryID"
        DefaultMode="Edit" OnItemUpdated="LogEntryDetailsView_ItemUpdated" OnItemCommand="LogEntryDetailsView_ItemCommand"
        OnItemInserted="LogEntryDetailsView_ItemInserted">
        <EditRowStyle CssClass="fieldname" />
        <CommandRowStyle CssClass="commandrow" />
        <Fields>
            <asp:TemplateField HeaderText="Header">
                <ItemTemplate>
                    <asp:TextBox ID="Header" runat="server" Columns="60" MaxLength="8000" Text='<%# Bind("Header") %>'
                        Width="400px"></asp:TextBox>
                    <asp:CustomValidator ID="CustomValidator1" runat="server" ClientValidationFunction="HeaderValidation"
                        ErrorMessage="*" CssClass="error"></asp:CustomValidator>
                </ItemTemplate>
                <ItemStyle CssClass="field" />
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Description">
                <ItemTemplate>
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
                </ItemTemplate>
                <ItemStyle CssClass="field" />
                <HeaderStyle VerticalAlign="Top" />
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Project Section">
                <ItemTemplate>
                    <asp:DropDownList SelectedValue='<%# Bind("ProjectSectionID") %>' AppendDataBoundItems="true"
                        ID="ProjectSectionID" runat="server" DataSourceID="ProjectSectionDataSource"
                        DataTextField="Name" DataValueField="ProjectSectionID" OnInit="List_Init" Width="200px">
                        <asp:ListItem Value="0">[select one]</asp:ListItem>
                    </asp:DropDownList>
                    <asp:CustomValidator ID="CustomValidator2" runat="server" ClientValidationFunction="ProjectSectionValidation"
                        ErrorMessage="*" CssClass="error"></asp:CustomValidator>
                </ItemTemplate>
                <ItemStyle CssClass="field" />
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Log Entry Type">
                <ItemTemplate>
                    <asp:DropDownList SelectedValue='<%# Bind("LogEntryTypeID") %>' AppendDataBoundItems="true"
                        ID="LogEntryTypeID" runat="server" DataSourceID="LogEntryTypeDataSource" DataTextField="Name"
                        DataValueField="LogEntryTypeID" OnInit="List_Init" Width="200px">
                        <asp:ListItem Value="0">[select one]</asp:ListItem>
                    </asp:DropDownList>
                    <asp:CustomValidator ID="CustomValidator3" runat="server" ClientValidationFunction="LogEntryTypeValidation"
                        ErrorMessage="*" CssClass="error"></asp:CustomValidator>
                </ItemTemplate>
                <ItemStyle CssClass="field" />
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Log Entry Status">
                <ItemTemplate>
                    <asp:DropDownList SelectedValue='<%# Bind("LogEntryStatusID") %>' AppendDataBoundItems="true"
                        ID="LogEntryStatusID" runat="server" DataSourceID="LogEntryStatusDataSource"
                        DataTextField="Name" DataValueField="LogEntryStatusID" OnInit="List_Init" Width="200px">
                        <asp:ListItem Value="0">[select one]</asp:ListItem>
                    </asp:DropDownList>
                    <asp:CustomValidator ID="CustomValidator4" runat="server" ClientValidationFunction="LogEntryStatusValidation"
                        ErrorMessage="*" CssClass="error"></asp:CustomValidator>
                </ItemTemplate>
                <ItemStyle CssClass="field" />
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Impact Level">
                <ItemTemplate>
                    <asp:DropDownList SelectedValue='<%# Bind("ImpactLevelID") %>' AppendDataBoundItems="true"
                        ID="ImpactLevelID" runat="server" DataSourceID="ImpactLevelDataSource" DataTextField="Name"
                        DataValueField="ImpactLevelID" OnInit="List_Init" Width="200px">
                        <asp:ListItem Value="0">[select one]</asp:ListItem>
                    </asp:DropDownList>
                    <asp:CustomValidator ID="CustomValidator5" runat="server" ClientValidationFunction="ImpactLevelValidation"
                        ErrorMessage="*" CssClass="error"></asp:CustomValidator>
                </ItemTemplate>
                <ItemStyle CssClass="field" />
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Public Header">
                <ItemStyle CssClass="field" />
                <ItemTemplate>
                    <asp:TextBox ID="tbPublicHeader" runat="server" Text='<%# Bind("PublicHeader") %>'
                        Width="400px"></asp:TextBox>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Public Description">
                <ItemTemplate>
                    <radE:RadEditor ID="rePublicDescription" runat="server" Html='<%# Bind("PublicDescription") %>'
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
                </ItemTemplate>
                <ItemStyle CssClass="field" />
                <HeaderStyle VerticalAlign="Top" />
            </asp:TemplateField>
            <asp:CommandField ShowEditButton="True" />
        </Fields>
    </asp:DetailsView>
    <input type="hidden" id="RedirectUrl" runat="server" />
    <asp:ObjectDataSource ID="LogEntryDataSource" runat="server" SelectMethod="LoadLogEntryByPrimaryKey"
        TypeName="DL_WEB.DAL.Client.LogEntry" UpdateMethod="Update" OnUpdated="LogEntryDataSource_Updated"
        InsertMethod="Update" OnInserted="LogEntryDataSource_Updated">
        <SelectParameters>
            <asp:QueryStringParameter DefaultValue="0" Name="LogEntryID" QueryStringField="LogEntryID"
                Type="Int32" />
        </SelectParameters>
        <UpdateParameters>
            <asp:Parameter Name="logEntryID" Type="Int32" />
            <asp:Parameter Name="header" Type="String" />
            <asp:Parameter Name="description" Type="String" />
            <asp:Parameter Name="logEntryTypeID" Type="Int32" />
            <asp:QueryStringParameter Name="projectID" QueryStringField="ProjectID" DefaultValue="0"
                Type="Int32" />
            <asp:Parameter Name="logEntryStatusID" Type="Int32" />
            <asp:Parameter Name="publicDescription" Type="String" />
            <asp:Parameter Name="publicHeader" Type="String" />
            <asp:Parameter Name="impactLevelID" Type="Int32" />
            <asp:Parameter Name="projectSectionID" Type="Int32" />
        </UpdateParameters>
        <InsertParameters>
            <asp:Parameter Name="logEntryID" Type="Int32" />
            <asp:Parameter Name="header" Type="String" />
            <asp:Parameter Name="description" Type="String" />
            <asp:Parameter Name="logEntryTypeID" Type="Int32" />
            <asp:QueryStringParameter Name="projectID" QueryStringField="ProjectID" DefaultValue="0"
                Type="Int32" />
            <asp:Parameter Name="logEntryStatusID" Type="Int32" />
            <asp:Parameter Name="publicDescription" Type="String" />
            <asp:Parameter Name="publicHeader" Type="String" />
            <asp:Parameter Name="impactLevelID" Type="Int32" />
            <asp:Parameter Name="projectSectionID" Type="Int32" />
        </InsertParameters>
    </asp:ObjectDataSource>
    <asp:ObjectDataSource ID="LogEntryTypeDataSource" runat="server" SelectMethod="LoadAllLogEntryType"
        TypeName="DL_WEB.DAL.Client.LogEntryType"></asp:ObjectDataSource>
    <asp:ObjectDataSource ID="LogEntryStatusDataSource" runat="server" SelectMethod="LoadAllLogEntryStatus"
        TypeName="DL_WEB.DAL.Client.LogEntryStatus"></asp:ObjectDataSource>
    <asp:ObjectDataSource ID="ImpactLevelDataSource" runat="server" SelectMethod="LoadAllImpactLevel"
        TypeName="DL_WEB.DAL.Client.ImpactLevel"></asp:ObjectDataSource>
    <asp:ObjectDataSource ID="ProjectSectionDataSource" runat="server" SelectMethod="LoadAllProjectSectionByProjectID"
        TypeName="DL_WEB.DAL.Client.ProjectSection">
        <SelectParameters>
            <asp:QueryStringParameter DefaultValue="0" Name="projectID" QueryStringField="ProjectID"
                Type="Int32" />
        </SelectParameters>
    </asp:ObjectDataSource>
    &nbsp;&nbsp;&nbsp;
</asp:Content>
