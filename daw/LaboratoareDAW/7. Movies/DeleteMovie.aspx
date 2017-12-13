<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="DeleteMovie.aspx.cs" Inherits="DeleteMovie" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
<div id="ConfirmPanel" runat="server" style="padding: 10px">
    <h3>
    Do you wish to delete
        <asp:Label ID="LTitle" runat="server" Text="Movie title"></asp:Label>
        from
        <asp:Label ID="LYear" runat="server" Text="Year"></asp:Label>?
    </h3>
    <asp:Button ID="BDelete" runat="server" Text="Yes" Width="50" OnClick="BDelete_Click" />
    <span style="padding-left:20px"></span>
    <asp:Button ID="BCancel" runat="server" Text="No" Width="50" OnClick="BCancel_Click"/>
</div>
<div style="padding: 10px">
    <asp:Literal ID="LAnswer" runat="server" Visible="false"></asp:Literal>
</div>
</asp:Content>

