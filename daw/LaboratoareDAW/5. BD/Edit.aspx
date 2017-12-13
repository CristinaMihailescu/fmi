<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Edit.aspx.cs" Inherits="Edit" %>

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
            <asp:TextBox Width="100%" ID="Nume"
                runat="server"></asp:TextBox>
        </div>
        <br />
        <div>
            <asp:Label ID="Label2" runat="server" Text="Prenume"></asp:Label>
            <br />
            <asp:TextBox Width="100%" ID="Prenume"
                runat="server"></asp:TextBox>
        </div>
        <br />
        <div>
            <asp:Label ID="Label3" runat="server" Text="Telefon"></asp:Label>
            <br />
            <asp:TextBox Width="100%" ID="Telefon"
                runat="server"></asp:TextBox>
        </div>
        <br />
        <div>
            <asp:Label ID="Label4" runat="server" Text="Email"></asp:Label>
            <br />
            <asp:TextBox ID="Email"
                runat="server" Width="100%"></asp:TextBox>
        </div>
        <br />
        <div>
            <asp:Button ID="Button1" OnClick="EditareIntrare_Click" runat="server" Text="Editeaza" />
        </div>
    </form>
    <br />
    <asp:hyperlink ID="Hyperlink1" runat="server" NavigateUrl="~/Default.aspx">Vezi toata agenda</asp:hyperlink>
</body>
</html>
