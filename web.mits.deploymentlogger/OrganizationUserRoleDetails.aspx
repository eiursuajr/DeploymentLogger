<%@ Page Language="C#" AutoEventWireup="true" CodeFile="OrganizationUserRoleDetails.aspx.cs"
    Inherits="OrganizationUserRoleDetails" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <link href="styles.css" rel="stylesheet" type="text/css" />

    <script language="javascript" type="text/javascript">
    <!--
    <%  if (IsPostBack)
        {   %>
    GetRadWindow().BrowserWindow.window.document.forms[0].submit();
    <%  }   %>
	function GetRadWindow()
	{
		var oWindow = null;
		if (window.radWindow) oWindow = window.radWindow;
		else if (window.frameElement.radWindow) oWindow = window.frameElement.radWindow;
		return oWindow;
	}		
		
	function OK_Clicked()
	{
		var oWindow = GetRadWindow();
		oWindow.Hide(null);
	}
	
	function Cancel_Clicked()
	{
		var oWindow = GetRadWindow();			
		oWindow.Close();
	}
    //-->
    </script>

</head>
<body style="margin: 15px">
    <form id="form1" runat="server">
        <table>
            <tr>
                <td class="fieldname">
                    Organization</td>
                <td>
                    <asp:DropDownList ID="ddlOrganization" runat="server" DataSourceID="OrganizationDataSource"
                        DataTextField="Name" DataValueField="OrganizationID">
                    </asp:DropDownList>
                </td>
            </tr>
            <tr>
                <td class="fieldname">
                    Role</td>
                <td>
                    <asp:DropDownList ID="ddlRole" runat="server" DataSourceID="RoleDataSource" DataTextField="Name"
                        DataValueField="RoleID">
                    </asp:DropDownList><asp:ObjectDataSource ID="RoleDataSource" runat="server" SelectMethod="LoadAllRole"
                        TypeName="DL_WEB.DAL.Master.Role"></asp:ObjectDataSource>
                </td>
            </tr>
            <tr>
                <td>
                </td>
                <td>
                    <input type="submit" value="Save" onclick="OK_Clicked();" />
                    <input type="button" value="Cancel" onclick="Cancel_Clicked();" />
                </td>
            </tr>
        </table>
    </form>
    <asp:ObjectDataSource ID="OrganizationDataSource" runat="server" SelectMethod="LoadAllNonDeletedOrganizations"
        TypeName="DL_WEB.DAL.Master.Organization"></asp:ObjectDataSource>
</body>
</html>
