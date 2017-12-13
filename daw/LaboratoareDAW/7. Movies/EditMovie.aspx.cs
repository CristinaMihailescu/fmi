using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Xml;

public partial class EditMovie : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Page.IsPostBack)
        {
            DDLYear.DataBind();

            string ID = Request.Params["id"];

            if (ID != null)
            {
                XmlDocument doc = new XmlDocument();

                try
                {
                    doc.Load(Server.MapPath("~") + "/Movies.xml");

                    XmlElement root = doc.DocumentElement;

                    XmlNode movie = root.SelectSingleNode("/moviestore/movie[@ID=" + ID + "]");
                    
                    DDLYear.SelectedValue = movie.Attributes["year"].Value;
                    TBGenre.Text = movie.Attributes["genre"].Value;
                    TBDuration.Text = movie.Attributes["duration"].Value;

                    XmlNode title = movie.SelectSingleNode("title");
                    TBTitle.Text = title.InnerText;

                    XmlNode director = movie.SelectSingleNode("director");
                    TBDirector.Text = director.InnerText;

                    XmlNodeList actors = movie.SelectNodes("actor");

                    if (actors.Count > 0)
                    {
                        TBActor1.Text = actors[0].InnerText;
                    }

                    if (actors.Count > 1)
                    {
                        TBActor2.Text = actors[1].InnerText;
                    }

                    if (actors.Count > 2)
                    {
                        TBActor3.Text = actors[2].InnerText;
                    }
                }
                catch (Exception ex)
                {
                }
            }
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

    protected void BEditMovie_Click(object sender, EventArgs e)
    {
        string ID = Request.Params["id"];

        if (ID != null)
        {
            XmlDocument doc = new XmlDocument();

            try
            {
                doc.Load(Server.MapPath("~") + "/Movies.xml");

                XmlElement root = doc.DocumentElement;

                XmlElement movie = root.SelectSingleNode("/moviestore/movie[@ID=" + ID + "]") as XmlElement;

                // Set Attributes
                movie.SetAttribute("genre", TBGenre.Text);
                movie.SetAttribute("year", DDLYear.SelectedValue);
                movie.SetAttribute("duration", TBDuration.Text);

                // Set child Nodes
                XmlNode title = movie.SelectSingleNode("title");
                title.InnerText = TBTitle.Text;

                XmlNode director = movie.SelectSingleNode("director");
                director.InnerText = TBDirector.Text;

                XmlNodeList actors = movie.SelectNodes("actor");
                
                foreach(XmlNode actor in actors)
                {
                    movie.RemoveChild(actor);
                }

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
                        File.Delete(Server.MapPath("~") + "/Images/" + ID + ".jpg");
                        FUImage.SaveAs(Server.MapPath("~") + "/Images/" + ID + ".jpg");                        
                    }
                }

                doc.Save(Server.MapPath("~") + "/Movies.xml");
                LAnswer.Text = "Movie saved successfully!";
            }
            catch (Exception ex)
            {
                LAnswer.Text = "Encoutnered error while saving movie: " + ex.Message;
            }
        }
    }
}