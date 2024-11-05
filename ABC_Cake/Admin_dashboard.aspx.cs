using System;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ABC_Cake
{
    public partial class Admin_dashboard : System.Web.UI.Page
    {
        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["AbcCakeConnection"].ConnectionString);

        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["UserRole"] == null)
            {
                Response.Redirect("Login.aspx");
                return;
            }
            if (!IsPostBack)
            {
                LoadDashboardData();
                LoadOrderList();
                LoadLowInventory();
            }

        }

        protected void LoadDashboardData()
        {
            con.Open();
            SqlCommand cmdUsers = new SqlCommand("SELECT COUNT(*) FROM Users", con);
            totalUsersLabel.InnerText = cmdUsers.ExecuteScalar().ToString();

            SqlCommand cmdSales = new SqlCommand("SELECT SUM(TotalPrice) FROM Orders", con);
            var totalSales = cmdSales.ExecuteScalar();
            totalSalesLabel.InnerText = "$" + (totalSales != DBNull.Value ? totalSales.ToString() : "0");

            SqlCommand cmdInventory = new SqlCommand("SELECT SUM(Quantity) FROM Inventory", con);
            var totalInventory = cmdInventory.ExecuteScalar();
            totalInventoryLabel.InnerText = totalInventory != DBNull.Value ? totalInventory.ToString() : "0";
            con.Close();
        }

        protected void LoadOrderList()
        {
            SqlDataAdapter da = new SqlDataAdapter(
    @"SELECT o.OrderID, o.UserId, o.TotalPrice, o.StatusID, 
             s.status_name AS Status, o.OrderDate, 
             o.DeliveryAddress, o.PhoneNumber , s.status_name
      FROM [Orders] o
      INNER JOIN Status s ON o.StatusID = s.statusID",
    con);
            DataTable dt = new DataTable();
            da.Fill(dt);
            OrderGrid.DataSource = dt;
            OrderGrid.DataBind();
        }

        protected void LoadLowInventory()
        {
            SqlDataAdapter da = new SqlDataAdapter(
    @"SELECT i.Ingredient_Name, inv.Quantity 
      FROM Ingredient i
      INNER JOIN Inventory inv ON i.Ingredient_ID = inv.IngredientID
      WHERE inv.Quantity < 10",
    con);
            DataTable dt = new DataTable();
            da.Fill(dt);
            LowInventoryGrid.DataSource = dt;
            LowInventoryGrid.DataBind();
        }

        protected void UpdateOrderStatus(object sender, EventArgs e)
        {
            DropDownList ddl = (DropDownList)sender;
            GridViewRow row = (GridViewRow)ddl.NamingContainer;

            int orderID = Convert.ToInt32(row.Cells[0].Text);

            int statusID = Convert.ToInt32(ddl.SelectedValue);

            SqlCommand cmd = new SqlCommand("UPDATE Orders SET StatusID = @StatusID WHERE OrderID = @OrderID", con);
            cmd.Parameters.AddWithValue("@StatusID", statusID);
            cmd.Parameters.AddWithValue("@OrderID", orderID);

            con.Open();
            cmd.ExecuteNonQuery();
            con.Close();

            LoadOrderList();
        }
    }
}
