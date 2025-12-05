<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="WebApplication1.Login" %>
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            Please Log In<br />
            adminId:<br />
            <asp:TextBox ID="adminId" runat="server"></asp:TextBox>
            <br />
            Password:<br />
            <asp:TextBox ID="Password" runat="server" TextMode="Password"></asp:TextBox>
            <br />
            <br />
            <asp:Button ID="signin" runat="server" OnClick="signin_Click" Text="Log In" />
            <br />
            <br />
        </div>
    </form>
</body>
</html>