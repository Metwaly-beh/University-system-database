<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="HRIndex.aspx.cs" Inherits="Webapp.HRIndex" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <h1>Payroll Management System</h1>

    
    <br>
    
    <h2>Navigation Menu</h2>
    
    <h3>1. Leave Approval (Annual/Accidental)</h3>
    <p>Approve or reject annual and accidental leaves based on employee balance</p>
    <button type="button">Go to Leave Approval</button>
    <br>
    
    <h3>2. Unpaid Leave Approval</h3>
    <p>Approve or reject unpaid leave requests</p>
    <button type="button">Go to Unpaid Leave</button>
    <br>
    
    <h3>3. Compensation Leave Approval</h3>
    <p>Approve or reject compensation leave requests</p>
    <button type="button">Go to Compensation Leave</button>
    <br>
    
    <h3>4. Add Deduction - Missing Hours</h3>
    <p>Add deductions for missing hours in employee timesheets</p>
    <button type="button">Go to Hour Deductions</button>
    <br>
    
    <h3>5. Add Deduction - Missing Days</h3>
    <p>Add deductions for missing days from work</p>
    <button type="button">Go to Day Deductions</button>
    <br>
    
    <h3>6. Add Deduction - Unpaid Leave</h3>
    <p>Process deductions for approved unpaid leaves</p>
    <button type="button">Go to Unpaid Leave Deductions</button>
    <br>
    
    <h3>7. Generate Monthly Payroll</h3>
    <p>Generate monthly payroll reports for all employees</p>
    <button type="button">Go to Payroll Generation</button>
    <br>
    
    <button type="button">Logout</button>
</body>
</html>
