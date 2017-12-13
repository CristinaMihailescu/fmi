using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;

public partial class Delete : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        // Afisarea de formular
        if (Request.Params["id"] != null)
        {
            // Luam ID
            int ID = int.Parse(Request.Params["id"].ToString());
            // Salvam cererea SQL intr-un string
            string query = "DELETE"
                    + " FROM agenda"
                    + " WHERE id = @id";

            // Deschidem conexiunea la baza de date
            SqlConnection con = new SqlConnection(@"Data Source=(LocalDB)\v11.0;AttachDbFilename='C:\Facultate Materiale\Materii Predate\Dezvoltarea Aplicatiilor Web\Laboratoare\5. BD\App_Data\Agenda.mdf';Integrated Security=True");
            
            // Incercam sa executam comanda
            try
            {
                con.Open();
                // Se construieste comanda SQL (select-ul nostru)
                SqlCommand com = new SqlCommand(query, con);
                com.Parameters.AddWithValue("id", ID);

                int deleted = com.ExecuteNonQuery();

                if (deleted > 0)
                {
                    Response.Write("Intrarea a fost stearsa din baza de date");
                }
                else
                {
                    Response.Write("Intrarea nu a fost stearsa. Va rugam incercati din nou");
                }
                
            }
            catch (Exception ex)
            {
                Response.Write("Eroare din baza de date: " + ex.Message);
            }
            finally
            {
                con.Close();
            }
        }
    }
}