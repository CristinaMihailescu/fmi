<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="AddCar.aspx.cs" Inherits="AddCar" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

    <div style="padding: 10px">
        <asp:Label ID="Label1" runat="server" Text="Brand:"></asp:Label>
        <br />
        <asp:DropDownList ID="DDLBrand" runat="server" DataSourceID="SqlDataSource1" DataTextField="BrandName" DataValueField="Id"></asp:DropDownList>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT [Id], [BrandName] FROM [Brand]"></asp:SqlDataSource>
    </div>
    <div style="padding: 10px">
        <asp:Label ID="Label2" runat="server" Text="Model:"></asp:Label>
        <br />
        <asp:TextBox ID="TBModel" runat="server"></asp:TextBox>
        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" ControlToValidate="TBModel" runat="server" ErrorMessage="Car model is required" ForeColor="Red"></asp:RequiredFieldValidator>
    </div>
    <div style="padding: 10px">
        <asp:Label ID="Label3" runat="server" Text="Maximum Speed:"></asp:Label>
        <br />
        <asp:TextBox ID="TBMaxSpeed" runat="server"></asp:TextBox>
        <asp:RequiredFieldValidator ID="RequiredFieldValidator2" ControlToValidate="TBMaxSpeed" runat="server" ErrorMessage="Maximum speed is required" ForeColor="Red" Display="Dynamic"></asp:RequiredFieldValidator>
        <asp:RangeValidator ID="RangeValidator1" runat="server" ControlToValidate="TBMaxSpeed" ErrorMessage="Maximum speed must be between 20 and 600 km per h." Type="Double" MinimumValue="20" MaximumValue="600" ForeColor="Red" Display="Dynamic"></asp:RangeValidator>
    </div>
    <div style="padding: 10px">
        <asp:Label ID="Label4" runat="server" Text="Horse Power:"></asp:Label>
        <br />
        <asp:TextBox ID="TBPower" runat="server"></asp:TextBox>
        <asp:RequiredFieldValidator ID="RequiredFieldValidator3" ControlToValidate="TBPower" runat="server" ErrorMessage="Horse power is required" ForeColor="Red" Display="Dynamic"></asp:RequiredFieldValidator>
        <asp:RangeValidator ID="RangeValidator2" runat="server" ControlToValidate="TBPower" ErrorMessage="Horse power must be between 40 and 800 km per h." Type="Double" MinimumValue="40" MaximumValue="800" ForeColor="Red" Display="Dynamic"></asp:RangeValidator>
    </div>
    <div style="padding: 10px">
        <asp:Label ID="Label5" runat="server" Text="Color:"></asp:Label>
        <br />
        <asp:TextBox ID="TBColor" runat="server"></asp:TextBox>
        <asp:RequiredFieldValidator ID="RequiredFieldValidator4" ControlToValidate="TBColor" runat="server" ErrorMessage="Color is required" ForeColor="Red"></asp:RequiredFieldValidator>
    </div>
    <div style="padding: 10px">
        <asp:Label ID="Label6" runat="server" Text="Fabrication Date:"></asp:Label>
        <br />
        <asp:TextBox ID="TBFDate" runat="server"></asp:TextBox>
        <asp:RequiredFieldValidator ID="RequiredFieldValidator5" ControlToValidate="TBFDate" runat="server" ErrorMessage="Fabrication date is required" ForeColor="Red" Display="Dynamic"></asp:RequiredFieldValidator>
        <asp:CompareValidator ID="CompareValidator1" runat="server" ControlToValidate="TBFDate" ErrorMessage="Date must be in MM/DD/YYYY format" ForeColor="Red" Type="Date" Operator="DataTypeCheck" Display="Dynamic"></asp:CompareValidator>
    </div>
    <div style="padding: 10px">
        <asp:Button ID="AddButton" runat="server" Text="Add New Car" OnClick="AddButton_Click" />
    </div>
    <div style="padding: 10px">
        <asp:Label ID="LAnswer" runat="server" Text=""></asp:Label>
    </div>
</asp:Content>

