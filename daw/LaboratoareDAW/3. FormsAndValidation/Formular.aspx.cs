using System;
using System.Data;
using System.Configuration;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;

public partial class Formular : System.Web.UI.Page 
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void Button1_Click(object sender, EventArgs e)
    {
        LiteralRaspuns.Visible = true;
        LiteralRaspuns.Text = "Va multumim pentru completarea datelor!";
    }

    protected void CheckBoxAng_CheckedChanged(object sender, EventArgs e)
    {
        PanelAng.Visible = CheckBoxAng.Checked;
    }

    protected void CustomValidator1_ServerValidate(object source, ServerValidateEventArgs args)
    {
        try
        {   // Validare la nivel de backend
            
            DateTime datan = DateTime.Parse(TextBoxData.Text);
            if (datan.AddYears(int.Parse(TextBoxVarsta.Text)).Year.CompareTo(DateTime.Today.Year) == 0) args.IsValid = true;
            else args.IsValid = false;
        }
        catch (Exception)
        {
            args.IsValid = false;
        }
    }
}
