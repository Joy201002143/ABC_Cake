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
                    Response.Redirect("UserProfile.aspx"); 
                }
            }
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            string username = TextBox1.Text.Trim(); 
            string password = TextBox2.Text.Trim();

            using (SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["AbcCakeConnection"].ConnectionString))
            {
                con.Open();

                string loginQuery = "SELECT UserId, Roles FROM Users WHERE username COLLATE SQL_Latin1_General_CP1_CS_AS = @username  AND password COLLATE SQL_Latin1_General_CP1_CS_AS = @password;";
                SqlCommand cmd = new SqlCommand(loginQuery, con);
                cmd.Parameters.AddWithValue("@username", username);
                cmd.Parameters.AddWithValue("@password", password);

                using (SqlDataReader reader = cmd.ExecuteReader())
                {
                    if (reader.Read())
                    {
                        int userId = reader.GetInt32(0); 
                        string role = reader.GetString(1); 

                        Session["UserId"] = userId;
                        Session["UserRole"] = role; 

                        Response.Write("<script>alert('Login Success');</script>");

                        if (role == "Admin")
                        {
                            Response.Redirect("Admin_dashboard.aspx");
                        }
                        else
                        {
                            Response.Redirect("UserProfile.aspx");
                        }
                    }
                    else
                    {
                        
                        Response.Write("<script>alert('Login Failed');</script>");
                    }
                }
            }
        }
        protected void Button2_Click(object sender, EventArgs e)
        {
        }
    }
}
