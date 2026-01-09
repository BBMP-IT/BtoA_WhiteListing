using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Services;

namespace WhiteListing.Services
{
    [WebService(Namespace = "http://tempuri.org/")]
    [WebServiceBinding(ConformsTo = WsiProfiles.BasicProfile1_1)]
    [System.ComponentModel.ToolboxItem(false)]
    [System.Web.Script.Services.ScriptService] // Enable AJAX calls
    public class Email : System.Web.Services.WebService
    {
        [WebMethod(Description = "Sends officer email")]
        public string SendOfficerEmail(string email, string userName, string password)
        {
            try
            {
                var service = new EmailService(); // Your existing EmailService class
                service.SendTransactionEmail(email, userName, password);
                return "SUCCESS";
            }
            catch (Exception ex)
            {
                return "ERROR: " + ex.Message;
            }
        }
    }
}
