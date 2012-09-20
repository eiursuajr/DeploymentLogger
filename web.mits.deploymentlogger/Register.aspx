<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Register.aspx.cs" Inherits="register" %>

<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <title>Deployment Logger</title>
    <meta http-equiv="Pragma" content="no-cache" />
    <meta http-equiv="Cache-control" content="no-cache" />
    <meta http-equiv="Expires" content="0" />
    <link href="styles.css" rel="stylesheet" type="text/css" />

    <script language="javascript" type="text/javascript" src="scripts.js"></script>

</head>
<body>
    <form id="form1" runat="server">
        <table cellpadding="0" cellspacing="0" style="width: 100%">
            <tr class="header" valign="top">
                <td style="white-space: nowrap">
                    <%--                    <img src="images/logo.jpg" alt="Deployment Logger Logo" />--%>
                    <asp:Image ID="imgLogo" runat="server" ImageUrl="~/images/logo.JPG" AlternateText="Deployment Logger Logo" />
                </td>
            </tr>
            <tr>
                <td align="center" valign="top" style="padding-top: 100px">
                    <asp:CreateUserWizard ID="CreateUserWizard1" runat="server" BackColor="#F7F6F3" BorderColor="#E6E2D8"
                        BorderStyle="Solid" BorderWidth="1px" ContinueDestinationPageUrl="~/Default.aspx">
                        <WizardSteps>
                            <asp:CreateUserWizardStep ID="CreateUserWizardStep1" runat="server">
                            </asp:CreateUserWizardStep>
                            <asp:CompleteWizardStep ID="CompleteWizardStep1" runat="server">
                            </asp:CompleteWizardStep>
                        </WizardSteps>
                        <SideBarStyle BackColor="#5D7B9D" BorderWidth="0px" VerticalAlign="Top" />
                        <SideBarButtonStyle BorderWidth="0px" ForeColor="White" />
                        <NavigationButtonStyle BackColor="#FFFBFF" BorderColor="#CCCCCC" BorderStyle="Solid"
                            BorderWidth="1px" ForeColor="#284775" />
                        <HeaderStyle BackColor="#5D7B9D" BorderStyle="Solid" Font-Bold="True" ForeColor="White"
                            HorizontalAlign="Left" />
                        <CreateUserButtonStyle BackColor="#FFFBFF" BorderColor="#CCCCCC" BorderStyle="Solid"
                            BorderWidth="1px" ForeColor="#284775" />
                        <ContinueButtonStyle BackColor="#FFFBFF" BorderColor="#CCCCCC" BorderStyle="Solid"
                            BorderWidth="1px" ForeColor="#284775" />
                        <StepStyle BorderWidth="0px" />
                        <TitleTextStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                        <TextBoxStyle Width="200px" />
                    </asp:CreateUserWizard>
                </td>
            </tr>
        </table>
    </form>
</body>
</html>
