<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ViewDeductions.aspx.cs" Inherits="Academic_Employee_Part_1.ViewDeductions" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Deductions</title>
    <style>
        body { font-family: Arial, sans-serif; padding: 30px; background-color: #fff; }
        .container { border: 1px solid #ccc; padding: 20px; max-width: 800px; margin: 0 auto; background-color: #f9f9f9; }
        h2 { margin-top: 0; }
        label { font-weight: bold; }
        input[type="text"] { padding: 5px; border: 1px solid #999; margin-right: 10px; }
        .btn { padding: 5px 15px; background-color: #17a2b8; color: white; border: 1px solid #17a2b8; cursor: pointer; }
        .grid-view { width: 100%; border-collapse: collapse; margin-top: 20px; }
        .grid-view th { background-color: #17a2b8; color: white; padding: 8px; text-align: left; }
        .grid-view td { border: 1px solid #ccc; padding: 8px; }
        .home-link { display: inline-block; margin-top: 20px; color: #0056b3; }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div class="container">
            <h2>View Deductions</h2>
            
            <label>Month:</label>
            <asp:TextBox ID="txtMonth" runat="server" Width="100px"></asp:TextBox>
            <asp:Button ID="btnShow" runat="server" Text="Filter" CssClass="btn" OnClick="btnShow_Click" />
            
            <asp:GridView ID="gridDeductions" runat="server" CssClass="grid-view" GridLines="Both" EmptyDataText="No deductions found."></asp:GridView>
            <br />
            <a href="Home.aspx" class="home-link">Back to Home</a>
        </div>
    </form>
</body>
</html>