<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="CompApprove.aspx.cs" Inherits="Webapp.CompApprove" %>
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Compensation Leave Approval</title>
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
            max-width: 1000px;
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

        /* Pending Requests Section */
        .pending-section {
            padding: 30px;
            background: #f8f9fa;
            border-bottom: 2px solid #e9ecef;
        }

        .pending-section h2 {
            color: #2c3e50;
            font-size: 20px;
            margin-bottom: 20px;
            padding-bottom: 10px;
            border-bottom: 3px solid #667eea;
            display: inline-block;
        }

        .request-item {
            background: white;
            padding: 18px;
            margin-bottom: 12px;
            border-radius: 8px;
            border-left: 4px solid #667eea;
            box-shadow: 0 2px 8px rgba(0, 0, 0, 0.08);
            transition: all 0.3s ease;
            color: #2c3e50;
            font-size: 15px;
        }

        .request-item:hover {
            transform: translateX(5px);
            box-shadow: 0 4px 12px rgba(0, 0, 0, 0.12);
        }

        /* Approval Form Section */
        .approval-section {
            padding: 30px;
        }

        .approval-section h2 {
            color: #2c3e50;
            font-size: 20px;
            margin-bottom: 25px;
            text-align: center;
        }

        .form-grid {
            display: grid;
            grid-template-columns: 1fr 1fr;
            gap: 20px;
            margin-bottom: 25px;
        }

        .form-group {
            display: flex;
            flex-direction: column;
        }

        .form-label {
            color: #495057;
            font-weight: 600;
            margin-bottom: 8px;
            font-size: 14px;
            text-transform: uppercase;
            letter-spacing: 0.5px;
        }

        .form-input {
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

            .form-grid {
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
            <a href="CompApprove.aspx" class="navbar-link active">Comp Approve</a>
            <a href="LeaveApprove.aspx" class="navbar-link">Leave Approve</a>
            <a href="UnpaidApprove.aspx" class="navbar-link">Unpaid Approve</a>
            <a href="deductions.aspx" class="navbar-link">Deductions</a>
            <a href="Payroll.aspx" class="navbar-link">Payroll</a>
        </div>
        <span class="navbar-message">😈 HR is watching....</span>
    </div>

    <form id="form1" runat="server">
        <div class="page-container">
            <div class="content-card">
                <!-- Header -->
                <div class="card-header">
                    <h1>Compensation Leave Approval</h1>
                    <p>Review and approve pending compensation leave requests</p>
                </div>

                <!-- Pending Requests Display -->
                <div class="pending-section">
                    <h2>Pending Requests</h2>
                    <!-- Dynamic labels will be added here by the code-behind -->
                </div>

                <!-- Approval Form -->
                <div class="approval-section">
                    <h2>Approve Request</h2>
                    <div class="form-grid">
                        <div class="form-group">
                            <asp:Label ID="Label2" runat="server" Text="Request ID" CssClass="form-label"></asp:Label>
                            <asp:TextBox ID="Request_id" runat="server" CssClass="form-input" placeholder="Enter request ID"></asp:TextBox>
                        </div>
                        <div class="form-group">
                            <asp:Label ID="Label1" runat="server" Text="HR ID" CssClass="form-label"></asp:Label>
                            <asp:TextBox ID="HR_ID" runat="server" CssClass="form-input" placeholder="Enter your HR ID"></asp:TextBox>
                        </div>
                    </div>
                    <asp:Button ID="ApproveProc" runat="server" OnClick="ApproveProcCall" Text="Submit Approval" CssClass="submit-button" />
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