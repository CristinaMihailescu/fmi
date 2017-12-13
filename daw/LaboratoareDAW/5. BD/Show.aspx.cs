using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;

public partial class Show : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        // Afisarea de formular
        if (!Page.IsPostBack && Request.Params["id"] != null)
        {
            // Luam ID
            int ID = int.Parse(Request.Params["id"].ToString());
            // Salvam cererea SQL intr-un string
            string query = "SELECT *"
                    + " FROM agenda"
                    + " WHERE id = @id";

            // Deschidem conexiunea la baza de date
            SqlConnection con = new SqlConnection(@"Data Source=(LocalDB)\v11.0;AttachDbFilename='C:\Facultate Materiale\Materii Predate\Dezvoltarea Aplicatiilor Web\Laboratoare\5. BD\App_Data\Agenda.mdf';Integrated Security=True");
            con.Open();
            // Incercam sa executam comanda
            try
            {
                // Se construieste comanda SQL (select-ul nostru)
                SqlCommand com = new SqlCommand(query, con);
                com.Parameters.AddWithValue("id", ID);

                // Se executa comanda si se returneaza valorile intr-un reader
                SqlDataReader reader = com.ExecuteReader();

                // Citim rand cu rand din baza de date
                while (reader.Read())
                {
                    Nume.Text = reader["nume"].ToString();
                    Prenume.Text = reader["prenume"].ToString();
                    Email.Text = reader["email"].ToString();
                    Telefon.Text = reader["telefon"].ToString();
                }
            }
            catch (Exception ex)
            {
                EroareBazaDate.Text = "Eroare din baza de date: " + ex.Message;
            }
            finally
            {
                con.Close();
            }
        }
    }
}