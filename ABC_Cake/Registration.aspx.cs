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

        }

        protected void ButtonRegister_Click(object sender, EventArgs e)
        {
            // Retrieve user inputs
            string username = TextBox2.Text.Trim();
            string password = TextBox5.Text.Trim();
            string contact = TextBox7.Text.Trim();
            string sex = DropDownList1.SelectedValue;
            DateTime dateOfBirth;

            // Ensure the date is valid
            if (!DateTime.TryParse(TextBox6.Text.Trim(), out dateOfBirth))
            {
                // Handle invalid date format
                Response.Write("<script>alert('Please enter a valid date.');</script>");
                return;
            }

            // Get the connection string from web.config
            string connectionString = ConfigurationManager.ConnectionStrings["AbcCakeConnection"].ConnectionString;

            using (SqlConnection con = new SqlConnection(connectionString))
            {
                try
                {
                    con.Open();
                    string insertQuery = "INSERT INTO Users (username, password, contact, sex, date) VALUES (@username, @password, @contact, @sex, @dateOfBirth)";

                    using (SqlCommand cmd = new SqlCommand(insertQuery, con))
                    {
                        // Add parameters
                        cmd.Parameters.AddWithValue("@username", username);
                        cmd.Parameters.AddWithValue("@password", password); // Consider hashing the password before storing
                        cmd.Parameters.AddWithValue("@contact", contact);
                        cmd.Parameters.AddWithValue("@sex", sex);
                        cmd.Parameters.AddWithValue("@dateOfBirth", dateOfBirth);

                        // Execute the command
                        int rowsAffected = cmd.ExecuteNonQuery();

                        if (rowsAffected > 0)
                        {
                            // Registration successful
                            Response.Write("<script>alert('Registration successful! Please login.');</script>");
                            Response.Redirect("Login.aspx"); // Redirect to the login page
                        }
                        else
                        {
                            // Registration failed
                            Response.Write("<script>alert('Registration failed. Please try again.');</script>");
                        }
                    }
                }
                catch (Exception ex)
                {
                    // Log the exception (optional)
                    Response.Write("<script>alert('An error occurred: " + ex.Message + "');</script>");
                }
            }
        }
    }
}