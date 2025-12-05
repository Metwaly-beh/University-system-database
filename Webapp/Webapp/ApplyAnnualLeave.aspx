<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ApplyAnnualLeave.aspx.cs" Inherits="Academic_Employee_Part_1.ApplyAnnualLeave" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Apply for Leave</title>
    <style>
        body { font-family: Arial, sans-serif; padding: 30px; background-color: #fff; }
        .form-container { border: 1px solid #ccc; padding: 30px; max-width: 400px; margin: 0 auto; background-color: #f9f9f9; }
        h2 { margin-top: 0; text-align: center; border-bottom: 1px solid #ccc; padding-bottom: 10px; }
        .field { margin-bottom: 15px; }
        label { display: block; margin-bottom: 5px; font-weight: bold; font-size: 14px; }
        input { width: 95%; padding: 8px; border: 1px solid #ccc; }
        .btn { width: 100%; padding: 10px; background-color: #17a2b8; color: white; border: 1px solid #17a2b8; cursor: pointer; margin-top: 10px; }
        .status { display: block; text-align: center; margin-top: 15px; font-weight: bold; }
        .cancel { display: block; text-align: center; margin-top: 15px; color: #666; text-decoration: none; }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div class="form-container">
            <h2>Annual Leave Form</h2>
            
            <div class="field">
                <label>Start Date (Format: DD/MM/YYYY)</label>
                <asp:TextBox ID="txtStart" runat="server"></asp:TextBox>
            </div>

            <div class="field">
                <label>End Date (Format: DD/MM/YYYY)</label>
                <asp:TextBox ID="txtEnd" runat="server"></asp:TextBox>
            </div>

            <div class="field">
                <label>Replacement ID</label>
                <asp:TextBox ID="txtReplacement" runat="server"></asp:TextBox>
            </div>

            <asp:Button ID="btnSubmit" runat="server" Text="Apply" CssClass="btn" OnClick="btnSubmit_Click" />
            
            <asp:Label ID="lblMsg" runat="server" CssClass="status"></asp:Label>
            
            <a href="Home.aspx" class="cancel">Cancel</a>
        </div>
    </form>
</body>
</html>