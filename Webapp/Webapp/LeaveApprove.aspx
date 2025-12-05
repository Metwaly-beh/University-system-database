<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="LeaveApprove.aspx.cs" Inherits="Webapp.LeaveApprove" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>


    <form id="form1" runat="server">
        <div>

        </div>
    

    
    <div>

        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;

        <asp:Label ID="Label2" runat="server" Text="request_ID"></asp:Label>
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;  
        <asp:Label ID="Label1" runat="server" Text="HR_ID"></asp:Label> 
        <br />

        <asp:TextBox ID="Request_id" runat="server"></asp:TextBox>
        <asp:TextBox ID="HR_ID" runat="server"></asp:TextBox>

        <asp:Button ID="ApproveProc" runat="server" OnClick="ApproveProcCall" Text="submit" />

    </div>
</form>
</body>
</html>
