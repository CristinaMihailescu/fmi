<%@ Page Language="C#" AutoEventWireup="true"  CodeFile="Default.aspx.cs" Inherits="_Default" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <title>Hello World</title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
        <asp:Literal ID="PageLiteral" runat="server"></asp:Literal>
        <br />
        HTML controls:
        <br />
        <input type="text" id="HtmlTextBox" runat="server" /> 
        <br />
        <input type="button" id="HtmlButton" runat="server" onserverclick="HtmlButtonClick" value="Say Hello!" />
        <br />
        <label id="HtmlHelloText" runat="server" visible="false"></label>
        <br />
        <br />
        .NET Controls
        <br />
        <asp:TextBox ID="NameTextBox" runat="server"></asp:TextBox>
        <br />
        <asp:Button ID="SayHelloButton" runat="server" OnClick="SayHelloButtonClick" Text="Say Hello!" />
        <br />
        <asp:Literal ID="HelloText" runat="server"></asp:Literal>
    </div>
    </form>
</body>
</html>
