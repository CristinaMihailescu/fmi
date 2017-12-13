using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Cookie : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        // Verifica daca utilizatorul (vizitatorul) are un GUID, daca nu are se creeaza un nou id

        if (Response.Cookies["visitor_id"].Value == null || Response.Cookies["visitor_location"].Value == null)
        {
            Response.Cookies["visitor_id"].Value = "asdds-dasd-gf-gf-gas-dsad";
            Response.Cookies["visitor_id"].Expires = DateTime.Now.AddDays(30);

            Response.Cookies["visitor_location"].Value = "Bucuresti";
            Response.Cookies["visitor_location"].Expires = DateTime.Now.AddDays(30);
        }

        Response.Redirect("/Magazin.aspx");
        
    }
}