using BMS.Models;
using Newtonsoft.Json;
using System;
using System.Net.Http;
using System.Text;
using System.Threading.Tasks;

namespace BMSTest.TestController
{
    class TestRegister
    {
        private HttpClient restClient = new HttpClient();
        private string URI = "https://localhost:44389/api/Account";

        public async Task<string> Test_Register(string userName, string password, string fullName, string email, string phone, string address, string avatar)
        {
            UriBuilder builder = new UriBuilder($"{URI}");
            User user = new User()
            {
                UserName = userName,
                Password = password,
                FullName = fullName,
                Email = email,
                Phone = phone,
                Address = address,
                Avatar = avatar
            };
            string json = JsonConvert.SerializeObject(user);
            var response = await restClient.PostAsync(builder.Uri, new StringContent(json, Encoding.UTF8, "application/json"));
            var context = await response.Content.ReadAsStringAsync();

            return context;
        }
    }
}
