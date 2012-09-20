<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Subscribe.aspx.cs" Inherits="anonymous_Subscribe" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <title>Subscribe to update notifications</title>
    <link href="../styles.css" rel="stylesheet" type="text/css" />
</head>
<body>
    <form id="form1" runat="server">
        <div class="subscribe-header">
            <asp:Image ID="Image1" runat="server" ImageUrl="~/images/logo.JPG" />
        </div>
        <div style="padding-left: 7px">
            <asp:MultiView ID="MultiView1" runat="server" ActiveViewIndex="0">
                <asp:View ID="View1" runat="server">
                    <div class="subs_header">
                        Registration
                    </div>
                    <br />
                    <span class="second_header">Your Information</span><br />
                    <div style="color: #000099">
                        Please provide your information here. Items marked with an '*' require a response
                        for signup.</div>
                    <br />
                    <table cellpadding="0" cellspacing="0">
                        <tr>
                            <td align="right" style="white-space: nowrap; color: #000099">
                                Email Address*:&nbsp;</td>
                            <td>
                                <asp:TextBox ID="tbEmail" runat="server" Width="329px"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="tbEmail"
                                    CssClass="error" Display="Dynamic" ErrorMessage="*"></asp:RequiredFieldValidator>
                                <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ControlToValidate="tbEmail"
                                    ErrorMessage="RegularExpressionValidator" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"
                                    CssClass="error">*</asp:RegularExpressionValidator></td>
                        </tr>
                        <tr>
                            <td align="right" style="white-space: nowrap; color: #000099;">
                                First Name*:&nbsp;</td>
                            <td style="height: 23px">
                                <asp:TextBox ID="tbFirstName" runat="server" Width="329px"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="tbFirstName"
                                    ErrorMessage="RequiredFieldValidator" CssClass="error">*</asp:RequiredFieldValidator></td>
                        </tr>
                        <tr>
                            <td align="right" style="white-space: nowrap; color: #000099">
                                Last Name*:&nbsp;</td>
                            <td>
                                <asp:TextBox ID="tbLastName" runat="server" Width="329px"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="tbFirstName"
                                    ErrorMessage="RequiredFieldValidator" CssClass="error">*</asp:RequiredFieldValidator></td>
                        </tr>
                        <tr>
                            <td align="right" style="white-space: nowrap; color: #000099">
                                Company Name*:&nbsp;</td>
                            <td>
                                <asp:TextBox ID="tbCompany" runat="server" Width="329px"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="tbCompany"
                                    ErrorMessage="RequiredFieldValidator" CssClass="error">*</asp:RequiredFieldValidator></td>
                        </tr>
                        <tr>
                            <td align="right" style="white-space: nowrap; color: #000099">
                                Impact Level:&nbsp;</td>
                            <td>
                                <asp:DropDownList ID="ImpactLevelList" runat="server" DataSourceID="ImpactLevelDataSource"
                                    DataTextField="Name" DataValueField="ImpactLevelID">
                                </asp:DropDownList>
                            </td>
                        </tr>
                        <tr>
                            <td>
                            </td>
                            <td>
                                <br />
                                <asp:Button ID="btnSubmit" runat="server" OnClick="btnSubmit_Click" Text="Submit" />
                                &nbsp;&nbsp;&nbsp;<input type="button" value="Cancel" onclick="window.history.back();" /></td>
                        </tr>
                    </table>
                </asp:View>
                <asp:View ID="View2" runat="server">
                    <div class="subs_header">
                        Welcome to Deployment Logger</div>
                    <p>
                        Thank you for joining the Deployment Logger mailing list.<br />
                        A confirmation e-mail has been sent to your address.
                    </p>
                    <asp:HyperLink ID="ReturnLink" runat="server" Text="Return to the report"></asp:HyperLink>
                </asp:View>
            </asp:MultiView>
        </div>
        <asp:ObjectDataSource ID="ImpactLevelDataSource" runat="server" SelectMethod="LoadAllImpactLevel"
            TypeName="DL_WEB.DAL.Client.ImpactLevel"></asp:ObjectDataSource>
    </form>
</body>
</html>
