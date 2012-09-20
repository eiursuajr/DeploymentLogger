<%@ Page Language="C#" AutoEventWireup="true" CodeFile="SubscribeConfirmation.aspx.cs" Inherits="anonymous_SubscribeConfirmation" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <title>Confirm subscribtion</title>
    <link href="../styles.css" rel="stylesheet" type="text/css" />
</head>
<body>
    <form id="form1" runat="server">
    <div class="subscribe-header" >
        &nbsp;<div style="width: 100px; height: 100px">
        <asp:Image ID="Image1" runat="server" ImageUrl="~/images/logo.JPG" /></div>
    </div>
        <br />
        <asp:MultiView ID="MultiView1" runat="server">
            <asp:View ID="View1" runat="server">
    
    Your interest preferences have been successfully recorded. Please close this window
                    to continue browsing.<br />
                    
    Thank you for using Micajah Deployment Logger.
            </asp:View>
            <asp:View ID="View2" runat="server">
                Some problems are occured during the registration process.<br />
                You should try to register.</asp:View>
        </asp:MultiView><br />
    
    </form>
</body>
</html>
