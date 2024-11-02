using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ABC_Cake
{
    public partial class Logout : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            // Clear the session
            Session.Clear();
            Session.Abandon();
            // Redirect to the login page or home page
            Response.Redirect("Login.aspx");
        }

        protected void btnLogin_Click(object sender, EventArgs e)
        {
            // Redirect to the login page
            Response.Redirect("Login.aspx");
        }
    }
}