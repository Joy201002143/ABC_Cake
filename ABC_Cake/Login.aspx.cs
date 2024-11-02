using System;
using System.Configuration;
using System.Data.SqlClient;
using System.Web;
using System.Web.UI;

namespace ABC_Cake
{
    public partial class Login : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (IsPostBack)
            {
                
                if (Session["UserId"] != null)
                {
                    Response.Redirect("UserProfile.aspx"); // Redirect to the main page if already logged in
                }
            }
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            string username = TextBox1.Text.Trim();  // Trim whitespace from input
            string password = TextBox2.Text.Trim();

            using (SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["AbcCakeConnection"].ConnectionString))
            {
                con.Open();

                // Query to get the UserId if the username and password match
                string loginQuery = "SELECT UserId FROM Users WHERE username = @username AND password = @password";
                SqlCommand cmd = new SqlCommand(loginQuery, con);
                cmd.Parameters.AddWithValue("@username", username);
                cmd.Parameters.AddWithValue("@password", password);

                object userId = cmd.ExecuteScalar(); // Retrieve UserId if credentials match

                if (userId != null)
                {
                    // Login successful, store UserId in session
                    Session["UserId"] = userId;
                    Response.Write("<script>alert('Login Success');</script>");
                    Response.Redirect("UserProfile.aspx");
                }
                else
                {
                    // Login failed
                    Response.Write("<script>alert('Login Failed');</script>");
                }
            }
        }

        protected void Button2_Click(object sender, EventArgs e)
        {
            // Logic for another button (if needed, e.g., registration button)
        }
    }
}
