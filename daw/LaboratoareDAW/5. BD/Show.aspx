<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Show.aspx.cs" Inherits="Show" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">

        <asp:Literal ID="EroareBazaDate" runat="server"></asp:Literal>

        <div>
            <asp:Label ID="Label1" runat="server" Text="Nume"></asp:Label>
            <br />
            <asp:Label Width="100%" ID="Nume"
                runat="server"></asp:Label>
        </div>
        <br />
        <div>
            <asp:Label ID="Label2" runat="server" Text="Prenume"></asp:Label>
            <br />
            <asp:Label Width="100%" ID="Prenume"
                runat="server"></asp:Label>
        </div>
        <br />
        <div>
            <asp:Label ID="Label3" runat="server" Text="Telefon"></asp:Label>
            <br />
            <asp:Label Width="100%" ID="Telefon"
                runat="server"></asp:Label>
        </div>
        <br />
        <div>
            <asp:Label ID="Label4" runat="server" Text="Email"></asp:Label>
            <br />
            <asp:Label ID="Email"
                runat="server" Width="100%"></asp:Label>
        </div>
    </form>
    <br />
    <asp:hyperlink ID="Hyperlink1" runat="server" NavigateUrl="~/Default.aspx">Vezi toata agenda</asp:hyperlink>
</body>
</html>
