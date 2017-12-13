using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class UpdateCar : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Page.IsPostBack == false && Request.Params["id"] != null)
        {
            try
            {
                int ID = int.Parse(Request.Params["id"].ToString());

                string query = "SELECT IdBrand, Model, MaxSpeed, Power, Color, FDate" 
                    + " FROM Car"
                    + " WHERE Id = @id";

                SqlConnection con = new SqlConnection(@"Data Source=.\SQLEXPRESS;AttachDbFilename='C:\Facultate Materiale\Materii Predate\Dezvoltarea Aplicatiilor Web\Laboratoare\6-7. Cars\App_Data\Cars.mdf';Integrated Security=True;User Instance=True");

                con.Open();

                try
                {
                    SqlCommand com = new SqlCommand(query, con);
                    com.Parameters.AddWithValue("id", ID);

                    SqlDataReader reader = com.ExecuteReader();

                    while (reader.Read())
                    {
                        DDLBrand.SelectedValue = reader["IdBrand"].ToString();
                        TBModel.Text = reader["Model"].ToString();
                        TBMaxSpeed.Text = reader["MaxSpeed"].ToString();
                        TBPower.Text = reader["Power"].ToString();
                        TBColor.Text = reader["Color"].ToString();
                        TBFDate.Text = DateTime.Parse(reader["FDate"].ToString()).ToShortDateString();
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

    protected void SaveButton_Click(object sender, EventArgs e)
    {
        if (Page.IsValid && Request.Params["id"] != null)
        {
            try
            {
                int ID = int.Parse(Request.Params["id"].ToString());

                int IDBrand = int.Parse(DDLBrand.SelectedValue);
                string model = TBModel.Text;
                float maxSpeed = float.Parse(TBMaxSpeed.Text);
                float horsePower = float.Parse(TBPower.Text);
                string color = TBColor.Text;
                DateTime fabricationDate = DateTime.Parse(TBFDate.Text);

                string query = "UPDATE Car SET IdBrand = @id_brand, Model = @model, MaxSpeed = @max_speed, Power = @power, Color = @color, FDate = @f_date"
                    + " WHERE Id = @id";

                SqlConnection con = new SqlConnection(@"Data Source=.\SQLEXPRESS;AttachDbFilename='C:\Facultate Materiale\Materii Predate\Dezvoltarea Aplicatiilor Web\Laboratoare\6-7. Cars\App_Data\Cars.mdf';Integrated Security=True;User Instance=True");

                con.Open();

                try
                {
                    SqlCommand com = new SqlCommand(query, con);
                    com.Parameters.AddWithValue("id_brand", IDBrand);
                    com.Parameters.AddWithValue("model", model);
                    com.Parameters.AddWithValue("max_speed", maxSpeed);
                    com.Parameters.AddWithValue("power", horsePower);
                    com.Parameters.AddWithValue("color", color);
                    com.Parameters.AddWithValue("f_date", fabricationDate);
                    com.Parameters.AddWithValue("id", ID);

                    com.ExecuteNonQuery();

                    // Do this only if update works:
                    LAnswer.Text = "Car saved successfully!";
                }
                catch (Exception ex)
                {
                    LAnswer.Text = "Database update error : " + ex.Message;
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
}