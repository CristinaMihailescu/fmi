<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Search.aspx.cs" Inherits="Search" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
        <asp:Literal ID="MessagePlaceholder" runat="server"></asp:Literal>
        <h1>Cautare</h1>
        <div>
            <asp:TextBox ID="SearchParam" runat="server" Width="79%" style="float: left;"></asp:TextBox>
            <asp:Button ID="Button1" runat="server" OnClick="PerformSearch_Click" Width="20%" style="float:left" Text="Cautare" />
        </div>
        
        <br /><br /><br />

        <div>
            <h4>Rezultate cautare</h4>
            <asp:GridView ID="GridView1" runat="server">
            </asp:GridView>
            
        </div>
    </div>
    
    </form>
</body>
</html>
