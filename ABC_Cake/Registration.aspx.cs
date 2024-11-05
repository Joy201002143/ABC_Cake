using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ABC_Cake
{
    public partial class Registration : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["UserId"] != null)
            {
                Response.Redirect("Login.aspx");
                return;
            }
            if (Session["UserRole"] != null)
            {
                Response.Redirect(" .aspx");
                return;
            }

        }

        protected void ButtonRegister_Click(object sender, EventArgs e)
        {
            
            string username = TextBox2.Text.Trim();
            string password = TextBox5.Text.Trim();
            string contact = TextBox7.Text.Trim();
            string sex = DropDownList1.SelectedValue;
            String Roles = "User";
            DateTime dateOfBirth;

            
            if (!DateTime.TryParse(TextBox6.Text.Trim(), out dateOfBirth))
            {
                
                Response.Write("<script>alert('Please enter a valid date.');</script>");
                return;
            }

            
            string connectionString = ConfigurationManager.ConnectionStrings["AbcCakeConnection"].ConnectionString;

            using (SqlConnection con = new SqlConnection(connectionString))
            {
                try
                {
                    con.Open();
                    string insertQuery = "INSERT INTO Users (username, password, contact, sex, date, Roles) VALUES (@username, @password, @contact, @sex, @dateOfBirth, @Roles)";

                    using (SqlCommand cmd = new SqlCommand(insertQuery, con))
                    {
                        
                        cmd.Parameters.AddWithValue("@username", username);
                        cmd.Parameters.AddWithValue("@password", password); 
                        cmd.Parameters.AddWithValue("@contact", contact);
                        cmd.Parameters.AddWithValue("@sex", sex);
                        cmd.Parameters.AddWithValue("@dateOfBirth", dateOfBirth);
                        cmd.Parameters.AddWithValue("@Roles", Roles);

                        
                        int rowsAffected = cmd.ExecuteNonQuery();

                        if (rowsAffected > 0)
                        {
                            
                            Response.Write("<script>alert('Registration successful! Please login.');</script>");
                            Response.Redirect("Login.aspx"); // Redirect to the login page
                        }
                        else
                        {
                            
                            Response.Write("<script>alert('Registration failed. Please try again.');</script>");
                        }
                    }
                }
                catch (Exception ex)
                {
                    
                    Response.Write("<script>alert('An error occurred: " + ex.Message + "');</script>");
                }
            }
        }
    }
}