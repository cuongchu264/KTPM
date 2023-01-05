using BMS.Models;
using Newtonsoft.Json;
using System;
using System.Net.Http;
using System.Text;
using System.Threading.Tasks;

namespace TestProject1.TestController
{
    public class TestLogin
    {
        private HttpClient restClient = new HttpClient();
        private string URI = "https://localhost:44389/api/Account/login";

        public async Task<string> Test_Login(string userName, string password)
        {
            UriBuilder builder = new UriBuilder($"{URI}");
            UserLoginModel user = new UserLoginModel()
            {
                UserName = userName,
                Password = password
            };
            string json = JsonConvert.SerializeObject(user);
            var response = await restClient.PostAsync(builder.Uri, new StringContent(json, Encoding.UTF8, "application/json"));
            var context = await response.Content.ReadAsStringAsync();
            var result = JsonConvert.DeserializeObject(context);

            return result.ToString();
        }
    }
}
