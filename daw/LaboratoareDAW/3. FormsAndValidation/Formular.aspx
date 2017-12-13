<%@ Page Language="C#" AutoEventWireup="true"  CodeFile="Formular.aspx.cs" Inherits="Formular" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <title>Formular Student</title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
        &nbsp;</div>
    <table style="width: 700px; height: 420px">
        <tr>
            <td style="width: 150px"> 
                <asp:Label ID="Label1" runat="server" Text="Nume"></asp:Label></td>
            <td style="width: 170px">
                <asp:TextBox ID="TextBoxNume" runat="server"></asp:TextBox></td>
            <td>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="TextBoxNume"
                    ErrorMessage="Completati numele" ToolTip="Completati numele">*</asp:RequiredFieldValidator></td>
        </tr>
        <tr>
            <td style="width: 150px">
                <asp:Label ID="Label2" runat="server" Text="Prenume"></asp:Label></td>
            <td style="width: 170px">
                <asp:TextBox ID="TextBoxPrenume" runat="server"></asp:TextBox></td>
            <td>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="TextBoxPrenume"
                    ErrorMessage="Completati prenumele">*</asp:RequiredFieldValidator></td>
        </tr>
        <tr>
            <td style="width: 150px">
                <asp:Label ID="Label10" runat="server" Text="Email"></asp:Label></td>
            <td style="width: 170px">
                <asp:TextBox ID="TextBoxMail" runat="server"></asp:TextBox></td>
            <td>
                
                <asp:RequiredFieldValidator ID="RequiredFieldValidator8" Display="Dynamic" runat="server" ControlToValidate="TextBoxMail"
                    ErrorMessage="Completati adresa de email">*</asp:RequiredFieldValidator>

                <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" 
                    ErrorMessage="Adresa de email nu este valida" 
                    ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" 
                    ControlToValidate="TextBoxMail" Display="Dynamic">*</asp:RegularExpressionValidator></td>
        </tr>
        <tr>
            <td style="width: 150px">
                <asp:Label ID="Label8" runat="server" Text="Parola"></asp:Label></td>
            <td style="width: 170px">
                <asp:TextBox ID="TextBoxParola" runat="server" TextMode="Password"></asp:TextBox></td>
            <td>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="TextBoxParola"
                    ErrorMessage="Completati parola">*</asp:RequiredFieldValidator></td>
        </tr>
        <tr>
            <td style="width: 150px">
                <asp:Label ID="Label9" runat="server" Text="Confirmare"></asp:Label></td>
            <td style="width: 170px">
                <asp:TextBox ID="TextBoxConfirmare" runat="server" TextMode="Password" CausesValidation="True"></asp:TextBox></td>
            <td>
                <asp:CompareValidator ID="CompareValidator1" runat="server" ControlToCompare="TextBoxConfirmare" Operator="Equal"
                    ControlToValidate="TextBoxParola" ErrorMessage="Reconfirmarea parolei nu este corecta">*</asp:CompareValidator></td>
        </tr>
        <tr>
            <td style="width: 150px">
                <asp:Label ID="Label7" runat="server" Text="Facultatea"></asp:Label></td>
            <td style="width: 170px">
                <asp:DropDownList ID="DropDownListFacultate" runat="server">
                    <asp:ListItem>alege...</asp:ListItem>
                    <asp:ListItem >Matematica si Informatica</asp:ListItem>
                    <asp:ListItem>Litere</asp:ListItem>
                    <asp:ListItem >Biologie</asp:ListItem>
                </asp:DropDownList></td>
            <td>
                <asp:CompareValidator ID="CompareValidator2" runat="server" ControlToValidate="DropDownListFacultate"
                    ErrorMessage="Alegeti facultatea" Operator="NotEqual" ValueToCompare="alege...">*</asp:CompareValidator></td>
        </tr>
        <tr>
            <td style="width: 150px">
                <asp:Label ID="Label3" runat="server" Text="Anul de studiu"></asp:Label></td>
            <td style="width: 170px">
                <asp:DropDownList ID="DropDownListAn" runat="server">
                    <asp:ListItem>alege...</asp:ListItem>
                    <asp:ListItem>I</asp:ListItem>
                    <asp:ListItem>II</asp:ListItem>
                    <asp:ListItem>III</asp:ListItem>
                    <asp:ListItem>Master I</asp:ListItem>
                    <asp:ListItem Value="Master II"></asp:ListItem>
                </asp:DropDownList></td>
            <td>
                <asp:CompareValidator ID="CompareValidator6" runat="server" ControlToValidate="DropDownListAn"
                    ErrorMessage="Alegeti anul de studiu" Operator="NotEqual" ValueToCompare="alege...">*</asp:CompareValidator></td>
        </tr>
        <tr>
            <td style="width: 150px">
                <asp:Label ID="Label4" runat="server" Text="Data nasterii"></asp:Label></td>
            <td style="width: 170px">
                <asp:TextBox ID="TextBoxData" runat="server"></asp:TextBox></td>
            <td>
                <asp:CompareValidator ID="CompareValidator3" runat="server" ControlToValidate="TextBoxData"
                    Display="Dynamic" ErrorMessage="Completati data in format LL/ZZ/AAAA" Operator="DataTypeCheck"
                    Type="Date">*</asp:CompareValidator>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ControlToValidate="TextBoxData"
                    Display="Dynamic" ErrorMessage="Completati data nasterii">*</asp:RequiredFieldValidator></td>
        </tr>
        <tr>
            <td style="width: 150px; height: 25px">
                <asp:Label ID="Label5" runat="server" Text="Sex"></asp:Label></td>
            <td style="height: 25px; width: 170px;">
                <asp:RadioButtonList ID="RadioButtonListGender" runat="server" RepeatDirection="Horizontal">
                    <asp:ListItem>feminin</asp:ListItem>
                    <asp:ListItem>masculin</asp:ListItem>
                </asp:RadioButtonList></td>  
                        
            <td style="height: 25px">
                <asp:RequiredFieldValidator ID="RequiredFieldValidator7" ControlToValidate="RadioButtonListGender" runat="server" ErrorMessage="Selectati sexul">*</asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td style="width: 150px">
                <asp:Label ID="Label6" runat="server" Text="Varsta"></asp:Label></td>
            <td style="width: 170px">
                <asp:TextBox ID="TextBoxVarsta" runat="server" Width="33px"></asp:TextBox></td>
            <td>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="TextBoxVarsta"
                    Display="Dynamic" ErrorMessage="Completati Varsta">*</asp:RequiredFieldValidator>
                <asp:RangeValidator ID="RangeValidator1" runat="server" ControlToValidate="TextBoxVarsta"
                    Display="Dynamic" ErrorMessage="Dati varsta in intervalul 0-70" MaximumValue="70"
                    MinimumValue="0" Type="Integer">*</asp:RangeValidator>
   
                <asp:CustomValidator ID="CustomValidator1" runat="server" ControlToValidate="TextBoxVarsta"
                    Display="Dynamic" ErrorMessage="Varsta nu coincide cu data nasterii" OnServerValidate="CustomValidator1_ServerValidate">*</asp:CustomValidator></td>
        </tr>
        <tr>
            <td style="width: 150px">
                
            </td>
            <td style="width: 170px;">
                <asp:CheckBox ID="CheckBoxAng" runat="server" Text="Angajat" AutoPostBack="True" OnCheckedChanged="CheckBoxAng_CheckedChanged" /></td>
            <td>
            </td>
        </tr>
        <tr>
            <td colspan="3">
                <asp:Panel ID="PanelAng" runat="server" Height="50px" Width="750px" Visible="False">
                    <table style="width: 700px; height: 50px">
                        <tr>
                            <td style="width: 150px">
                                <asp:Label ID="LFirma" runat="server" Text="Firma"></asp:Label>
                            </td>
                            <td style="width: 170px">
                                <asp:TextBox ID="TextBoxFirma" runat="server"></asp:TextBox>
                            </td>
                            <td>
                            </td>
                        </tr>
                        <tr>
                            <td style="width: 150px">
                                <asp:Label ID="LSalariu" runat="server" Text="Salariu"></asp:Label>
                            </td>
                            <td style="width: 170px">
                                <asp:TextBox ID="TextBoxSalariu" runat="server"></asp:TextBox>
                            </td>
                            <td>
                                <asp:CompareValidator ID="CompareValidator5" runat="server" ControlToValidate="TextBoxSalariu"
                                    ErrorMessage="Completati salariu numeric" Operator="DataTypeCheck" Type="Integer">*</asp:CompareValidator></td>
                        </tr>
                    </table>
                </asp:Panel>
            </td>
        </tr>
        <tr>
            <td style="width: 150px">
            </td>
            <td style="width: 170px">
                <asp:Button ID="Button1" runat="server" Text="Trimite" OnClick="Button1_Click" />
            </td>
        </tr> 
        <tr>
            <td colspan="3" style="height: 21px">
                <asp:Literal ID="LiteralRaspuns" runat="server" Visible="False"></asp:Literal>&nbsp;
                <asp:ValidationSummary ID="ValidationSummary1" runat="server" />
            </td>
        </tr>
    </table>
    <hr />
        <asp:TextBox ID="SearchTextBox" runat="server" ValidationGroup="VGSearch"></asp:TextBox>
        <asp:Button ID="Button2" runat="server" Text="Search" ValidationGroup="VGSearch"/>
        <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" 
        ErrorMessage="Search string is empty" ControlToValidate="SearchTextBox" 
        ValidationGroup="VGSearch"></asp:RequiredFieldValidator>
    </form>
</body>
</html>
