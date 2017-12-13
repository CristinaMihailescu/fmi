<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Test.aspx.cs" Inherits="Test" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
        <asp:LoginView ID="LoginView1" runat="server">
            <AnonymousTemplate>
            
                     Pentru user-ul nelogat
               
            </AnonymousTemplate>
            <LoggedInTemplate>
                Apare pentru orice rol, daca utilizatorul are un cont si este logat
                <RoleGroups>
                    <asp:RoleGroup Roles="Editor">
                        Apare doar la user-ul care are rolul de Editor
                    </asp:RoleGroup>
                </RoleGroups>
            </LoggedInTemplate>
            <RoleGroups>
                <asp:RoleGroup>
                </asp:RoleGroup>
            </RoleGroups>
        </asp:LoginView>
    </div>
    </form>
    
    
</body>
</html>
