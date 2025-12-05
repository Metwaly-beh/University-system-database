<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ViewPerformance.aspx.cs" Inherits="Academic_Employee_Part_1.ViewPerformance" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Performance</title>
    <style>
        body { font-family: Arial, sans-serif; padding: 30px; background-color: #fff; }
        .container { border: 1px solid #ccc; padding: 20px; max-width: 800px; margin: 0 auto; background-color: #f9f9f9; }
        h2 { margin-top: 0; }
        label { font-weight: bold; margin-right: 10px; }
        input[type="text"] { padding: 5px; border: 1px solid #999; }
        .btn { padding: 5px 15px; background-color: #17a2b8; color: white; border: 1px solid #17a2b8; cursor: pointer; }
        .grid-view { margin-top: 20px; width: 100%; border-collapse: collapse; }
        .grid-view th { background-color: #17a2b8; color: white; padding: 8px; text-align: left; }
        .grid-view td { border: 1px solid #ddd; padding: 8px; }
        .home-link { display: inline-block; margin-top: 20px; color: #0056b3; text-decoration: underline; }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div class="container">
            <h2>Performance</h2>
            
            <label>Semester:</label>
            <asp:TextBox ID="txtSemester" runat="server"></asp:TextBox>
            <asp:Button ID="btnView" runat="server" Text="View" CssClass="btn" OnClick="btnView_Click" />
            
            <br />
            <asp:GridView ID="gridPerformance" runat="server" CssClass="grid-view" GridLines="Both" EmptyDataText="No records found."></asp:GridView>
            
            <a href="Home.aspx" class="home-link">Back to Home</a>
        </div>
    </form>
</body>
</html>