using System;
using WhiteListing.Helper;

namespace WhiteListing
{
    public partial class White_listing : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["apiToken"] == null)
            {
                generateToken token = new generateToken();
                string tokenvalue = token.GetAccessToken();
                Session["apiToken"] = tokenvalue;
                apiToken.Value = Session["apiToken"].ToString();
            }
            else
            {
                apiToken.Value = Session["apiToken"].ToString();
            }
        }
    }
}