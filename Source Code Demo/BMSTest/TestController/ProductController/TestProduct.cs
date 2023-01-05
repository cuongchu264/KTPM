using BMS.Models;
using Newtonsoft.Json;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Net.Http;
using System.Text;
using System.Threading.Tasks;

namespace BMSTest.TestController.ProductController
{
    class TestProduct
    {
        private HttpClient restClient = new HttpClient();
        private string URI = "https://localhost:44389/api/Products";

        public async Task<string> Test_PostProduct(string productName, int categoryId, int price, string avatar, string description, int inStocks, string img1)
        {
            UriBuilder builder = new UriBuilder($"{URI}");
            Product product = new Product()
            {
                ProductName = productName,
                CategoryId = categoryId,
                Price = price,
                Avatar = avatar,
                Description = description,
                InStocks = inStocks,
                Img1 = img1
            };
            string json = JsonConvert.SerializeObject(product);
            var response = await restClient.PostAsync(builder.Uri, new StringContent(json, Encoding.UTF8, "application/json"));
            var context = await response.Content.ReadAsStringAsync();

            return context;
        }
        public async Task<string> Test_DeleteProduct(int productId)
        {
            UriBuilder builder = new UriBuilder($"{URI}");
            Product product = new Product()
            {
                ProductId = productId,
            };
            string json = JsonConvert.SerializeObject(product);
            var response = await restClient.DeleteAsync(builder.Uri);
            var context = await response.Content.ReadAsStringAsync();

            return context;
        }
    }
}
