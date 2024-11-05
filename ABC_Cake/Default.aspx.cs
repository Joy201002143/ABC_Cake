using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ABC_Cake
{
    public partial class _Default : Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["UserRole"] == null)
            {   
                Response.Redirect("Login.aspx");
                return;
            }
            if (Session["UserId"] == null)
            {
                Response.Redirect("Login.aspx");
                return;
            }
        }
    }
}