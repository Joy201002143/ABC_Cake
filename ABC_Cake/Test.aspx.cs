using System;
using System.Configuration;
using System.Data.SqlClient;

namespace ABC_Cake
{
    public partial class Test : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                LoadOrderIDs();
            }
        }

        private void LoadOrderIDs()
        {
            string connStr = ConfigurationManager.ConnectionStrings["AbcCakeConnection"].ConnectionString;
            using (SqlConnection conn = new SqlConnection(connStr))
            {
                string query = "SELECT DISTINCT OrderID FROM Orders";
                SqlCommand cmd = new SqlCommand(query, conn);
                conn.Open();
                SqlDataReader reader = cmd.ExecuteReader();
                ddlOrderIDs.DataSource = reader;
                ddlOrderIDs.DataTextField = "OrderID";
                ddlOrderIDs.DataValueField = "OrderID";
                ddlOrderIDs.DataBind();
                conn.Close();
            }
        }
    }
}
