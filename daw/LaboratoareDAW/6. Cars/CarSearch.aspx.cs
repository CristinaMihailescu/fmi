using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class CarSearch : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Page.IsPostBack && Request.Params["q"] != null)
        {
            string query = Server.UrlDecode(Request.Params["q"]);

            SDSSearch.SelectCommand = "SELECT Car.Id, Car.Model, Car.MaxSpeed, Car.Power, Car.Color, Car.FDate, Brand.BrandName FROM Brand INNER JOIN Car ON Brand.Id = Car.IdBrand"
                + " WHERE BrandName LIKE @q OR Model LIKE @q";

            SDSSearch.SelectParameters.Clear();
            SDSSearch.SelectParameters.Add("q","%" + query + "%");
            SDSSearch.DataBind();
        }
    }
}