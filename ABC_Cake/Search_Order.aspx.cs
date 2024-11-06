using System;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;
using System.Web.UI.WebControls;

namespace ABC_Cake
{
    public partial class Search_Order : System.Web.UI.Page
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
                LoadOrderIds();
                LoadIngredients();
                LoadOrderDates();
            }
        }

        private void LoadOrderIds()
        {
            SqlCommand cmd = new SqlCommand("SELECT DISTINCT OrderID FROM Orders", con);
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            DataTable dt = new DataTable();
            da.Fill(dt);

            ddlOrderId.DataSource = dt;
            ddlOrderId.DataTextField = "OrderID";
            ddlOrderId.DataValueField = "OrderID";
            ddlOrderId.DataBind();

            ddlOrderId.Items.Insert(0, new ListItem("-- None --", ""));
        }

        private void LoadIngredients()
        {
            SqlCommand cmd = new SqlCommand("SELECT DISTINCT i.Ingredient_Name, i.Ingredient_ID FROM Ingredient i INNER JOIN OrderIngredients oi ON i.Ingredient_ID = oi.IngredientID", con);
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            DataTable dt = new DataTable();
            da.Fill(dt);

            ddlIngredient.DataSource = dt;
            ddlIngredient.DataTextField = "Ingredient_Name";
            ddlIngredient.DataValueField = "Ingredient_ID";
            ddlIngredient.DataBind();

            ddlIngredient.Items.Insert(0, new ListItem("-- None --", ""));
        }

        private void LoadOrderDates()
        {
            SqlCommand cmd = new SqlCommand("SELECT DISTINCT CONVERT(VARCHAR, OrderDate, 101) AS OrderDate FROM Orders", con);
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            DataTable dt = new DataTable();
            da.Fill(dt);

            ddlOrderDate.DataSource = dt;
            ddlOrderDate.DataTextField = "OrderDate";
            ddlOrderDate.DataValueField = "OrderDate";
            ddlOrderDate.DataBind();

            ddlOrderDate.Items.Insert(0, new ListItem("-- None --", ""));
        }

        protected void btnSearch_Click(object sender, EventArgs e)
        {
            string orderId = ddlOrderId.SelectedValue;
            string ingredientId = ddlIngredient.SelectedValue;
            string orderDate = ddlOrderDate.SelectedValue;

            string query = @"
                SELECT u.UserName, o.TotalPrice, o.OrderDate, i.Ingredient_Name AS IngredientName
                FROM Orders o
                INNER JOIN Users u ON o.UserId = u.UserId
                INNER JOIN OrderIngredients oi ON o.OrderID = oi.OrderID
                INNER JOIN Ingredient i ON oi.IngredientID = i.Ingredient_ID
                WHERE (@OrderID = '' OR o.OrderID = @OrderID)
                  AND (@IngredientID = '' OR i.Ingredient_ID = @IngredientID)
                  AND (@OrderDate = '' OR CONVERT(VARCHAR, o.OrderDate, 101) = @OrderDate)";

            SqlCommand cmd = new SqlCommand(query, con);
            cmd.Parameters.AddWithValue("@OrderID", orderId);
            cmd.Parameters.AddWithValue("@IngredientID", ingredientId);
            cmd.Parameters.AddWithValue("@OrderDate", orderDate);

            SqlDataAdapter da = new SqlDataAdapter(cmd);
            DataTable dt = new DataTable();
            da.Fill(dt);

            GridViewResults.DataSource = dt;
            GridViewResults.DataBind();
        }
    }
}
