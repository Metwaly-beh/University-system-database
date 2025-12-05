<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="removeResignedDeductions.aspx.cs" Inherits="WebApplication1.removeResignedDeductions" %>
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <asp:Button ID="btnRemove" runat="server" Text="Remove Deductions" OnClick="btnRemove_Click" />
            <br /><br />
            <asp:Label ID="lblMessage" runat="server"></asp:Label>
        </div>
    </form>
</body>
</html>