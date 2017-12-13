<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="CarSearch.aspx.cs" Inherits="CarSearch" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

    <asp:SqlDataSource ID="SDSSearch" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" 
        SelectCommand="SELECT Car.Id, Car.Model, Car.MaxSpeed, Car.Power, Car.Color, Car.FDate, Brand.BrandName FROM Brand INNER JOIN Car ON Brand.Id = Car.IdBrand">
    </asp:SqlDataSource>

    <asp:Label ID="LSelect" runat="server" Text=""></asp:Label>
    <br />
    <asp:Repeater ID="Repeater1" runat="server" DataSourceID="SDSSearch">
        <HeaderTemplate>
            Search results:
        </HeaderTemplate>
        <ItemTemplate>
            <div style="padding: 10px; background-color: #e6ff99">
                <h3><%# DataBinder.Eval(Container.DataItem, "BrandName")%> <%# DataBinder.Eval(Container.DataItem, "Model")%></h3>
            
                <div>
                    Maximum Speed: <%# DataBinder.Eval(Container.DataItem, "MaxSpeed")%>
                </div>
                <div>
                    Power: <%# DataBinder.Eval(Container.DataItem, "Power")%>
                </div>
                <div>
                    Color: <%# DataBinder.Eval(Container.DataItem, "Color")%>
                </div>
                <div>
                     Fabrication Date: <%# DataBinder.Eval(Container.DataItem, "FDate")%>
                </div>
                 
                <asp:LoginView ID="LoginView1" runat="server">
                    <LoggedInTemplate>
                        <asp:HyperLink ID="HyperLink1" NavigateUrl='<%# "~/UpdateCar.aspx?id=" + DataBinder.Eval((Container.Parent as RepeaterItem).DataItem, "Id")%>' runat="server" ForeColor="Black" >Update Car</asp:HyperLink>
                    </LoggedInTemplate>
                </asp:LoginView>
             </div>
        </ItemTemplate>
        <SeparatorTemplate>
            <br />
        </SeparatorTemplate>
    </asp:Repeater>
</asp:Content>

