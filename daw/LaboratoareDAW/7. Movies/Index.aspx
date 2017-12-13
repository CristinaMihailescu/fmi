<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="Index.aspx.cs" Inherits="Index" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

    <asp:XmlDataSource ID="XDSMovie" runat="server" DataFile="~/Movies.xml" XPath="moviestore/movie"></asp:XmlDataSource>

    <asp:Repeater ID="Repeater1" runat="server" DataSourceID="XDSMovie">
        <ItemTemplate>
            <div style="background-color: #cceeff; width: 460px; height:250px">
                <div style="float: left; width: 140px; padding: 5px">
                    <img runat="server" id="MovieImg" width="120" height="190" src='<%# "~/Images/" + XPath("@ID") + ".jpg" %>' />
                </div>
                <div style="float: right; width: 300px">
                    <div style="padding: 2px">
                        <h3><%# XPath("title") %> (<%# XPath("@year") %>)</h3>
                    </div>
                    <div style="padding: 2px">
                        Directed by <%# XPath("director") %>
                    </div>
                    <div style="padding: 2px">
                        Genre: <%# XPath("@genre") %>
                    </div>
                    <div style="padding: 2px">
                        Duration: <%# XPath("@duration") %> mins
                    </div>
                    <div style="padding: 2px">
                        Actors:
                        <asp:Repeater ID="Repeater2" runat="server" DataSource='<%# XPathSelect("actor") %>'>
                            <ItemTemplate><%# XPath(".") %></ItemTemplate>
                            <SeparatorTemplate>, </SeparatorTemplate>
                        </asp:Repeater>
                    </div>
                    <div style="padding: 2px">
                        <asp:HyperLink ID="HyperLink1" NavigateUrl='<%# "~/EditMovie.aspx?id=" + XPath("@ID") %>' runat="server">Edit</asp:HyperLink>
                        |
                        <asp:HyperLink ID="HyperLink2" NavigateUrl='<%# "~/DeleteMovie.aspx?id=" + XPath("@ID") %>' runat="server">Delete</asp:HyperLink>
                    </div>
                </div>
            </div>
        </ItemTemplate>
        <SeparatorTemplate>
            <br />
        </SeparatorTemplate>
    </asp:Repeater>
</asp:Content>

