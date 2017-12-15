using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;

public partial class Search : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Page.IsPostBack)
        {
            string query = "SELECT *"
                    + " FROM agenda";

            // Deschidem conexiunea la baza de date
            SqlConnection con = new SqlConnection(@"Data Source=(LocalDB)\v11.0;AttachDbFilename='C:\Users\mihai\Desktop\Git\fmi\daw\LaboratoareDAW\5. BD\App_Data\Agenda.mdf';Integrated Security=True");
            con.Open();
            // Incercam sa executam comanda
            try
            {
                con.Open();
                // Se construieste comanda SQL (select-ul nostru)
                SqlCommand com = new SqlCommand(query, con);

                // Se executa comanda si se returneaza valorile intr-un reader
                SqlDataReader reader = com.ExecuteReader();
                GridView1.DataSource = reader; // Alocam readerul pentru citirea datelor
                GridView1.DataBind(); // Incarca datele din reader

            }
            catch (Exception ex)
            {
                MessagePlaceholder.Text = "Eroare din baza de date: " + ex.Message;
            }
            finally
            {
                con.Close();
            }
        }
    }

    protected void PerformSearch_Click(object sender, EventArgs e)
    {
        string search = "%" + SearchParam.Text.ToString() + "%";

        string query = "SELECT * FROM agenda WHERE nume LIKE @search OR prenume LIKE @search OR email LIKE @search OR telefon LIKE @search";

        // Deschidem conexiunea la baza de date
        SqlConnection con = new SqlConnection(@"Data Source=(LocalDB)\v11.0;AttachDbFilename='C:\Users\mihai\Desktop\Git\fmi\daw\LaboratoareDAW\5. BD\App_Data\Agenda.mdf';Integrated Security=True");
        con.Open();
        // Incercam sa executam comanda
        try
        {
            // Se construieste comanda SQL (select-ul nostru)
            SqlCommand com = new SqlCommand(query, con);
            com.Parameters.AddWithValue("search", search);



            // Se executa comanda si se returneaza valorile intr-un reader
            SqlDataReader reader = com.ExecuteReader();
            GridView1.DataSource = reader; // Alocam readerul pentru citirea datelor
            GridView1.DataBind(); // Incarca datele din reader

        }
        catch (Exception ex)
        {
            MessagePlaceholder.Text = "Eroare din baza de date: " + ex.Message;
        }
        finally
        {
            con.Close();
        }

    }
}