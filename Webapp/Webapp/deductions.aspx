<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="deductions.aspx.cs" Inherits="Webapp.deductions" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>



            <asp:Label ID="DeductHours" runat="server" Text="DeductHours"></asp:Label>
            <asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>
            <asp:Button ID="DeductHoursB" runat="server" OnClick="DeductHoursP"  Text="deduct" />




            <br />
             <asp:Label ID="Deductdays" runat="server" Text="Deductdays"></asp:Label>
              <asp:TextBox ID="TextBox2" runat="server"></asp:TextBox>
             <asp:Button ID="DeductdaysB" runat="server" OnClick="DeductDaysP" Text="deduct" />
            <br />
        <asp:Label ID="DeductUnpaid" runat="server" Text="DeductUnpaid"></asp:Label>
        <asp:TextBox ID="TextBox3" runat="server"></asp:TextBox>
      <asp:Button ID="DeductUnpaidB" runat="server" OnClick="DeductUnpaidP" Text="deduct" />



        </div>
    </form>
</body>
</html>
