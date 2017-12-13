<%@ Page Language="C#" AutoEventWireup="true"  CodeFile="Default.aspx.cs" Inherits="_Default" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <title>Guess Game</title>
</head>
<body>
    <form id="form1" runat="server">
        Guess the number between 1 and 100?
        <br />
        <asp:TextBox ID="TBNumber" runat="server"></asp:TextBox>
        <asp:Button ID="BVerify" runat="server" Text="Guess" OnClick="BVerify_Click" />
        <asp:CompareValidator ID="CompareValidator1" ControlToValidate="TBNumber"
            runat="server" ErrorMessage="Not a number" Operator="DataTypeCheck" Type="Integer"></asp:CompareValidator>
        <br />
        <asp:Literal ID="LAnswer" runat="server"></asp:Literal>
        <br />
        <asp:Button ID="BTryAgain" runat="server" Text="Try again" OnClick="BTryAgain_Click" Visible="false" />    
    </form>
</body>
</html>
