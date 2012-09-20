<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Login.aspx.cs" Inherits="Login" %>

<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <title>Deployment Logger</title>
    <meta http-equiv="Pragma" content="no-cache" />
    <meta http-equiv="Cache-control" content="no-cache" />
    <meta http-equiv="Expires" content="0" />
    <link href="styles.css" rel="stylesheet" type="text/css" />

    <script language="javascript" type="text/javascript" src="Scripts.js"></script>

</head>
<body>
    <form id="form1" runat="server">
        <table cellpadding="0" cellspacing="0" style="width: 100%">
            <tr class="header" valign="top">
                <td style="white-space: nowrap">
                    <%--<img src="images/logo.JPG" alt="Deployment Logger Logo" />--%>
                    <asp:Image ID="imgLogo" runat="server" ImageUrl="~/images/logo.JPG" AlternateText="Deployment Logger Logo" />
                </td>
            </tr>
            <tr>
                <td align="center" valign="top" style="padding-top: 100px">
                    <asp:Login ID="Login1" runat="server" BackColor="#F7F6F3" BorderColor="#E6E2D8" BorderStyle="Solid"
                        BorderWidth="1px" CreateUserText="register" CreateUserUrl="Register.aspx" ForeColor="#333333"
                        PasswordRecoveryText="forgot password?" PasswordRecoveryUrl="~/PasswordRecovery.aspx"
                        OnAuthenticate="loginCtrl_Authenticate" UserNameLabelText="Email Address:" UserNameRequiredErrorMessage="Email Address is required.">
                        <LoginButtonStyle BackColor="#FFFBFF" BorderColor="#CCCCCC" BorderStyle="Solid" BorderWidth="1px"
                            ForeColor="#284775" />
                        <TextBoxStyle Width="200px" />
                        <TitleTextStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                        <InstructionTextStyle Font-Italic="True" ForeColor="Black" />
                    </asp:Login>
                </td>
            </tr>
        </table>
    </form>
</body>
</html>
