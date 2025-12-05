<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="LoginEmp.aspx.cs" Inherits="Academic_Employee_Part_1.Login" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Login</title>
    <style>
        body { font-family: Arial, sans-serif; background-color: #e6e6e6; display: flex; justify-content: center; align-items: center; height: 100vh; margin: 0; }
        .login-box { background-color: white; width: 300px; padding: 30px; border: 1px solid #999; text-align: center; }
        h2 { margin-top: 0; color: #333; }
        .form-group { text-align: left; margin-bottom: 15px; }
        label { display: block; margin-bottom: 5px; font-weight: bold; font-size: 14px; }
        input[type="text"], input[type="password"] { width: 90%; padding: 8px; border: 1px solid #ccc; }
        .btn { width: 100%; padding: 10px; background-color: #17a2b8; color: white; border: none; font-size: 14px; cursor: pointer; margin-top: 10px; }
        .message { margin-top: 15px; font-size: 12px; font-weight: bold; }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div class="login-box">
            <h2>Academic Employee Portal</h2>
            
            <div class="form-group">
                <label>User ID</label>
                <asp:TextBox ID="loginID" runat="server"></asp:TextBox>
            </div>
            
            <div class="form-group">
                <label>Password</label>
                <asp:TextBox ID="loginPassword" runat="server" TextMode="Password"></asp:TextBox>
            </div>

            <asp:Button ID="signin" runat="server" Text="Log In" CssClass="btn" OnClick="signin_Click" />
            
            <div class="message">
                <asp:Label ID="lblMessage" runat="server" ForeColor="#cc0000"></asp:Label>
            </div>
        </div>
    </form>
</body>
</html>