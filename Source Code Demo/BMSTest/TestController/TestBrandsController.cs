using BMS.Footer;
using Newtonsoft.Json;
using System;
using System.Net.Http;
using System.Threading.Tasks;

namespace TestProject1.TestController
{
    public class TestBrandsController
    {
        private HttpClient restClient = new HttpClient();
        private string URI = "https://localhost:44389/api/Brands/1";

        public async Task<Brand> Get_Brand()
        {
            UriBuilder builder = new UriBuilder($"{URI}");
            var response = await restClient.GetAsync(builder.Uri);
            var context = await response.Content.ReadAsStringAsync();

            try
            {
                var responseModel = JsonConvert.DeserializeObject<Brand>(context);
                return responseModel;
            }
            catch
            {
                return null;
            }
        }
    }
}
