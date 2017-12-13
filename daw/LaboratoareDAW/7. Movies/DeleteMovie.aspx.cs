using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Xml;

public partial class DeleteMovie : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Page.IsPostBack)
        {
            string ID = Request.Params["id"];

            if (ID != null)
            {
                XmlDocument doc = new XmlDocument();

                try
                {
                    doc.Load(Server.MapPath("~") + "/Movies.xml");

                    XmlElement root = doc.DocumentElement;

                    XmlNode movie = root.SelectSingleNode("/moviestore/movie[@ID=" + ID + "]");

                    XmlNode title = movie.SelectSingleNode("title");
                    LTitle.Text = title.InnerText;
                    LYear.Text = movie.Attributes["year"].Value;
                }
                catch (Exception ex)
                {
                }
            }
        }
    }

    protected void BCancel_Click(object sender, EventArgs e)
    {
        Response.Redirect("Index.aspx");
    }

    protected void BDelete_Click(object sender, EventArgs e)
    {
        string ID = Request.Params["id"];

        if (ID != null)
        {
            XmlDocument doc = new XmlDocument();

            try
            {
                doc.Load(Server.MapPath("~") + "/Movies.xml");

                XmlElement root = doc.DocumentElement;

                XmlNode movie = root.SelectSingleNode("/moviestore/movie[@ID=" + ID + "]");

                root.RemoveChild(movie);
                doc.Save(Server.MapPath("~") + "/Movies.xml");
                File.Delete(Server.MapPath("~") + "/Images/" + ID + ".jpg");

                LAnswer.Text = "Movie deleted succesfully!";
            }
            catch (Exception ex)
            {
                LAnswer.Text = "Encoutnered error while deleting movie: " + ex.Message;
            }
            finally
            {
                LAnswer.Visible = true;
                ConfirmPanel.Visible = false;
            }
        }
    }
}