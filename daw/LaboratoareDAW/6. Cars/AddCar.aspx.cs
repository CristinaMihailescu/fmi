using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class AddCar : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void AddButton_Click(object sender, EventArgs e)
    {
        if (Page.IsValid)
        {
            try
            {
                int IDBrand = int.Parse(DDLBrand.SelectedValue);
                string model = TBModel.Text;
                float maxSpeed = float.Parse(TBMaxSpeed.Text);
                float horsePower = float.Parse(TBPower.Text);
                string color = TBColor.Text;
                DateTime fabricationDate = DateTime.Parse(TBFDate.Text);

                string query = "INSERT INTO Car (IdBrand, Model, MaxSpeed, Power, Color, FDate)"
                    + " VALUES (@id_brand, @model, @max_speed, @power, @color, @f_date)";

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

                    com.ExecuteNonQuery();

                    // Do this only if insert works:
                    LAnswer.Text = "New car added successfully!";

                    DDLBrand.SelectedIndex = 0;
                    TBModel.Text = "";
                    TBMaxSpeed.Text = "";
                    TBPower.Text = "";
                    TBColor.Text = "";
                    TBFDate.Text = "";
                }
                catch (Exception ex)
                {
                    LAnswer.Text = "Database insert error : " + ex.Message;
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