<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Payroll.aspx.cs" Inherits="Webapp.Payroll" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <asp:Label ID="Label1" runat="server" Text="EmpId,from, to  "></asp:Label>

             <asp:TextBox ID="TextBox1" runat="server"></asp:TextBox> 
             <asp:TextBox ID="TextBox2" runat="server"></asp:TextBox> 
             <asp:TextBox ID="TextBox3" runat="server"></asp:TextBox> 
            <asp:Button ID="Button1" runat="server" OnClick="GeneratePayRoll" Text="Generate" />


           


        </div>
    </form>
</body>
</html>
