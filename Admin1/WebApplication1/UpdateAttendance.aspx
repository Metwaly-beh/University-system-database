<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="UpdateAttendance.aspx.cs" Inherits="WebApplication1.UpdateAttendance" %>
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <asp:Label ID="Label1" runat="server" Text="Employee ID"></asp:Label>
            <br />
            <asp:TextBox ID="txtEmployeeID" runat="server"></asp:TextBox>
            <br /><br />
            
            <asp:Label ID="Label2" runat="server" Text="Check In Time"></asp:Label>
            <br />
            <asp:TextBox ID="txtCheckIn" runat="server" TextMode="Time"></asp:TextBox>
            <br /><br />
            
            <asp:Label ID="Label3" runat="server" Text="Check Out Time"></asp:Label>
            <br />
            <asp:TextBox ID="txtCheckOut" runat="server" TextMode="Time"></asp:TextBox>
            <br /><br />
            
            <asp:Button ID="btnUpdate" runat="server" Text="Update Attendance" OnClick="btnUpdate_Click" />
            <br /><br />
            <asp:Label ID="lblMessage" runat="server"></asp:Label>
        </div>
    </form>
</body>
</html>