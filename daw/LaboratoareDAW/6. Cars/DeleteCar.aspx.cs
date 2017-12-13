using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class DeleteCar : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Page.IsPostBack == false && Request.Params["id"] != null)
        {
            try
            {
                int ID = int.Parse(Request.Params["id"].ToString());

                string query = "SELECT BrandName, Model"
                    + " FROM Car INNER JOIN Brand ON Car.IdBrand = Brand.Id"
                    + " WHERE Car.Id = @id";

                SqlConnection con = new SqlConnection(@"Data Source=.\SQLEXPRESS;AttachDbFilename='C:\Facultate Materiale\Materii Predate\Dezvoltarea Aplicatiilor Web\Laboratoare\6-7. Cars\App_Data\Cars.mdf';Integrated Security=True;User Instance=True");

                con.Open();

                try
                {
                    SqlCommand com = new SqlCommand(query, con);
                    com.Parameters.AddWithValue("id", ID);

                    SqlDataReader reader = com.ExecuteReader();

                    while (reader.Read())
                    {  // textele din label-uri (adica numele brandului si modelul) vor primi din baza de date -> numele brandului si modelul
                        // pentru ca in frontend in label intrebam daca suntem siguri ca vrem sa stergem numele brandului si modelul
                        LBrand.Text = reader["BrandName"].ToString();
                        LModel.Text = reader["Model"].ToString();
                    }
                }
                catch (Exception ex)
                {
                    LAnswer.Text = "Database select error : " + ex.Message;
                }
                finally
                {
                    con.Close();
                }
            }
            catch (Exception se)
            {
                LAnswer.Text = "Database connexion error : " + se.Message;
            }
        }
    }

    protected void DeleteButton_Click(object sender, EventArgs e)
    {
        if (Page.IsValid && Request.Params["id"] != null)
        {
            try
            {   // daca apasam butonul ok se va sterge toata intrarea din baza de date
                int ID = int.Parse(Request.Params["id"].ToString());

                string query = "DELETE FROM Car WHERE Id = @id";

                SqlConnection con = new SqlConnection(@"Data Source=.\SQLEXPRESS;AttachDbFilename='C:\Facultate Materiale\Materii Predate\Dezvoltarea Aplicatiilor Web\Laboratoare\6-7. Cars\App_Data\Cars.mdf';Integrated Security=True;User Instance=True");

                con.Open();

                try
                {
                    SqlCommand com = new SqlCommand(query, con);
                    com.Parameters.AddWithValue("id", ID);

                    com.ExecuteNonQuery();

                    // Do this only if delete works: -> vrem sa dispara tot de pe pag si sa ramana doar textul de succes
                    PConfirm.Visible = false;
                    HLHomepage.Visible = true;
                    LAnswer.Text = "Car deleted successfully!";
                }
                catch (Exception ex)
                {
                    LAnswer.Text = "Database delete error : " + ex.Message;
                }
                finally
                {
                    con.Close();
                }
            }
            catch (SqlException se)
            {
                LAnswer.Text = "Database connexion error : " + se.Message;
            }
            catch (Exception ex)
            {
                LAnswer.Text = "Data conversion error : " + ex.Message;
            }
        }
    }

    protected void CancelButton_Click(object sender, EventArgs e)
    {
        // daca se apasa butonul nu, atunci se face redirect la pagina principala
        Response.Redirect("Index.aspx");
    }
}