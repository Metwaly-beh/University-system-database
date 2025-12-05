<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="HrIndex.aspx.cs" Inherits="Webapp.HrIndex" %>

<!DOCTYPE html>
<html>
<head runat="server">
    <title>HR Dashboard</title>
    <style>
        body {
            margin: 0;
            padding: 0;
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            background: #1a1a1a;
            color: #f3f3f3;
        }

        /* Navbar */
        .navbar {
            display: flex;
            justify-content: space-between;
            align-items: center;
            background: #111;
            color: #ff4d4d;
            padding: 15px 30px;
            box-shadow: 0 4px 10px rgba(255,0,0,0.3);
        }

        .navbar a {
            color: #ff4d4d;
            text-decoration: none;
            margin-right: 20px;
            font-weight: 600;
            transition: 0.2s;
        }

        .navbar a:hover {
            color: #ff1a1a;
            text-shadow: 0 0 8px #ff0000;
        }

        .hr-msg {
            font-size: 16px;
            opacity: 0.9;
            color: #ff0000;
        }

     

        /* Main content container */
        .content-container {
            max-width: 1000px;
            margin: 50px auto;
            padding: 30px;
            background: #2c2c2c;
            border-radius: 20px;
            box-shadow: 0 8px 20px rgba(255,0,0,0.3);
        }

        h1 {
            text-align: center;
            margin-bottom: 30px;
            color: #ff0000;
            text-shadow: 0 0 10px #ff0000;
        }

        /* Evil buttons */
        .fun-btn {
            display: inline-block;
            background: #ff0000;
            color: #fff;
            padding: 12px 25px;
            border-radius: 12px;
            font-weight: bold;
            cursor: pointer;
            transition: 0.3s;
            margin: 10px;
            box-shadow: 0 0 10px #ff0000;
        }

        .fun-btn:hover {
            background: #cc0000;
            
            box-shadow: 0 0 20px #ff0000;
        }

        /* Footer */
        .footer {
            text-align: center;
            padding: 20px;
            font-size: 14px;
            color: #ff4d4d;
        }

       
    </style>
</head>
<body>
    <form id="form1" runat="server">

        <!-- Navbar -->
        <!-- Navbar -->
<div class="navbar">
<div style="display:flex; align-items:center; gap:15px;">
<img src="logo.png" alt="HR Logo" style="width:75px; height:50px; border-radius:10px; border:1px solid #ff0000; box-shadow:0 0 5px #ff0000;" />
<a href="HrIndex.aspx">Dashboard</a>
<a href="CompApprove.aspx">Comp Approve</a>
<a href="LeaveApprove.aspx">Leave Approve</a>
<a href="UnpaidApprove.aspx">Unpaid Approve</a>
<a href="deductions.aspx">Deductions</a>
<a href="Payroll.aspx">Payroll</a>
</div>
<span class="hr-msg">😈 HR is watching....</span>
</div>

        <!-- Page Content -->
        <div class="content-container">
            <h1>Welcome HR! 😈</h1>
            <p>Here’s where you can control the fate of employees… and maybe scare a little. 🩸</p>

            <div style="text-align:center; margin-top:30px;">
               <asp:Button ID="bu1" 
            runat="server" 
            CssClass="fun-btn" 
            Text="switch user"
            OnClick="b1" />

<asp:Button ID="bu2" 
            runat="server" 
            CssClass="fun-btn" 
            Text="switch portal"
            OnClick="b2" />

<asp:Button ID="b3" 
            runat="server" 
            CssClass="fun-btn" 
            Text="Send Scary Mail(DO NOT USE!!!)"
            />
            </div>
        </div>

        <!-- Footer -->
        <div class="footer">
            © شركة المرعبين المحدودة 
            
        </div>

    </form>
</body>
</html>
