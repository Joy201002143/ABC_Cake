using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Configuration;
namespace ABC_Cake
{
    public partial class Login : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        //protected void Button1_Click(object sender, EventArgs e)
        //    {
        //    SqlConnection con = new SqlConnection("Data Source=DESKTOP-JHB8AON; Integrated Security=True");
        //    con.Open();
        //    String loginQuery = "SELECT COUNT(*) FROM Users WHERE username=@username AND password=@password";
        //    SqlCommand cmd = new SqlCommand(loginQuery,con);
        //    cmd.Parameters.AddWithValue("@username", TextBox1.Text);
        //    cmd.Parameters.AddWithValue("@password", TextBox2.Text);
        //    int count=(int)cmd.ExecuteScalar();
        //    if (count > 0)
        //    {
        //        Response.Write("<script>alert('Login Success');</script>");
        //        Response.Redirect("Default.aspx");
        //    }
        //    else {
        //        Response.Write("<script>alert('Login Failed');</script>");

        //    }
        //    con.Close();
        //}
        protected void Button1_Click(object sender, EventArgs e)
        {
            using (SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["AbcCakeConnection"].ConnectionString))
            {
                con.Open();
                String loginQuery = "SELECT COUNT(*) FROM Users WHERE username = @username AND password = @password";
                SqlCommand cmd = new SqlCommand(loginQuery, con);
                cmd.Parameters.AddWithValue("@username", TextBox1.Text.Trim());  // Remove whitespace
                cmd.Parameters.AddWithValue("@password", TextBox2.Text.Trim());

                int count = (int)cmd.ExecuteScalar();
                if (count > 0)
                {
                    Response.Write("<script>alert('Login Success');</script>");
                    Response.Redirect("Default.aspx");
                }
                else
                {
                    Response.Write("<script>alert('Login Failed');</script>");
                }
            }  // Using statement will close the connection automatically
        }

        protected void Button2_Click(object sender, EventArgs e)
        {
           
        }

    }
}