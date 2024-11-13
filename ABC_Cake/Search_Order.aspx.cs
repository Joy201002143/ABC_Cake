using System;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;
using System.Web.UI.WebControls;
using System.Collections.Generic;
using System.Web.Services;
using System.Web.Script.Services;

namespace ABC_Cake
{
    public partial class Search_Order : System.Web.UI.Page
    {
        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["AbcCakeConnection"].ConnectionString);

        protected void Page_Load(object sender, EventArgs e)
        {
            
            
            if (!IsPostBack)
            {
                if (Session["UserRole"] == null)
                {
                    Response.Redirect("Login.aspx");
                    return;
                }
                LoadOrderIDs();
                LoadIngredients();
                LoadStatus();
            }
        }

        [WebMethod]
        [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
        public static List<string> GetOrderIds(string term)
        {
            List<string> orderIds = new List<string>();

            using (SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["AbcCakeConnection"].ConnectionString))
            {
                string query = "SELECT OrderID FROM Orders WHERE OrderID LIKE @term + '%'";
                using (SqlCommand cmd = new SqlCommand(query, con))
                {
                    cmd.Parameters.AddWithValue("@term", term);
                    con.Open();
                    using (SqlDataReader reader = cmd.ExecuteReader())
                    {
                        while (reader.Read())
                        {
                            orderIds.Add(reader["OrderID"].ToString());
                        }
                    }
                }
            }

            return orderIds;
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

        private void LoadIngredients()
        {
            SqlCommand cmd = new SqlCommand("SELECT DISTINCT i.Ingredient_Name, i.Ingredient_ID FROM Ingredient i INNER JOIN OrderIngredients oi ON i.Ingredient_ID = oi.IngredientID WHERE i.Custom_Cake_Name='Cake Flavors'", con);
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            DataTable dt = new DataTable();
            da.Fill(dt);

            ddlIngredient.DataSource = dt;
            ddlIngredient.DataTextField = "Ingredient_Name";
            ddlIngredient.DataValueField = "Ingredient_ID";
            ddlIngredient.DataBind();

            ddlIngredient.Items.Insert(0, new ListItem("-- None --", ""));
        }

        private void LoadStatus()
        {
            SqlCommand cmd = new SqlCommand("SELECT statusID, status_name FROM [AbcCake].[dbo].[status]", con);
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            DataTable dt = new DataTable();
            da.Fill(dt);

            status.DataSource = dt;
            status.DataTextField = "status_name";
            status.DataValueField = "statusID";
            status.DataBind();

            status.Items.Insert(0, new ListItem("-- None --", ""));
        }

        protected void btnSearch_Click(object sender, EventArgs e)
        {
            string OID = txtOrderSearch.Text;
            //Response.Write("Debug OID Value: " + OID);

            string ingredientId = ddlIngredient.SelectedValue;
            string startDate = txtStartDate.Text;
            string endDate = txtEndDate.Text;
            string Status = status.SelectedValue;

            if (string.IsNullOrEmpty(startDate))
            {
                startDate = "01/12/2020"; 
            }

            if (string.IsNullOrEmpty(endDate))
            {
                endDate = DateTime.Now.AddDays(1).ToString("MM/dd/yyyy");

                //endDate = DateTime.Now.ToString("MM/dd/yyyy"); 
            }

            string query = @"
        WITH CTE AS (
            SELECT 
                u.UserName, 
                o.OrderID, 
                o.TotalPrice, 
                o.OrderDate, 
                i.Ingredient_Name, 
                s.status_name,
                ROW_NUMBER() OVER (PARTITION BY o.OrderID ORDER BY i.Ingredient_Name) AS RowNum
            FROM 
                [AbcCake].[dbo].[Orders] o
            INNER JOIN 
                Users u ON o.UserId = u.UserId
            INNER JOIN 
                OrderIngredients oi ON o.OrderID = oi.OrderID
            INNER JOIN 
                Ingredient i ON oi.IngredientID = i.Ingredient_ID
            INNER JOIN 
                status s ON o.StatusID = s.statusID
            WHERE 
                (@OrderID = '' OR o.OrderID = @OrderID)
                AND (@IngredientID = '' OR i.Ingredient_ID = @IngredientID)
                AND (@Status = '' OR o.StatusID = @Status)
                AND ((@StartDate = '' AND @EndDate = '') OR (o.OrderDate BETWEEN @StartDate AND @EndDate))
        )
        SELECT 
            UserName, 
            OrderID, 
            TotalPrice, 
            OrderDate, 
            Ingredient_Name, 
            status_name
        FROM 
            CTE
        WHERE 
            RowNum = 1;";
            //  
            //

            SqlCommand cmd = new SqlCommand(query, con);
            cmd.Parameters.AddWithValue("@OrderID", OID);
            cmd.Parameters.AddWithValue("@Status", Status);
            //cmd.Parameters.AddWithValue("@OrderID", orderId);
            cmd.Parameters.AddWithValue("@IngredientID", ingredientId);
            cmd.Parameters.AddWithValue("@StartDate", string.IsNullOrEmpty(startDate) ? (object)DBNull.Value : startDate);
            cmd.Parameters.AddWithValue("@EndDate", string.IsNullOrEmpty(endDate) ? (object)DBNull.Value : endDate);

            SqlDataAdapter da = new SqlDataAdapter(cmd);
            DataTable dt = new DataTable();
            da.Fill(dt);
            ddlOrderIDs.ClearSelection();

            GridViewResults.DataSource = dt;
            GridViewResults.DataBind();
        }
    }
}
