<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ViewEmployees_click.aspx.cs" Inherits="WebApplication1.ViewEmployees_click" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <asp:Label ID="Label1" runat="server" Text="employee_ID"></asp:Label>
            <br />
            <asp:TextBox ID="employee_ID" runat="server"></asp:TextBox>
            <br />
            <br />
            <asp:Label ID="Label2" runat="server" Text="first_name"></asp:Label>
            <br />
            <br />
            <asp:TextBox ID="first_name" runat="server"></asp:TextBox>
            <br />
            <asp:Label ID="Label3" runat="server" Text="last_name"></asp:Label>
            <br />
            <br />
            <asp:TextBox ID="last_name" runat="server"></asp:TextBox>
            <br />
            <asp:Label ID="Label4" runat="server" Text="gender"></asp:Label>
            <br />
            <br />
            <asp:TextBox ID="gender" runat="server"></asp:TextBox>
            <br />
            <asp:Label ID="Label5" runat="server" Text="email"></asp:Label>
            <br />
            <br />
            <asp:TextBox ID="email" runat="server"></asp:TextBox>
            <br />
            <asp:Label ID="Label6" runat="server" Text="address"></asp:Label>
            <br />
            <br />
            <asp:TextBox ID="address" runat="server"></asp:TextBox>
            <br />
            <asp:Label ID="Label7" runat="server" Text="annual_balance"></asp:Label>
            <br />
            <br />
            <asp:TextBox ID="annual_balance" runat="server"></asp:TextBox>
            <br />
            <asp:Label ID="Label8" runat="server" Text="accidental_balance"></asp:Label>
            <br />
            <br />
            <asp:TextBox ID="accidental_balance" runat="server"></asp:TextBox>
            <br />
            <br />
            <br />
            <br />
            <br />
            <br />
            <br />
            <br />
        </div>
        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="true">
</asp:GridView>
    </form>
</body>
</html>
