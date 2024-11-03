using System;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;
using System.Web.UI.WebControls;
using System.Collections.Generic;

namespace ABC_Cake
{
    public partial class Order : System.Web.UI.Page
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
                BindDropDowns();
                
            }
        }

        private void BindDropDowns()
        {
            using (SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["AbcCakeConnection"].ConnectionString))
            {
                con.Open();

                // Decoration Types
                using (SqlCommand cmd = new SqlCommand(@"
            SELECT Ingredient.Ingredient_ID, Ingredient.Ingredient_Name 
            FROM Ingredient 
            JOIN Inventory ON Ingredient.Ingredient_ID = Inventory.IngredientID 
            WHERE Ingredient.Custom_Cake_Name = 'Decoration' AND Inventory.Quantity > 0", con))

                    
                {
                    using (SqlDataReader reader = cmd.ExecuteReader())
                    {
                        DropDownList6.DataSource = reader;
                        DropDownList6.DataTextField = "Ingredient_Name";
                        DropDownList6.DataValueField = "Ingredient_ID";
                        DropDownList6.DataBind();
                    }
                }
                DropDownList6.Items.Insert(0, new ListItem("Select Decoration Types", ""));

                // Cake Flavors
                using (SqlCommand cmd = new SqlCommand(@"
            SELECT Ingredient.Ingredient_ID, Ingredient.Ingredient_Name 
            FROM Ingredient 
            JOIN Inventory ON Ingredient.Ingredient_ID = Inventory.IngredientID 
            WHERE Ingredient.Custom_Cake_Name = 'Cake Flavors' AND Inventory.Quantity > 0", con))
                {
                    using (SqlDataReader reader = cmd.ExecuteReader())
                    {
                        DropDownList1.DataSource = reader;
                        DropDownList1.DataTextField = "Ingredient_Name";
                        DropDownList1.DataValueField = "Ingredient_ID";
                        DropDownList1.DataBind();
                    }
                }
                DropDownList1.Items.Insert(0, new ListItem("Select Cake Flavor", ""));

                // Cake Sizes
                using (SqlCommand cmd = new SqlCommand(@"
            SELECT Ingredient.Ingredient_ID, Ingredient.Ingredient_Name 
            FROM Ingredient 
            JOIN Inventory ON Ingredient.Ingredient_ID = Inventory.IngredientID 
            WHERE Ingredient.Custom_Cake_Name = 'Cake Sizes' AND Inventory.Quantity > 0", con))
                {
                    using (SqlDataReader reader = cmd.ExecuteReader())
                    {
                        DropDownList2.DataSource = reader;
                        DropDownList2.DataTextField = "Ingredient_Name";
                        DropDownList2.DataValueField = "Ingredient_ID";
                        DropDownList2.DataBind();
                    }
                }
                DropDownList2.Items.Insert(0, new ListItem("Select Cake Size", ""));

                // Cake Shapes
                using (SqlCommand cmd = new SqlCommand(@"
            SELECT Ingredient.Ingredient_ID, Ingredient.Ingredient_Name 
            FROM Ingredient 
            JOIN Inventory ON Ingredient.Ingredient_ID = Inventory.IngredientID 
            WHERE Ingredient.Custom_Cake_Name = 'Cake Shapes' AND Inventory.Quantity > 0", con))
                {
                    using (SqlDataReader reader = cmd.ExecuteReader())
                    {
                        DropDownList3.DataSource = reader;
                        DropDownList3.DataTextField = "Ingredient_Name";
                        DropDownList3.DataValueField = "Ingredient_ID";
                        DropDownList3.DataBind();
                    }
                }
                DropDownList3.Items.Insert(0, new ListItem("Select Cake Shape", ""));

                // Cake Colors
                using (SqlCommand cmd = new SqlCommand(@"
            SELECT Ingredient.Ingredient_ID, Ingredient.Ingredient_Name 
            FROM Ingredient 
            JOIN Inventory ON Ingredient.Ingredient_ID = Inventory.IngredientID 
            WHERE Ingredient.Custom_Cake_Name = 'Color' AND Inventory.Quantity > 0", con))
                {
                    using (SqlDataReader reader = cmd.ExecuteReader())
                    {
                        DropDownList4.DataSource = reader;
                        DropDownList4.DataTextField = "Ingredient_Name";
                        DropDownList4.DataValueField = "Ingredient_ID";
                        DropDownList4.DataBind();
                    }
                }
                DropDownList4.Items.Insert(0, new ListItem("Select Cake Color", ""));

                // Cake Fillings
                using (SqlCommand cmd = new SqlCommand(@"
            SELECT Ingredient.Ingredient_ID, Ingredient.Ingredient_Name 
            FROM Ingredient 
            JOIN Inventory ON Ingredient.Ingredient_ID = Inventory.IngredientID 
            WHERE Ingredient.Custom_Cake_Name = 'Filling' AND Inventory.Quantity > 0", con))
                {
                    using (SqlDataReader reader = cmd.ExecuteReader())
                    {
                        DropDownList5.DataSource = reader;
                        DropDownList5.DataTextField = "Ingredient_Name";
                        DropDownList5.DataValueField = "Ingredient_ID";
                        DropDownList5.DataBind();
                    }
                }
                DropDownList5.Items.Insert(0, new ListItem("Select Cake Filling", ""));

                //Cake Size

                using (SqlCommand cmd = new SqlCommand(@"
            SELECT Ingredient.Ingredient_ID, Ingredient.Ingredient_Name 
            FROM Ingredient 
            JOIN Inventory ON Ingredient.Ingredient_ID = Inventory.IngredientID 
            WHERE Ingredient.Custom_Cake_Name = 'Size' AND Inventory.Quantity > 0", con))
                {
                    using (SqlDataReader reader = cmd.ExecuteReader())
                    {
                        DropDownList7.DataSource = reader;
                        DropDownList7.DataTextField = "Ingredient_Name";
                        DropDownList7.DataValueField = "Ingredient_ID";
                        DropDownList7.DataBind();
                    }
                }
                DropDownList7.Items.Insert(0, new ListItem("Select Cake Size", ""));
            }
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            // Gather selected items and bind to grid
            string decoration = DropDownList6.SelectedItem.Text;
            string flavor = DropDownList1.SelectedItem.Text;
            string size = DropDownList2.SelectedItem.Text;
            string shape = DropDownList3.SelectedItem.Text;
            string color = DropDownList4.SelectedItem.Text;
            string filling = DropDownList5.SelectedItem.Text;

            BindGrid(GridView1, "Decoration Type", decoration);
            BindGrid(GridView2, "Cake Flavor", flavor);
            BindGrid(GridView3, "Cake Size", size);
            BindGrid(GridView4, "Cake Shape", shape);
            BindGrid(GridView5, "Cake Color", color);
            BindGrid(GridView6, "Cake Filling", filling);

            // Calculate total price
            CalculateTotalPrice();
        }

        private void BindGrid(GridView gridView, string title, string selectedText)
        {
            DataTable dt = new DataTable();
            dt.Columns.Add("Title");
            dt.Columns.Add("SelectedItem");

            DataRow dr = dt.NewRow();
            dr["Title"] = title;
            dr["SelectedItem"] = selectedText;
            dt.Rows.Add(dr);

            gridView.DataSource = dt;
            gridView.DataBind();
        }
        protected void txtDeliveryAddress_TextChanged(object sender, EventArgs e)
        {
            
            string deliveryAddress = txtDeliveryAddress.Text;
            
        }
        private void CalculateTotalPrice()
        {
            decimal total = 0;

            total += GetIngredientPrice(DropDownList6.SelectedValue);       // Decoration
            total += GetIngredientPrice(DropDownList1.SelectedValue); // Flavor
            total += GetIngredientPrice(DropDownList2.SelectedValue); // Size
            total += GetIngredientPrice(DropDownList3.SelectedValue); // Shape
            total += GetIngredientPrice(DropDownList4.SelectedValue); // Color
            total += GetIngredientPrice(DropDownList5.SelectedValue); // Filling

            lblTotalPrice.Text = "Total Price: $" + total.ToString("F2");
        }

        private decimal GetIngredientPrice(string ingredientId)
        {
            decimal price = 0;

            using (SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["AbcCakeConnection"].ConnectionString))
            {
                con.Open();
                string query = "SELECT Price_Unit FROM Ingredient WHERE Ingredient_ID = @IngredientId";
                using (SqlCommand cmd = new SqlCommand(query, con))
                {
                    cmd.Parameters.AddWithValue("@IngredientId", ingredientId);
                    object result = cmd.ExecuteScalar();
                    if (result != null)
                    {
                        price = Convert.ToDecimal(result);
                    }
                }
            }

            return price;
        }

        protected void ConfirmButton_Click(object sender, EventArgs e)
        {
            

            int userId = Convert.ToInt32(Session["UserId"]);
            decimal totalPrice = Convert.ToDecimal(lblTotalPrice.Text.Replace("Total Price: $", ""));
            string deliveryAddress = txtDeliveryAddress.Text; 
            string phoneNumber = txtPhoneNumber.Text; 
            int statusId = 1;
            if (string.IsNullOrWhiteSpace(deliveryAddress) || string.IsNullOrWhiteSpace(phoneNumber))
            {
                ClientScript.RegisterStartupScript(this.GetType(), "alert", "alert('Please provide both delivery address and phone number.');", true);
                return;
            }



            using (SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["AbcCakeConnection"].ConnectionString))
            {
                con.Open();

                string insertOrderQuery = @"
            INSERT INTO Orders (UserId, TotalPrice, DeliveryAddress, PhoneNumber, StatusID, OrderDate) 
            OUTPUT INSERTED.OrderID 
            VALUES (@UserId, @TotalPrice, @DeliveryAddress, @PhoneNumber, @StatusID, GETDATE())";

                SqlCommand orderCmd = new SqlCommand(insertOrderQuery, con);
                orderCmd.Parameters.AddWithValue("@UserId", userId);
                orderCmd.Parameters.AddWithValue("@TotalPrice", totalPrice);
                orderCmd.Parameters.AddWithValue("@DeliveryAddress", deliveryAddress);
                orderCmd.Parameters.AddWithValue("@PhoneNumber", phoneNumber);
                orderCmd.Parameters.AddWithValue("@StatusID", statusId);

                int orderId = (int)orderCmd.ExecuteScalar(); // Retrieve the new OrderID

                string insertOrderIngredientsQuery = @"
            INSERT INTO OrderIngredients (OrderID, IngredientID) 
            VALUES (@OrderID, @IngredientID)";

                var ingredientIds = new List<string>
        {
            DropDownList6.SelectedValue, // Decoration
            DropDownList1.SelectedValue, // Flavor
            DropDownList2.SelectedValue, // Size
            DropDownList3.SelectedValue, // Shape
            DropDownList4.SelectedValue, // Color
            DropDownList5.SelectedValue  // Filling
        };

                foreach (var ingredientId in ingredientIds)
                {
                    if (!string.IsNullOrEmpty(ingredientId)) // Check if the ingredient ID is not empty
                    {
                        using (SqlCommand ingredientCmd = new SqlCommand(insertOrderIngredientsQuery, con))
                        {
                            ingredientCmd.Parameters.AddWithValue("@OrderID", orderId);
                            ingredientCmd.Parameters.AddWithValue("@IngredientID", ingredientId);
                            ingredientCmd.ExecuteNonQuery(); 
                        }
                        ReduceInventory(con, ingredientId);
                    }
                }

             
                ClientScript.RegisterStartupScript(this.GetType(), "alert", "alert('Order Pending. Please Check The Status!');", true);
                
                Response.Redirect("UserProfile.aspx");
            }
        }

        private void ReduceInventory(SqlConnection con, string ingredientId)
        {
            if (!string.IsNullOrEmpty(ingredientId))
            {
                string updateInventoryQuery = @"
                        UPDATE Inventory 
                        SET Quantity = Quantity - 1 
                        WHERE IngredientID = @IngredientId AND Quantity > 0"; 



                using (SqlCommand cmd = new SqlCommand(updateInventoryQuery, con))
                {
                    cmd.Parameters.AddWithValue("@IngredientId", ingredientId);
                    int rowsAffected = cmd.ExecuteNonQuery();

                    // Optionally, you could handle cases where the ingredient was not in stock
                    if (rowsAffected == 0)
                    {
                        ClientScript.RegisterStartupScript(this.GetType(), "alert", "alert('Ingredient was not in stock');", true);
                        return;
                    }
                }
            }
        }
    }
}
