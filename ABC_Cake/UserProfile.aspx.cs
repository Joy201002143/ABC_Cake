using System;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Web.UI;

namespace ABC_Cake
{
    public partial class UserProfile : Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["UserId"] == null)
            {
                Response.Redirect("Login.aspx");
                return;
            }
            if (!IsPostBack)
            {
                LoadUserInfo();
                txtContact.ReadOnly = true;
               
                txtDateOfBirth.Enabled = false;
                btnSave.Visible = false;
                btnEdit.Visible = true;
                LoadOrderHistory();
            }
        }

        private void LoadUserInfo()
        {
            // Assuming you store UserId in Session
            if (Session["UserId"] != null)
            {
                int userId = (int)Session["UserId"];

                using (SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["AbcCakeConnection"].ConnectionString))
                {
                    con.Open();
                    SqlCommand cmd = new SqlCommand("SELECT Username, Contact, date FROM Users WHERE UserId = @UserId", con);
                    cmd.Parameters.AddWithValue("@UserId", userId);

                    SqlDataReader reader = cmd.ExecuteReader();
                    if (reader.Read())
                    {
                        txtUsername.Text = reader["Username"].ToString();
                        txtContact.Text = reader["Contact"].ToString();
                        txtDateOfBirth.Text = Convert.ToDateTime(reader["date"]).ToString("yyyy-MM-dd");
                    }
                }
            }
        }

        private void LoadOrderHistory()
        {
            if (Session["UserId"] != null)
            {
                int userId = (int)Session["UserId"];

                using (SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["AbcCakeConnection"].ConnectionString))
                {
                    con.Open();
                    SqlCommand cmd = new SqlCommand(@"
                        SELECT o.OrderID, o.OrderDate, o.TotalPrice, s.status_name AS StatusName 
                        FROM Orders o 
                        INNER JOIN status s ON o.statusID = s.statusID 
                        WHERE o.UserId = @UserId", con);
                    cmd.Parameters.AddWithValue("@UserId", userId);

                    SqlDataAdapter adapter = new SqlDataAdapter(cmd);
                    DataTable dt = new DataTable();
                    adapter.Fill(dt);
                    GridViewOrders.DataSource = dt;
                    GridViewOrders.DataBind();
                }
            }
        }
        protected void txtUsername_TextChanged(object sender, EventArgs e)
        {

              
        }

        protected void btnEdit_Click(object sender, EventArgs e)
        {
            txtContact.ReadOnly = false;
            txtDateOfBirth.Enabled = true; // Make the Date of Birth field editable
            btnSave.Visible = true; // Show the Save button
            btnEdit.Visible = false; // Hide the Edit button
        }

        protected void btnSave_Click(object sender, EventArgs e)
        {
            if (Session["UserId"] != null)
            {
                int userId = (int)Session["UserId"];

                using (SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["AbcCakeConnection"].ConnectionString))
                {
                    con.Open();
                    SqlCommand cmd = new SqlCommand("UPDATE Users SET Contact = @Contact, date = @date WHERE UserId = @UserId", con);
                    cmd.Parameters.AddWithValue("@Contact", txtContact.Text);
                    cmd.Parameters.AddWithValue("@date", DateTime.Parse(txtDateOfBirth.Text));
                    cmd.Parameters.AddWithValue("@UserId", userId);
                    cmd.ExecuteNonQuery();
                }

                
                LoadUserInfo();
                txtContact.ReadOnly = true;
                txtDateOfBirth.ReadOnly = true;
                txtDateOfBirth.Enabled = false; 
                btnSave.Visible = false; 
                btnEdit.Visible = true; 
            }
        }

        protected void btnHistory_Click(object sender, EventArgs e)
        {
            GridViewOrders.Visible = !GridViewOrders.Visible;
            btnEdit0.Text = GridViewOrders.Visible ? "Hide History" : "Show History";

        }
    }
}
