using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ABC_Cake
{
    public partial class Inventory_Management : System.Web.UI.Page
    {
        private string connectionString = ConfigurationManager.ConnectionStrings["AbcCakeConnection"].ConnectionString;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["UserRole"] == null)
            {
                Response.Redirect("Login.aspx");
                return;
            }
            if (!IsPostBack)
            {
                LoadIngredients();
                LoadInventory();
            }
        }

        private void LoadIngredients()
        {
            using (SqlConnection conn = new SqlConnection(connectionString))
            {
                string query = "SELECT Ingredient_ID, Ingredient_Name FROM Ingredient";
                SqlDataAdapter da = new SqlDataAdapter(query, conn);
                DataTable dt = new DataTable();
                da.Fill(dt);

                ddlIngredients.DataSource = dt;
                ddlIngredients.DataTextField = "Ingredient_Name";
                ddlIngredients.DataValueField = "Ingredient_ID";
                ddlIngredients.DataBind();
            }
        }

        private void LoadInventory()
        {
            using (SqlConnection conn = new SqlConnection(connectionString))
            {
                string query = @"
                    SELECT i.InventoryID, ing.Ingredient_Name, i.Quantity
                    FROM Inventory i
                    INNER JOIN Ingredient ing ON i.IngredientID = ing.Ingredient_ID";
                SqlDataAdapter da = new SqlDataAdapter(query, conn);
                DataTable dt = new DataTable();
                da.Fill(dt);

                gvInventory.DataSource = dt;
                gvInventory.DataBind();
            }
        }

        protected void btnAddInventory_Click(object sender, EventArgs e)
        {
            int ingredientId = Convert.ToInt32(ddlIngredients.SelectedValue);
            decimal quantity = Convert.ToDecimal(txtQuantity.Text);

            using (SqlConnection conn = new SqlConnection(connectionString))
            {
                conn.Open();
                SqlCommand cmd = new SqlCommand("UPDATE Inventory SET Quantity = Quantity + @Quantity WHERE IngredientID = @IngredientID", conn);
                cmd.Parameters.AddWithValue("@IngredientID", ingredientId);
                cmd.Parameters.AddWithValue("@Quantity", quantity);
                cmd.ExecuteNonQuery();
            }

            LoadInventory(); 
        }


        protected void btnReduceInventory_Click(object sender, EventArgs e)
        {
            int ingredientId = Convert.ToInt32(ddlIngredients.SelectedValue);
            decimal quantity = Convert.ToDecimal(txtQuantity.Text);

            using (SqlConnection conn = new SqlConnection(connectionString))
            {
                conn.Open();
                SqlCommand cmd = new SqlCommand("UPDATE Inventory SET Quantity = Quantity - @Quantity WHERE IngredientID = @IngredientID AND Quantity >= @Quantity", conn);
                cmd.Parameters.AddWithValue("@IngredientID", ingredientId);
                cmd.Parameters.AddWithValue("@Quantity", quantity);
                cmd.ExecuteNonQuery();
            }

            LoadInventory(); 
        }
    }
}