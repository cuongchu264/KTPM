using BMS.Models;
using Newtonsoft.Json;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Net.Http;
using System.Text;
using System.Threading.Tasks;

namespace BMSTest.TestController.DeleteUser
{
    class TestDeleteUser
    {
        private HttpClient restClient = new HttpClient();
        private string URI = "https://localhost:44389/api/Account/";

        public async Task<string> Test_Delete(int id)
        {
            UriBuilder builder = new UriBuilder($"{URI}{id}"); 
            User user = new User()
            {
                UserId = id
            };
            string json = JsonConvert.SerializeObject(user);
            var response = await restClient.DeleteAsync(builder.Uri);
            var context = await response.Content.ReadAsStringAsync();

            return context;
        }
    }
}
