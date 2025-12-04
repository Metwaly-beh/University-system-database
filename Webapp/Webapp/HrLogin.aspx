<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="HrLogin.aspx.cs" Inherits="Webapp.WebForm1" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>

            Please Login<br />
            <br />
            <br />
            <br />
            Username<br />
            <asp:TextBox ID="username" runat="server"></asp:TextBox>
            <br />
            <br />
            Password<br />
            <asp:TextBox ID="password" runat="server"></asp:TextBox>

            <br />
            <br />
            <asp:Button ID="Signin" runat="server" OnClick="login" Text ="Login" />

        </div>
    </form>
</body>
</html>
