<%@ Page Language="C#" AutoEventWireup="true"  CodeFile="Default.aspx.cs" Inherits="_Default" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <title>Untitled Page</title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
    <!-- cookie-urile - ofera un mijloc de stocare a informatiilor
         un cookie - este un fisier stocat pe hard disk cu cheie valoare si data de expirare
                   - care insoteste cererile si paginile intre Server si Browser
                   - astfel aplicatia web poate citi de fiecare data cand utilizatorul viziteaza site-ul
cum functioneaza:  - utilizatorul solicita o pagina web
                   - aplicatia trimite pagina + cookie-ul care contine data si ora cand user-ul a accesat pagina
                   - cand utilizatorul acceseaza iar pagina si scrie in browser URL-ul site-ului 
                   - aplicatia "se uita" pe hard disk sa caute cookie-ul asociat cu URL-ul
                   - daca exista, browserul trimite cookie-ul pe site 
                   - iar aplicatia poate sa determine data si ora cand utilizatorul s-a conectat ultima data
                   - ex: site de cumparaturi pentru a tine evidenta cumparaturilor
                         pentru un vot - sa nu lasam un utilizator sa voteze din acelasi browser de doua ori (vizualizari you tube)
        utilizare: - pentru a mentine date despre utilizatori
                   - pentru a mentine continuitatea unei aplicatii web
                   - intr-un cookie se pot stoca adrese, id-uri, hashuri, data, ora, text, etc -->
        <center>
            <br />
            Application Hit Count :
            <asp:Label ID="Label1" runat="server" Text="Label"></asp:Label>
            <br />
            Session Hit Count :
            <asp:Label ID="Label2" runat="server" Text="Label"></asp:Label>
        </center>        
    </div>
    </form>
</body>
</html>
