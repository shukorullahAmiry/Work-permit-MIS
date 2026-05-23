<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Test.aspx.cs" Inherits="Test" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
        
        <p>
            <h1>User's Public IP : <asp:Label runat="server" ID="uxUserIP"></asp:Label></h1>
        </p>
        
        <pre>

            Input:      <asp:TextBox runat="server" ID="uxInput" Width="900PX"></asp:TextBox>

            
            <asp:Button runat="server" ID="uxEncrypt" Text ="Encrypt" OnClick="Encrypt" />  <asp:Button runat="server" ID="uxDecrypt" Text ="Decrypt" OnClick="Decrypt" />

            
            <asp:Label runat="server" ID="Label1" Font-Size="Large" Font-Bold="true" ForeColor="Black" Text="Encrypted: "></asp:Label> <asp:Label runat="server" ID="uxEncrypted" Font-Size="Large" Font-Bold="true" ForeColor="Green" ></asp:Label>

            <asp:Label runat="server" ID="Label2" Font-Size="Large" Font-Bold="true" ForeColor="Black" Text="Decrypted: "></asp:Label> <asp:Label runat="server" ID="uxDecrypted" Font-Size="Large" Font-Bold="true" ForeColor="Goldenrod" ></asp:Label>
        </pre>
    </div>

    </form>
</body>
</html>
