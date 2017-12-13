using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;

public partial class Edit : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        // Afisarea de formular de editare
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

    protected void EditareIntrare_Click(object sender, EventArgs e)
    {
        if (Page.IsValid && Request.Params["id"] != null)
        {
            int ID = int.Parse(Request.Params["id"].ToString());

            bool valid = true;

            string _Nume = Nume.Text;
            string _Prenume = Prenume.Text;
            string _Email = Email.Text;
            string _Telefon = Telefon.Text;

            // TODO: Verificarea tuturor stringurilor de mai sus sau adaugarea validarilor in frontend
            if (_Nume == "")
            {
                valid = false;
                Response.Write("Eroare: Numele nu poate fi gol");
            }

            if (valid)
            {
                string query = "UPDATE agenda "
                   + "SET nume = @nume, prenume = @prenume, email = @email, telefon = @telefon"
                   + " WHERE Id = @id";

                SqlConnection con = new SqlConnection(@"Data Source=(LocalDB)\v11.0;AttachDbFilename='C:\Facultate Materiale\Materii Predate\Dezvoltarea Aplicatiilor Web\Laboratoare\5. BD\App_Data\Agenda.mdf';Integrated Security=True");
                con.Open();

                try
                {
                    // Introducem parametrii in cererea SQL
                    SqlCommand com = new SqlCommand(query, con);
                    // primul parametru, nume, este din query reprezentat de @nume iar _Nume este valoarea variabilei din formular
                    com.Parameters.AddWithValue("nume", _Nume);
                    com.Parameters.AddWithValue("prenume", _Prenume);
                    com.Parameters.AddWithValue("email", _Email);
                    com.Parameters.AddWithValue("telefon", _Telefon);
                    com.Parameters.AddWithValue("id", ID);

                    // Update, delete si insert sunt NON QUERY -> nu returneaza un SqlReader
                    int afectate = com.ExecuteNonQuery(); // Returneaza INT reprezentand numarul de campuri afectate in bd
                    if (afectate > 0)
                    {
                        EroareBazaDate.Text = "Informatiile au fost modificate";
                    }
                    else
                    {
                        EroareBazaDate.Text = "Informatiile nu au fost modificate";
                    }

                }
                catch (Exception ex)
                {
                    EroareBazaDate.Text = "Eroare din baza de date: " + ex.Message;
                }
                finally
                {
                    // Nu o lasam deschisa.
                    con.Close();
                }
            }

            
        }
    }
}