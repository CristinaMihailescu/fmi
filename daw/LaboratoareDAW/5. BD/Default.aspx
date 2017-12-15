<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="_Default" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>BD Application</title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
        <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl="~/Add.aspx">Adauga contact</asp:HyperLink>  | 
        <asp:HyperLink ID="HyperLink2" runat="server" NavigateUrl="~/Search.aspx">Cautare</asp:HyperLink>
        <br />
        <hr />
        <h4>Agenda curenta:</h4>
        <br />

        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString='Data Source=(LocalDB)\v11.0;AttachDbFilename="C:\Users\mihai\Desktop\Git\fmi\daw\LaboratoareDAW\5. BD\App_Data\Agenda.mdf";Integrated Security=True' SelectCommand="select * from agenda"></asp:SqlDataSource>

        <asp:ListView ID="ListView1" runat="server" DataSourceID="SqlDataSource1">
            <LayoutTemplate>
                <table runat="server" id="table1" >
                    <tr runat="server" id="itemPlaceholder" ></tr>
                </table>
            </LayoutTemplate>
            <ItemTemplate>
                <tr id="Tr1" runat="server">
                    <td style="color: #ac00dc"><%#Eval("nume") %></td>
                    <td><%#Eval("prenume") %></td>
                    <td style="color: #09c"><%#Eval("email") %></td>
                    <td style="color: #ccc"><%#Eval("telefon") %></td>
                    <td>
                        <a href="Show.aspx?id=<%#Eval("id") %>">Vizualiare</a> |
                        <a href="Edit.aspx?id=<%#Eval("id") %>">Editare</a> | 
                        <a href="Delete.aspx?id=<%#Eval("id") %>">Stergere</a>
                    </td>
                </tr>
            </ItemTemplate>
        </asp:ListView>

        <hr />

        <asp:GridView ID="GridView1" runat="server" DataSourceID="SqlDataSource1">
        </asp:GridView>

        
    </div>
    </form>
</body>
</html>
