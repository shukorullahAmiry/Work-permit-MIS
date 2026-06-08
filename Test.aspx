<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Test.aspx.cs" Inherits="Test" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
        <pre>

            Input:      <asp:TextBox ID="uxDecoded" runat="server"></asp:TextBox>
                        
            Decoded:    <asp:TextBox ID="uxEncoded" runat="server"></asp:TextBox>


            <asp:Button ID="uxEncode" runat="server" OnClick="uxEncode_Click" Text="Encode URI" />

            <asp:Button ID="uxDecode" runat="server" Text="Decode URL" OnClick="uxDecode_Click" />

        </pre>
    
    </div>
    </form>
</body>
</html>
