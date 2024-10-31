using System;
using System.Collections;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ABC_Cake
{
    public partial class Order : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                LoadCustomCakes();
               
            }

        }

        private void LoadCustomCakes()
        {
            using (SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["AbcCakeConnection"].ConnectionString))
            {

                String CustomQuery = "SELECT DISTINCT Custom_Cake_Name FROM Ingredient";
                SqlCommand cmd = new SqlCommand(CustomQuery, con);
                con.Open();
                SqlDataReader reader= cmd.ExecuteReader();
                DropDownList1.Items.Clear();
                DropDownList1.Items.Add(new ListItem("Select Custom Cake", ""));
                while (reader.Read())
                {
                    string cakeName = reader["Custom_Cake_Name"].ToString();
                    DropDownList1.Items.Add(new ListItem(cakeName, cakeName));
                }

            }
        }

        protected void Button1_Click(object sender, EventArgs e)
        {

        }

        protected void DropDownList1_SelectedIndexChanged(object sender, EventArgs e)
        {
            LoadIngredients();
        }

        private void LoadIngredients()
        {
            string selectedCake = DropDownList1.SelectedValue;
            using (SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["AbcCakeConnection"].ConnectionString))
            {
                string Ingquery = "SELECT Ingredient_Name, Price_Unit FROM Ingredient WHERE Custom_Cake_Name = @Custom_Cake_Name";
                SqlCommand cmd = new SqlCommand(Ingquery, con);
                cmd.Parameters.AddWithValue("@Custom_Cake_Name", selectedCake);
                con.Open();
                SqlDataReader reader = cmd.ExecuteReader();
                DropDownList2.Items.Clear();
                DropDownList2.Items.Add(new ListItem("Select Ingredient", ""));
                while (reader.Read())
                {
                    string ingredientName = reader["Ingredient_Name"].ToString();
                    decimal price = (decimal)reader["Price_Unit"];
                    DropDownList2.Items.Add(new ListItem($"{ingredientName} - ${price}", ingredientName));
                }


            }

        }
        protected void DropDownList2_SelectedIndexChanged(object sender, EventArgs e)
        {
            LoadPrice();

        }

        private void LoadPrice()
        {
            string selectedIngredient = DropDownList2.SelectedValue;
            if (string.IsNullOrEmpty(selectedIngredient)) return;
            using (SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["AbcCakeConnection"].ConnectionString))
            {
                string Pquery = "SELECT Price_Unit FROM Ingredient WHERE Ingredient_Name = @Ingredient_Name";
                SqlCommand cmd = new SqlCommand(Pquery, con);
                cmd.Parameters.AddWithValue("@Ingredient_Name", selectedIngredient);
                con.Open();


            }


        }

        
    }
}