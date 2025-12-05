<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ViewPayroll.aspx.cs" Inherits="Academic_Employee_Part_1.ViewPayroll" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Payroll</title>
    <style>
        body { font-family: Arial, sans-serif; padding: 30px; background-color: #fff; }
        .container { border: 1px solid #ccc; padding: 20px; max-width: 800px; margin: 0 auto; background-color: #f9f9f9; }
        h2 { margin-top: 0; }
        .btn { padding: 8px 15px; background-color: #17a2b8; color: white; border: 1px solid #17a2b8; cursor: pointer; margin-bottom: 15px; }
        .grid-view { width: 100%; border-collapse: collapse; }
        .grid-view th { background-color: #17a2b8; color: white; padding: 8px; border: 1px solid #59359a; }
        .grid-view td { border: 1px solid #ccc; padding: 8px; }
        .home-link { display: inline-block; margin-top: 20px; color: #0056b3; }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div class="container">
            <h2>Payroll Details</h2>
            <asp:Button ID="btnPayroll" runat="server" Text="Show Last Month" CssClass="btn" OnClick="btnPayroll_Click" />
            <asp:GridView ID="gridPayroll" runat="server" CssClass="grid-view" GridLines="Both" EmptyDataText="No payroll found."></asp:GridView>
            <br />
            <a href="Home.aspx" class="home-link">Back to Home</a>
        </div>
    </form>
</body>
</html>