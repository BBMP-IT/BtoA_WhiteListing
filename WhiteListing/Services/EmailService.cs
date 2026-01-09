using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Net;
using System.Net.Mail;
using System.Web;
using System.Web.Hosting;

namespace WhiteListing.Services
{
    public class EmailService
    {
        private readonly string smtpServer;
        private readonly int smtpPort;
        private readonly string smtpUser;
        private readonly string smtpPass;
        private readonly string templatePath;

        public EmailService()
        {
            smtpServer = System.Configuration.ConfigurationManager.AppSettings["SmtpServer"];
            smtpPort = int.Parse(System.Configuration.ConfigurationManager.AppSettings["SmtpPort"]);
            smtpUser = System.Configuration.ConfigurationManager.AppSettings["SmtpUser"];
            smtpPass = System.Configuration.ConfigurationManager.AppSettings["SmtpPass"];
            templatePath = HostingEnvironment.MapPath("~/EmailTemplates/TransactionEmailTemplate.html");
        }


        public void SendTransactionEmail(string toEmail, string userName, string password)
        {
            string body = File.ReadAllText(templatePath);
            body = body.Replace("{{UserName}}", userName)
                       .Replace("{{Password}}", password);

            var mail = new MailMessage();
            mail.From = new MailAddress(smtpUser);
            mail.To.Add(toEmail);
            mail.Subject = "Password Details";
            mail.Body = body;
            mail.IsBodyHtml = true;

            using (var smtp = new SmtpClient())
            {
                smtp.Host = smtpServer;
                smtp.Port = smtpPort;
                smtp.EnableSsl = true;


                smtp.UseDefaultCredentials = false;
                smtp.Credentials = new NetworkCredential(smtpUser, smtpPass);
                smtp.DeliveryMethod = SmtpDeliveryMethod.Network;

                try
                {
                    Console.WriteLine("Email sent successfully!");
                    smtp.Send(mail);
                }
                catch (SmtpException smtpEx)
                {
                    Console.WriteLine("SMTP Exception:");
                    Console.WriteLine("StatusCode: " + smtpEx.StatusCode);
                    Console.WriteLine("Message: " + smtpEx.Message);
                    Console.WriteLine("InnerException: " + smtpEx.InnerException?.Message);
                    throw;
                }
                catch (Exception ex)
                {
                    Console.WriteLine("General Exception:");
                    Console.WriteLine("Message: " + ex.Message);
                    Console.WriteLine("StackTrace: " + ex.StackTrace);
                    throw;
                }
            }
        }

    }
}