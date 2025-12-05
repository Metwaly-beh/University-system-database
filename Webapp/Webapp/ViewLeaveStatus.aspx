<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ViewLeaveStatus.aspx.cs" Inherits="Academic_Employee_Part_1.ViewLeaveStatus" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Leave Status</title>
    <style>
        body { font-family: Arial, sans-serif; padding: 30px; background-color: #fff; }
        .container { border: 1px solid #ccc; padding: 20px; max-width: 800px; margin: 0 auto; background-color: #f9f9f9; }
        h2 { margin-top: 0; }
        .btn { padding: 8px 15px; background-color: #17a2b8; color: white; border: 1px solid #17a2b8; cursor: pointer; margin-bottom: 15px; font-weight: bold; }
        .grid-view { width: 100%; border-collapse: collapse; }
        .grid-view th { background-color: #17a2b8; color: black; padding: 8px; border: 1px solid #d39e00; text-align: left; }
        .grid-view td { border: 1px solid #ccc; padding: 8px; }
        .home-link { display: inline-block; margin-top: 20px; color: #0056b3; }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div class="container">
            <h2>Leave Request Status</h2>
            <asp:Button ID="btnStatus" runat="server" Text="Refresh Status" CssClass="btn" OnClick="btnStatus_Click" />
            <asp:GridView ID="gridLeaves" runat="server" CssClass="grid-view" GridLines="Both" EmptyDataText="No leaves found."></asp:GridView>
            <br />
            <a href="Home.aspx" class="home-link">Back to Home</a>
        </div>
    </form>
</body>
</html>