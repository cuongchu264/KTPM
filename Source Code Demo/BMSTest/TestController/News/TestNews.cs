using BMS.News;
using Newtonsoft.Json;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Net.Http;
using System.Text;
using System.Threading.Tasks;

namespace BMSTest.TestController.News
{
    class TestNews
    {
        private HttpClient restClient = new HttpClient();
        private string URI = "https://localhost:44389/api/News";

        public async Task<string> Test_PostNew(string newTitle, string newComment, string newImg, string newLink, int newCategory, string newCategoryName)
        {
            UriBuilder builder = new UriBuilder($"{URI}");
            New newModel = new New()
            {
                NewTitle = newTitle,
                NewComment = newComment,
                NewImg = newImg,
                NewLink = newLink,
                NewCategory = newCategory,
                NewCategoryName = newCategoryName,
            };
            string json = JsonConvert.SerializeObject(newModel);
            var response = await restClient.PostAsync(builder.Uri, new StringContent(json, Encoding.UTF8, "application/json"));
            var context = await response.Content.ReadAsStringAsync();

            return context;
        }
        public async Task<string> Test_DeleteNew(int newId)
        {
            UriBuilder builder = new UriBuilder($"{URI}");
            New newModel = new New()
            {
                NewId = newId
            };
            string json = JsonConvert.SerializeObject(newModel);
            var response = await restClient.DeleteAsync(builder.Uri);
            var context = await response.Content.ReadAsStringAsync();

            return context;
        }
    }
}
