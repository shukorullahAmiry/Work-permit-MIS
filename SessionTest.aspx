<%@ Page Language="C#" AutoEventWireup="true" CodeFile="SessionTest.aspx.cs" Inherits="SessionTest" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <pre>
        
            Your Session ID:    <asp:TextBox runat="server" ID="uxSessionID"></asp:TextBox>
            Your Session Value: <asp:TextBox runat="server" ID="uxSessionValue"></asp:TextBox>
            
            <asp:Button runat="server" ID="uxGetSession" Text="Get Session" OnClick="uxGetSession_Click" />  
            <asp:Button runat="server" ID="uxSetSession" Text="Set Session" OnClick="uxSetSession_Click" />
    </pre>
    </form>
</body>
</html>
