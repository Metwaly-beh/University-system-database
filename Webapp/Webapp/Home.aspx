<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Home.aspx.cs" Inherits="Academic_Employee_Part_1.Home" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Home</title>
    <style>
        body { font-family: Arial, sans-serif; background-color: white; padding: 20px; }
        .header { text-align: center; border-bottom: 2px solid #0056b3; margin-bottom: 30px; padding-bottom: 10px; }
        .menu-container { display: flex; flex-wrap: wrap; justify-content: center; gap: 20px; max-width: 800px; margin: 0 auto; }
        .menu-link { display: block; width: 200px; padding: 20px; background-color: #f2f2f2; border: 1px solid #ccc; text-align: center; text-decoration: none; color: #333; font-weight: bold; }
        .logout { display: block; width: 100px; margin: 40px auto; padding: 10px; background-color: #cc0000; color: white; text-align: center; text-decoration: none; font-size: 14px; }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div class="header">
            <h1>Academic Dashboard</h1>
        </div>
        
        <div class="menu-container">
            <a href="ViewPerformance.aspx" class="menu-link">Performance</a>
            <a href="ViewAttendance.aspx" class="menu-link">Attendance</a>
            <a href="ViewPayroll.aspx" class="menu-link">Payroll</a>
            <a href="ViewDeductions.aspx" class="menu-link">Deductions</a>
            <a href="ApplyAnnualLeave.aspx" class="menu-link">Apply for Leave</a>
            <a href="ViewLeaveStatus.aspx" class="menu-link">Leave Status</a>
            <a href="AcademicPart2.aspx" class="menu-link">Other</a>
        </div>

        <a href="index.aspx" class="logout">Log Out</a>
    </form>
</body>
</html>