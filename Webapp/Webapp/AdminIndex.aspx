<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AdminIndex.aspx.cs" Inherits="Webapp.AdminIndex" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Admin Dashboard</title>

    <style>
        body {
            font-family: Arial, sans-serif;
            background: #121212;
            color: white;
            padding: 20px;
            margin: 0;
        }

        .header {
            text-align: center;
            border-bottom: 2px solid #00bcd4;
            margin-bottom: 30px;
            padding-bottom: 10px;
        }

        .header h1 {
            margin: 0;
            font-size: 32px;
            letter-spacing: 1px;
            color: #00e5ff;
        }

        .menu-container {
            display: flex;
            flex-wrap: wrap;
            justify-content: center;
            gap: 25px;
            max-width: 1000px;
            margin: 0 auto;
        }

        .menu-link {
            display: block;
            width: 220px;
            padding: 20px;
            background: #1e1e1e;
            border: 2px solid #00e5ff;
            text-align: center;
            text-decoration: none;
            color: #00e5ff;
            font-weight: bold;
            border-radius: 10px;
            transition: 0.3s;
            box-shadow: 0px 0px 8px #00e5ff80;
        }

        .menu-link:hover {
            background: #00e5ff;
            color: #121212;
            box-shadow: 0px 0px 15px #00e5ff;
            transform: scale(1.05);
        }

        .logout {
            display: block;
            width: 140px;
            margin: 50px auto 0 auto;
            padding: 12px;
            background-color: #ff4444;
            color: white;
            text-align: center;
            text-decoration: none;
            font-size: 15px;
            font-weight: bold;
            border-radius: 8px;
            transition: 0.3s;
        }

        .logout:hover {
            background-color: #ff0000;
            transform: scale(1.07);
            box-shadow: 0 0 12px #ff4444;
        }
    </style>

</head>
<body>
    <form id="form1" runat="server">

        <div class="header">
            <h1>Admin Dashboard</h1>
        </div>

        <div class="menu-container">
            <a href="AddHoliday.aspx" class="menu-link">Add Holiday</a>
            <a href="ViewEmployees_click.aspx" class="menu-link">View Employees</a>
            <a href="CountDept.aspx" class="menu-link">Department Count</a>
            <a href="RejectedMedical.aspx" class="menu-link">Reject Medical Leaves</a>
            <a href="removeResignedDeductions.aspx" class="menu-link">Remove Deductions</a>
            <a href="UpdateAttendance.aspx" class="menu-link">Update Attendance</a>
            <a href="InitAttendance.aspx" class="menu-link">Initiate Attendance</a>
            <a href="AdminPart2.aspx" class="menu-link">Other</a>
        </div>

        <a href="index.aspx" class="logout">Log Out</a>

    </form>
</body>
</html>