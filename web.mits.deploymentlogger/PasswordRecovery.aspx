<%@ Page Language="C#" AutoEventWireup="true" CodeFile="PasswordRecovery.aspx.cs"
    Inherits="PasswordRecovery" %>

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
                    <img src="images/logo.jpg" alt="Deployment Logger Logo" />
                </td>
            </tr>
            <tr>
                <tr>
                    <td align="center" valign="top" style="padding-top: 100px">
                        <asp:PasswordRecovery ID="PasswordRecovery1" runat="server" BackColor="#F7F6F3" BorderColor="#E6E2D8"
                            BorderStyle="Solid" BorderWidth="1px">
                            <InstructionTextStyle ForeColor="Black" />
                            <SuccessTextStyle Font-Bold="True" ForeColor="#5D7B9D" />
                            <TextBoxStyle Width="200px" />
                            <TitleTextStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                            <SubmitButtonStyle BackColor="#FFFBFF" BorderColor="#CCCCCC" BorderStyle="Solid"
                                BorderWidth="1px" ForeColor="#284775" />
                        </asp:PasswordRecovery>
                    </td>
                </tr>
        </table>
    </form>
</body>
</html>
