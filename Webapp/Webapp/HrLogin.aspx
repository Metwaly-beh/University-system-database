<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="HrLogin.aspx.cs" Inherits="Webapp.WebForm1" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>HR Login</title>
    <style>
        body {
            margin: 0;
            padding: 0;
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            background: #f3f4f6;
            height: 100vh;
            display: flex;
            justify-content: center;
            align-items: center;
        }

        .login-container {
            background: #ffffff;
            width: 380px;
            padding: 40px 35px;
            border-radius: 20px;
            box-shadow: 0 8px 20px rgba(0,0,0,0.1);
            text-align: center;
        }

        .logo-placeholder {
            width: 180px;
            height: 120px;
            margin: 0 auto 20px auto;
            background: #e5e7eb;
            border-radius: 15px;
            display: flex;
            justify-content: center;
            align-items: center;
            font-size: 14px;
            color: #6b7280;
        }

        label {
            font-weight: 600;
            display: block;
            text-align: left;
            margin: 10px 0 5px 0;
        }

        input[type="text"], input[type="password"], .aspNetDisabled {
            width: 100%;
            padding: 10px;
            border-radius: 8px;
            border: 1px solid #d1d5db;
            margin-bottom: 15px;
            font-size: 14px;
        }

        #Signin {
            width: 100%;
            background: #2563eb;
            color: #fff;
            border: none;
            padding: 12px;
            border-radius: 10px;
            font-size: 16px;
            cursor: pointer;
            transition: 0.2s;
        }

        #Signin:hover {
            background: #1d4ed8;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div class="login-container">

           <img src="logo.png" class="logo-placeholder" />

            <h2>Please Login</h2>

            <label for="username">Username</label>
            <asp:TextBox ID="username" runat="server"></asp:TextBox>

            <label for="password">Password</label>
            <asp:TextBox ID="password" runat="server" TextMode="Password"></asp:TextBox>

            <asp:Button ID="Signin" runat="server" OnClick="login" Text="Login" />

        </div>
    </form>
</body>
</html>
