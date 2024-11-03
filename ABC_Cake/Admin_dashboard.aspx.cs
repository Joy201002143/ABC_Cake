using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Configuration;

namespace ABC_Cake
{
    public partial class Admin_dashboard : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["UserRole"] == null)
            {
                Response.Redirect("Login.aspx");
                return;
            }
            if (!IsPostBack)
            {
                LoadPanels();
                LoadOrderGrid("All");
            }
        }

        private void LoadPanels()
        {
            totalUsersLabel.InnerText = GetTotalUsers().ToString();
            totalSalesLabel.InnerText = GetTotalSales().ToString("C");
            totalInventoryLabel.InnerText = GetTotalInventory().ToString();
            LoadLowInventory();
        }

        private int GetTotalUsers()
        {
            using (SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["AbcCakeConnection"].ConnectionString))
            {
                con.Open();
                SqlCommand cmd = new SqlCommand("SELECT COUNT(*) FROM Users", con);
                return (int)cmd.ExecuteScalar();
            }
        }

        private decimal GetTotalSales()
        {
            using (SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["AbcCakeConnection"].ConnectionString))
            {
                con.Open();
                SqlCommand cmd = new SqlCommand("SELECT SUM(TotalPrice) FROM Orders", con);
                return (decimal)cmd.ExecuteScalar();
            }
        }

        private int GetTotalInventory()
        {
            using (SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["AbcCakeConnection"].ConnectionString))
            {
                con.Open();
                SqlCommand cmd = new SqlCommand("SELECT SUM(Quantity) FROM Inventory", con);
                object result = cmd.ExecuteScalar();
                return (int)(result != DBNull.Value ? Convert.ToDecimal(result) : 0m);
            }
        }

        private void LoadLowInventory()
        {
            using (SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["AbcCakeConnection"].ConnectionString))
            {
                con.Open();
                SqlCommand cmd = new SqlCommand(@"
            SELECT i.Ingredient_Name, inv.Quantity 
            FROM Inventory inv 
            JOIN Ingredient i ON inv.IngredientID = i.Ingredient_ID 
            WHERE inv.Quantity < 10", con);
                SqlDataAdapter da = new SqlDataAdapter(cmd);
                DataTable dt = new DataTable();
                da.Fill(dt);
                LowInventoryGrid.DataSource = dt;
                LowInventoryGrid.DataBind();
            }
        }

        protected void LoadOrderGrid(string status)
        {
            using (SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["AbcCakeConnection"].ConnectionString))
            {
                con.Open();
                string query = "SELECT o.OrderID, o.UserId, o.TotalPrice, o.StatusID, o.OrderDate, o.DeliveryAddress, o.PhoneNumber " +
                               "FROM Orders o";

                if (status != "All")
                {
                    query += " WHERE o.StatusID = @statusName";
                }

                SqlCommand cmd = new SqlCommand(query, con);
                if (status != "All")
                {
                    cmd.Parameters.AddWithValue("@statusName", status);
                }

                SqlDataAdapter da = new SqlDataAdapter(cmd);
                DataTable dt = new DataTable();
                da.Fill(dt);
                OrderGrid.DataSource = dt;
                OrderGrid.DataBind();
            }
        }

        protected void FilterOrdersByStatus(object sender, EventArgs e)
        {
            LoadOrderGrid(ddlStatusFilter.SelectedValue);
        }

        protected void UpdateOrderStatus(object sender, EventArgs e)
        {
            DropDownList ddlStatus = (DropDownList)sender;
            GridViewRow row = (GridViewRow)ddlStatus.NamingContainer;

            int orderId = Convert.ToInt32(OrderGrid.DataKeys[row.RowIndex].Value);
            int newStatusId = Convert.ToInt32(ddlStatus.SelectedValue);

            using (SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["AbcCakeConnection"].ConnectionString))
            {
                con.Open();
                SqlCommand cmd = new SqlCommand("UPDATE Orders SET StatusID = @StatusID WHERE OrderID = @OrderID", con);
                cmd.Parameters.AddWithValue("@StatusID", newStatusId);
                cmd.Parameters.AddWithValue("@OrderID", orderId);
                cmd.ExecuteNonQuery();
            }

            LoadOrderGrid(ddlStatusFilter.SelectedValue);
        }

    }
    
}