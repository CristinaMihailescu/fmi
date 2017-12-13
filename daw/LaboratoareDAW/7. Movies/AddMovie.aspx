<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="AddMovie.aspx.cs" Inherits="AddMovie" %>

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
    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="TBDuration" ErrorMessage="Duration is required." ForeColor="Red"></asp:RequiredFieldValidator>
    <asp:RangeValidator ID="RangeValidator1" runat="server"  ControlToValidate="TBDuration" ErrorMessage="Duration must be between 10 and 500 minutes." MinimumValue="10" MaximumValue="500" Type="Integer" ForeColor="Red" ></asp:RangeValidator>
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
    <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="FUImage" ErrorMessage="Image is required." ForeColor="Red"></asp:RequiredFieldValidator>
</div>
<div style="padding: 10px">
    <asp:Button ID="BAddMovie" runat="server" Text="Add Movie" OnClick="BAddMovie_Click" />
</div>
<div style="padding: 10px">
    <asp:Literal ID="LAnswer" runat="server"></asp:Literal>
</div>
</asp:Content>

