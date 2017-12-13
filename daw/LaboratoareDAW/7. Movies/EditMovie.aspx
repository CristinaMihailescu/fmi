<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="EditMovie.aspx.cs" Inherits="EditMovie" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
<div style="padding: 10px">
    <div>
        <asp:Label ID="Label1" runat="server" Text="Title:"></asp:Label>
    </div>
    <asp:TextBox ID="TBTitle" runat="server"></asp:TextBox>
    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="TBTitle" ErrorMessage="Title is required." ForeColor="Red"></asp:RequiredFieldValidator>
</div>
<div style="padding: 10px">
    <div>
        <asp:Label ID="Label2" runat="server" Text="Year:"></asp:Label>
    </div>
    <asp:DropDownList ID="DDLYear" runat="server" DataSource="<%# Last100Years %>"></asp:DropDownList>
</div>
<div style="padding: 10px">
    <div>
        <asp:Label ID="Label3" runat="server" Text="Duration:"></asp:Label>
    </div>
    <asp:TextBox ID="TBDuration" runat="server"></asp:TextBox>
    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="TBDuration" ErrorMessage="Duration is required." ForeColor="Red" Display="Dynamic"></asp:RequiredFieldValidator>
    <asp:RangeValidator ID="RangeValidator1" runat="server"  ControlToValidate="TBDuration" ErrorMessage="Duration must be between 10 and 500 minutes." MinimumValue="10" MaximumValue="500" Type="Integer" ForeColor="Red" Display="Dynamic"></asp:RangeValidator>
</div>
<div style="padding: 10px">
    <div>
        <asp:Label ID="Label4" runat="server" Text="Genre:"></asp:Label>
    </div>
    <asp:TextBox ID="TBGenre" runat="server"></asp:TextBox>
</div>
<div style="padding: 10px">
    <div>
        <asp:Label ID="Label5" runat="server" Text="Director:"></asp:Label>
    </div>
    <asp:TextBox ID="TBDirector" runat="server"></asp:TextBox>
</div>

<div style="padding: 10px">
    <div>
        <asp:Label ID="Label6" runat="server" Text="Actors:"></asp:Label>
    </div>
    <asp:TextBox ID="TBActor1" runat="server"></asp:TextBox>
</div>
<div style="padding: 10px">
    <asp:TextBox ID="TBActor2" runat="server"></asp:TextBox>
</div>
<div style="padding: 10px">
    <asp:TextBox ID="TBActor3" runat="server"></asp:TextBox>
</div>
<div style="padding: 10px">
    <div>
        <asp:Label ID="Label7" runat="server" Text="Image:"></asp:Label>
    </div>
    <asp:FileUpload ID="FUImage" runat="server" />
</div>
<div style="padding: 10px">
    <asp:Button ID="BEditMovie" runat="server" Text="Save Movie" OnClick="BEditMovie_Click" />
</div>
<div style="padding: 10px">
    <asp:Literal ID="LAnswer" runat="server"></asp:Literal>
</div>
</asp:Content>

