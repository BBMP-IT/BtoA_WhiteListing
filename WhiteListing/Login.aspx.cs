using System;
using System.Collections.Generic;
using System.Configuration;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WhiteListing
{
    public partial class Login : System.Web.UI.Page
    {
        protected void btnLogin_Click(object sender, EventArgs e)
        {
            string username = txtUser.Text.Trim();
            string password = txtPass.Text.Trim();

            string adminUser = ConfigurationManager.AppSettings["AdminUser"];
            string adminPass = ConfigurationManager.AppSettings["AdminPass"];
            string cbyValue = ConfigurationManager.AppSettings["Cby"];

            if (username == adminUser && password == adminPass)
            {
                // store Cby for later use
                Session["Cby"] = cbyValue;

                Response.Redirect("Dashboard.aspx");
            }
            else
            {
                lblMsg.Text = "Invalid username or password";
            }
        }

    }
}
