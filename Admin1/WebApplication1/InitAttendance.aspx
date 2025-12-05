<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="InitAttendance.aspx.cs" Inherits="WebApplication1.InitAttendance" %>
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <asp:Button ID="btnInit" runat="server" Text="Initiate Attendance" OnClick="btnInit_Click" />
            <br /><br />
            <asp:Label ID="lblMessage" runat="server"></asp:Label>
        </div>
    </form>
</body>
</html>