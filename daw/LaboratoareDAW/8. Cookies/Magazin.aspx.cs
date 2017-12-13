using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Magazin : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

        HttpCookie uid = Request.Cookies["visitor_id"];
        HttpCookie uLoc = Request.Cookies["visitor_location"];

        String ofertaC = "Oferta Cluj";

        // Oferta pe Bucuresti
        String ofertaB = "Oferta Bucuresti";

        // Verific locatia userului din cookie
        if (uLoc.Value == "Bucuresti")
        {
            Response.Write(ofertaB);
        }
        else
        {
            Response.Write(ofertaC);
        }
    }
}