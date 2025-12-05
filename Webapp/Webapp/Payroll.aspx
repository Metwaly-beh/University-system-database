<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Payroll.aspx.cs" Inherits="Webapp.Payroll" %>
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Payroll Generation</title>
    <style>
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }

        body {
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
            min-height: 100vh;
        }

        /* Navbar Styles */
        .main-navbar {
            background: linear-gradient(135deg, #1e3c72 0%, #2a5298 100%);
            padding: 15px 30px;
            box-shadow: 0 4px 12px rgba(0, 0, 0, 0.15);
            display: flex;
            justify-content: space-between;
            align-items: center;
        }

        .navbar-content {
            display: flex;
            align-items: center;
            gap: 15px;
        }

        .navbar-logo {
            width: 75px;
            height: 50px;
            border-radius: 10px;
            border: 1px solid #ffFFFF;
            box-shadow: 0 0 5px #ffFFFF;
        }

        .navbar-link {
            color: white;
            text-decoration: none;
            padding: 10px 18px;
            border-radius: 6px;
            transition: all 0.3s ease;
            font-weight: 500;
            font-size: 15px;
        }

        .navbar-link:hover {
            background: rgba(255, 255, 255, 0.2);
            transform: translateY(-2px);
        }

        .navbar-link.active {
            background: rgba(255, 255, 255, 0.25);
            border-bottom: 2px solid #ffFFFF;
        }

        .navbar-message {
            color: #ffeb3b;
            font-weight: 600;
            font-size: 16px;
            text-shadow: 2px 2px 4px rgba(0, 0, 0, 0.3);
        }

        /* Main Content Container */
        .page-container {
            max-width: 900px;
            margin: 30px auto;
            padding: 0 20px;
        }

        .content-card {
            background: white;
            border-radius: 12px;
            box-shadow: 0 10px 40px rgba(0, 0, 0, 0.2);
            overflow: hidden;
        }

        .card-header {
            background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
            color: white;
            padding: 30px;
            text-align: center;
        }

        .card-header h1 {
            font-size: 28px;
            font-weight: 600;
            margin-bottom: 8px;
        }

        .card-header p {
            font-size: 15px;
            opacity: 0.95;
        }

        /* Form Section */
        .form-section {
            padding: 40px;
        }

        .form-section h2 {
            color: #2c3e50;
            font-size: 20px;
            margin-bottom: 30px;
            text-align: center;
        }

        .form-group {
            margin-bottom: 20px;
        }

        .form-label {
            color: #495057;
            font-weight: 600;
            margin-bottom: 8px;
            font-size: 14px;
            text-transform: uppercase;
            letter-spacing: 0.5px;
            display: block;
        }

        .form-input {
            width: 100%;
            padding: 12px 15px;
            border: 2px solid #e9ecef;
            border-radius: 8px;
            font-size: 15px;
            transition: all 0.3s ease;
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
        }

        .form-input:focus {
            outline: none;
            border-color: #667eea;
            box-shadow: 0 0 0 3px rgba(102, 126, 234, 0.1);
        }

        .input-row {
            display: grid;
            grid-template-columns: 1fr 1fr 1fr;
            gap: 15px;
            margin-bottom: 25px;
        }

        .submit-button {
            width: 100%;
            padding: 15px;
            background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
            color: white;
            border: none;
            border-radius: 8px;
            font-size: 16px;
            font-weight: 600;
            cursor: pointer;
            transition: all 0.3s ease;
            text-transform: uppercase;
            letter-spacing: 1px;
        }

        .submit-button:hover {
            transform: translateY(-2px);
            box-shadow: 0 6px 20px rgba(102, 126, 234, 0.4);
        }

        .submit-button:active {
            transform: translateY(0);
        }

        /* Footer Styles */
        .page-footer {
            background: linear-gradient(135deg, #1e3c72 0%, #2a5298 100%);
            color: white;
            text-align: center;
            padding: 20px;
            margin-top: 40px;
            font-size: 16px;
            font-weight: 500;
            box-shadow: 0 -4px 12px rgba(0, 0, 0, 0.15);
        }

        @media (max-width: 768px) {
            .main-navbar {
                flex-direction: column;
                gap: 15px;
                padding: 15px;
            }

            .navbar-content {
                flex-wrap: wrap;
                justify-content: center;
            }

            .input-row {
                grid-template-columns: 1fr;
            }

            .card-header h1 {
                font-size: 22px;
            }
        }
    </style>
</head>
<body>
    <!-- Navigation Bar -->
    <div class="main-navbar">
        <div class="navbar-content">
            <img src="logo.png" alt="HR Logo" class="navbar-logo" />
            <a href="HrIndex.aspx" class="navbar-link">Dashboard</a>
            <a href="CompApprove.aspx" class="navbar-link">Comp Approve</a>
            <a href="LeaveApprove.aspx" class="navbar-link">Leave Approve</a>
            <a href="UnpaidApprove.aspx" class="navbar-link">Unpaid Approve</a>
            <a href="deductions.aspx" class="navbar-link">Deductions</a>
            <a href="Payroll.aspx" class="navbar-link active">Payroll</a>
        </div>
        <span class="navbar-message">😈 HR is watching....</span>
    </div>

    <form id="form1" runat="server">
        <div class="page-container">
            <div class="content-card">
                <!-- Header -->
                <div class="card-header">
                    <h1>Payroll Generation</h1>
                    <p>Generate payroll for employees within a specific date range</p>
                </div>

                <!-- Form Section -->
                <div class="form-section">
                    <h2>Enter Payroll Details</h2>
                    
                    <div class="form-group">
                        <asp:Label ID="Label1" runat="server" Text="Employee ID" CssClass="form-label"></asp:Label>
                        <asp:TextBox ID="TextBox1" runat="server" CssClass="form-input" placeholder="Enter employee ID"></asp:TextBox>
                    </div>

                    <div class="input-row">
                        <div class="form-group">
                            <label class="form-label">From Date</label>
                            <asp:TextBox ID="TextBox2" runat="server" CssClass="form-input" placeholder="YYYY-MM-DD"></asp:TextBox>
                        </div>
                        <div class="form-group">
                            <label class="form-label">To Date</label>
                            <asp:TextBox ID="TextBox3" runat="server" CssClass="form-input" placeholder="YYYY-MM-DD"></asp:TextBox>
                        </div>
                    </div>

                    <asp:Button ID="Button1" runat="server" OnClick="GeneratePayRoll" Text="Generate Payroll" CssClass="submit-button" />
                </div>
            </div>
        </div>
    </form>

    <!-- Footer -->
    <div class="page-footer">
        © شركة المرعبين المحدودة
    </div>
</body>
</html>