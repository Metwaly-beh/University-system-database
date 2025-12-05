<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AcademicPart2.aspx.cs" Inherits="GUC_Projet.AcademicPart2" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server"><title>Part 2</title></head>
<body>
    <form id="form1" runat="server">
        <asp:Label ID="lbl" runat="server" ForeColor="Blue"></asp:Label>
        <hr />

        Accidental: <asp:TextBox ID="tA1" runat="server" TextMode="Date" />
        <asp:TextBox ID="tA2" runat="server" TextMode="Date" />
        <asp:Button Text="Apply" OnClick="applyAcc" runat="server" />
        <br /><br />

        Medical: <asp:TextBox ID="tM1" runat="server" TextMode="Date" />
        <asp:TextBox ID="tM2" runat="server" TextMode="Date" />
        <asp:DropDownList ID="dM" runat="server"><asp:ListItem>sick</asp:ListItem><asp:ListItem>maternity</asp:ListItem></asp:DropDownList>
        <asp:Button Text="Apply" OnClick="applyMed" runat="server" />
        <br /><br />

        Unpaid: <asp:TextBox ID="tU1" runat="server" TextMode="Date" />
        <asp:TextBox ID="tU2" runat="server" TextMode="Date" />
        <asp:Button Text="Apply" OnClick="applyUnp" runat="server" />
        <br /><br />

        Compensate: <asp:TextBox ID="tC1" runat="server" TextMode="Date" /> 
        <asp:TextBox ID="tC2" runat="server" placeholder="Reason" />
        <asp:Button Text="Apply" OnClick="applyCom" runat="server" />
        <br /><hr />

        Dean Action: <asp:TextBox ID="tLID" runat="server" placeholder="Leave ID" />
        <asp:DropDownList ID="dA" runat="server"><asp:ListItem>Approved</asp:ListItem><asp:ListItem>Rejected</asp:ListItem></asp:DropDownList>
        <asp:Button Text="Decide" OnClick="doAction" runat="server" />
        <br /><br />

        Evaluate: <asp:TextBox ID="tEID" runat="server" placeholder="Emp ID" Width="50" />
        <asp:TextBox ID="tR" runat="server" placeholder="Rating (1-5)" Width="80" />
        <asp:TextBox ID="tSem" runat="server" placeholder="Semester" Width="80" />
        <asp:TextBox ID="tCom" runat="server" placeholder="Comment" />
        <asp:Button Text="Submit" OnClick="doEval" runat="server" />
    </form>
</body>
</html>
