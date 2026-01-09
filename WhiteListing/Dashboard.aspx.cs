using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using WhiteListing.Helper;

namespace WhiteListing
{
    public partial class Dashboard : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["apiToken"] == null)
            {
                generateToken token = new generateToken();
                string tokenvalue = token.GetAccessToken();
                Session["apiToken"] = tokenvalue;
                apiToken1.Value = Session["apiToken"].ToString();
                
            }
            else
            {
                apiToken1.Value = Session["apiToken"].ToString();
            }
        }
    }
}