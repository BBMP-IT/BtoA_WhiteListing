using Newtonsoft.Json;
using System;
using System.Collections.Generic;
using System.Configuration;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Web;

namespace WhiteListing.Helper
{
    public class generateToken
    {
        public string GetAccessToken()
        {
            // Ensure proper TLS configuration
            if (System.Net.ServicePointManager.SecurityProtocol == (SecurityProtocolType.Ssl3 | SecurityProtocolType.Tls))
                System.Net.ServicePointManager.SecurityProtocol = SecurityProtocolType.Tls | SecurityProtocolType.Tls11 | SecurityProtocolType.Tls12;

            string username = ConfigurationManager.AppSettings["Username"];
            string password = ConfigurationManager.AppSettings["Password"];
            string tokenUrl = ConfigurationManager.AppSettings["TokenUrl"];

            using (var client = new HttpClient())
            {
                var parameters = new FormUrlEncodedContent(new[]
                {
                    new KeyValuePair<string, string>("grant_type", "password"),
                    new KeyValuePair<string, string>("username", username),
                    new KeyValuePair<string, string>("password", password)
                });

                try
                {
                    var response = client.PostAsync(tokenUrl, parameters).Result;

                    if (response.IsSuccessStatusCode)
                    {
                        var responseContent = response.Content.ReadAsStringAsync().Result;
                        dynamic tokenResponse = JsonConvert.DeserializeObject(responseContent);
                        return tokenResponse.access_token != null ? tokenResponse.access_token : string.Empty;
                    }
                    else
                    {
                        Console.WriteLine($"Failed to get access token. Status Code: {response.StatusCode}");
                        var errorContent = response.Content.ReadAsStringAsync().Result;
                        Console.WriteLine($"Error details: {errorContent}");
                        return string.Empty;
                    }
                }
                catch (Exception ex)
                {
                    Console.WriteLine($"Exception occurred: {ex.Message}");
                    return string.Empty;
                }
            }
        }
    }
}