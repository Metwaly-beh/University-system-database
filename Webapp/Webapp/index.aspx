<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="index.aspx.cs" Inherits="Webapp.index" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Welcome</title>

    <style>
        body {
            margin: 0;
            padding: 0;
            font-family: "Segoe UI", Arial, sans-serif;
            background: linear-gradient(135deg, #4e54c8, #8f94fb);
            height: 100vh;
            display: flex;
            justify-content: center;
            align-items: center;
        }

        .container {
            background: #ffffff20;
            backdrop-filter: blur(10px);
            padding: 40px 60px;
            border-radius: 16px;
            box-shadow: 0 8px 25px rgba(0, 0, 0, 0.2);
            text-align: center;
        }

        .container h1 {
            color: white;
            margin-bottom: 25px;
            font-size: 28px;
            letter-spacing: 1px;
        }

        .cool-btn {
            width: 200px;
            padding: 14px 20px;
            margin: 12px 0;
            border: none;
            border-radius: 8px;
            background: #ffffff;
            font-size: 18px;
            cursor: pointer;
            transition: 0.3s ease;
        }

        .cool-btn:hover {
            transform: translateY(-3px);
            box-shadow: 0 6px 15px rgba(255,255,255,0.4);
            background: #f0f0f0;
        }

       
        #Button3 {
            background: #ffb3b3;
        }

        #Button3:hover {
            background: #ff3939;
            box-shadow: 0 6px 15px rgba(255,0,0,0.9);
        }
    </style>
</head>

<body>
    <form id="form1" runat="server">
        <div class="container">
            <h1>Select a Portal 🌀</h1>

            <asp:Button ID="Button1" runat="server" CssClass="cool-btn" OnClick="b1" Text="Admin" />
            <br />

            <asp:Button ID="Button2" runat="server" CssClass="cool-btn" OnClick="b2" Text="Employee" />
            <br />

            <asp:Button ID="Button3" runat="server" CssClass="cool-btn" OnClick="b3" Text="HR😈" />
        </div>
    </form>
</body>
</html>
