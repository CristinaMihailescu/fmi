    using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Xml;

public partial class AddMovie : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Page.IsPostBack)
        {
            DDLYear.DataBind();
        }
    }

    public string[] Last100Years
    {
        get
        {
            DateTime now = DateTime.Now;
            string[] years = new string[100];

            for (int i = 0; i < years.Length; i++)
            {
                years[i] = (now.Year - i).ToString();
            }
            return years;
        }
    }

    protected void BAddMovie_Click(object sender, EventArgs e)
    {
        XmlDocument doc = new XmlDocument();

        try
        {
            doc.Load(Server.MapPath("~") + "/Movies.xml");

            XmlElement movie = doc.CreateElement("movie");

            // Set Attributes
            movie.SetAttribute("genre", TBGenre.Text);
            movie.SetAttribute("year", DDLYear.SelectedValue);
            movie.SetAttribute("duration", TBDuration.Text);

            XmlElement root = doc.DocumentElement;

            string ID = "1";
            XmlNode lastMovie = root.LastChild;
            if (lastMovie != null)
            {
                int maxID = int.Parse(lastMovie.Attributes["ID"].Value);
                ID = (maxID + 1).ToString();
            }
            movie.SetAttribute("ID", ID);

            // Add child Nodes
            XmlElement title = doc.CreateElement("title");
            title.InnerText = TBTitle.Text;
            movie.AppendChild(title);

            XmlElement director = doc.CreateElement("director");
            director.InnerText = TBDirector.Text;
            movie.AppendChild(director);

            if (!TBActor1.Text.Trim().Equals(""))
            {
                XmlElement actor1 = doc.CreateElement("actor");
                actor1.InnerText = TBActor1.Text;
                movie.AppendChild(actor1);
            }

            if (!TBActor2.Text.Trim().Equals(""))
            {
                XmlElement actor2 = doc.CreateElement("actor");
                actor2.InnerText = TBActor2.Text;
                movie.AppendChild(actor2);
            }

            if (!TBActor3.Text.Trim().Equals(""))
            {
                XmlElement actor3 = doc.CreateElement("actor");
                actor3.InnerText = TBActor3.Text;
                movie.AppendChild(actor3);
            }

            if (FUImage.HasFile)
            {
                if (FUImage.PostedFile.ContentType.ToLower().EndsWith("jpeg"))
                {
                    FUImage.SaveAs(Server.MapPath("~") + "/Images/" + ID + ".jpg");
                    root.AppendChild(movie);
                    doc.Save(Server.MapPath("~") + "/Movies.xml");

                    TBTitle.Text = "";
                    TBDuration.Text = "";
                    TBGenre.Text = "";
                    TBDirector.Text = "";
                    TBActor1.Text = "";
                    TBActor2.Text = "";
                    TBActor3.Text = "";
                    LAnswer.Text = "Movie added successfully!";
                }
                else
                {
                    LAnswer.Text = "Image file is not in JPEG format! Format is: " + FUImage.PostedFile.ContentType.ToUpper();
                }
            }
            else
            {
                LAnswer.Text = "No image file uploaded!";
            }
        }
        catch (Exception ex)
        {
            LAnswer.Text = "Encoutnered error while adding movie: " + ex.Message;
        }
    }
}