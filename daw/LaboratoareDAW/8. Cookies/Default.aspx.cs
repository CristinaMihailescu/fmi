using System;
using System.Data;
using System.Configuration;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;

public partial class _Default : System.Web.UI.Page 
{
    protected void Page_Load(object sender, EventArgs e)
    {      
        // Application - starea aplicatiei
        Application["appHitCount"] = Convert.ToInt32(Application["appHitCount"]) + 1;        
        Label1.Text = Application["appHitCount"].ToString();
        Session["sessionHitCount"] = Convert.ToInt32(Session["sessionHitCount"]) + 1;
        Label2.Text = Session["sessionHitCount"].ToString();
      //  Response.Write(Session.Timeout);  
    }
}
