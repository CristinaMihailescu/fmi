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
        if (Page.IsPostBack) PageLiteral.Text = "Page is postback!";
        else PageLiteral.Text = "Page is not postback!";
    }

    protected void SayHelloButtonClick(object sender, EventArgs e)
    {
        HelloText.Text = "Hello, " + NameTextBox.Text + "!";
        HelloText.Visible = true;
    }

    protected void HtmlButtonClick(object sender, EventArgs e)
    {
        //HtmlHelloText.InnerHtml = "<span  style='background:#ffcccc'> Hello, " + HtmlTextBox.Value + "!</span>";
        HtmlHelloText.InnerText = "Hello " + HtmlTextBox.Value + "!";
        HtmlHelloText.Visible = true;
    }   
}
