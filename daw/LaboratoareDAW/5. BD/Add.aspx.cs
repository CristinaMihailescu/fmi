using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;

public partial class Add : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
    }

    protected void AdaugareIntrare_Click(object sender, EventArgs e)
    {
        if (Page.IsValid)
        {

            bool valid = true;

            string _Nume = Nume.Text;
            string _Prenume = Prenume.Text;
            string _Email = Email.Text;
            string _Telefon = Telefon.Text.ToString();

            // TODO: Verificarea tuturor stringurilor de mai sus sau adaugarea validarilor in frontend
            if (_Nume == "")
            {
                valid = false;
                Response.Write("Eroare: Numele nu poate fi gol");
            }

            if (valid)
            {
                string query = "INSERT INTO agenda(nume, prenume, email, telefon) OUTPUT INSERTED.ID "
                   + " VALUES (@nume, @prenume, @email, @telefon)";

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

                    int id = (int) com.ExecuteScalar();

                    // Update, delete si insert sunt NON QUERY -> nu returneaza un SqlReader
                    if (id > 0)
                    {
                        EroareBazaDate.Text = "Informatiile au fost adaugate";
                    }
                    else
                    {
                        EroareBazaDate.Text = "Informatiile nu au fost adaugate";
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