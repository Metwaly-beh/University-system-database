<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AdminPart2.aspx.cs" Inherits="Project.AdminPart2" %>

<!DOCTYPE html>
<html>
<head runat="server">
    <title>Admin Part 2</title>
</head>
<body>
<form id="form1" runat="server">

<h2>Attendance Yesterday</h2>
<asp:Button ID="btnYesterday" runat="server" Text="Fetch" OnClick="btnYesterday_Click" />
<asp:GridView ID="gridYesterday" runat="server"></asp:GridView>

<h2>Winter Performance</h2>
<asp:Button ID="btnWinter" runat="server" Text="Fetch" OnClick="btnWinter_Click" />
<asp:GridView ID="gridWinter" runat="server"></asp:GridView>

<h2>Remove Attendance On Holidays</h2>
<asp:Button ID="btnRemoveHoliday" runat="server" Text="Remove" OnClick="btnRemoveHoliday_Click" />

<h2>Remove Unattended Day Off</h2>
<asp:TextBox ID="txtDayoffID" runat="server" placeholder="Employee ID"></asp:TextBox>
<asp:Button ID="btnRemoveDayoff" runat="server" Text="Remove" OnClick="btnRemoveDayoff_Click" />

<h2>Remove Approved Leaves From Attendance</h2>
<asp:Button ID="btnRemoveApproved" runat="server" Text="Remove" OnClick="btnRemoveApproved_Click" />

<h2>Replace Employee</h2>
<asp:TextBox ID="txtOldEmp" runat="server" placeholder="Old Employee ID"></asp:TextBox>
<asp:TextBox ID="txtNewEmp" runat="server" placeholder="New Employee ID"></asp:TextBox>
<asp:Button ID="btnReplace" runat="server" Text="Replace" OnClick="btnReplace_Click" />

<h2>Update Employment Status</h2>
<asp:Button ID="btnUpdateStatus" runat="server" Text="Update" OnClick="btnUpdateStatus_Click" />

<br />
<asp:Label ID="lblMsg" runat="server"></asp:Label>

</form>
</body>
</html>