<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AddHoliday.aspx.cs" Inherits="WebApplication1.AddHoliday" %>
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <asp:Label ID="Label1" runat="server" Text="Holiday Name"></asp:Label>
            <br />
            <asp:TextBox ID="txtHolidayName" runat="server"></asp:TextBox>
            <br />
            <br />
            <asp:Label ID="Label2" runat="server" Text="From"></asp:Label>
            <br />
            <asp:TextBox ID="From" runat="server" TextMode="Date"></asp:TextBox>
            <br />
            <br />
            <asp:Label ID="Label3" runat="server" Text="To"></asp:Label>
            <br />
            <asp:TextBox ID="To" runat="server" TextMode="Date"></asp:TextBox>
        </div>
        <p>
            <asp:Button ID="btnAdd" runat="server" Text="Add Holiday" OnClick="AddHoliday_Click" />
        </p>
    </form>
</body>
</html>