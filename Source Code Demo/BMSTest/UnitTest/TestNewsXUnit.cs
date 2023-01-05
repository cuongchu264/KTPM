using BMSTest.TestController.News;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Xunit;

namespace BMSTest.UnitTest
{
    public class TestNewsXUnit
    {
        [Theory]
        [InlineData("Title","Comment","Image.png","newLink.com",1,"New Category")]
        public async void test_Post_News_Success(string newTitle, string newComment, string newImg, string newLink, int newCategory, string newCategoryName)
        {
            TestNews api = new TestNews();
            var response = await api.Test_PostNew(newTitle, newComment, newImg, newLink, newCategory, newCategoryName);
            Assert.Contains(newTitle, response);
        }
        [Theory]
        [InlineData("", "Comment", "Image.png", "newLink.com", 1, "New Category")]
        public async void test_Post_News_Fail_With_Null_Title(string newTitle, string newComment, string newImg, string newLink, int newCategory, string newCategoryName)
        {
            TestNews api = new TestNews();
            var response = await api.Test_PostNew(newTitle, newComment, newImg, newLink, newCategory, newCategoryName);
            Assert.Contains("Title is required!", response);
        }
        [Theory]
        [InlineData("Title", "", "Image.png", "newLink.com", 1, "New Category")]
        public async void test_Post_News_Fail_With_Null_Comment(string newTitle, string newComment, string newImg, string newLink, int newCategory, string newCategoryName)
        {
            TestNews api = new TestNews();
            var response = await api.Test_PostNew(newTitle, newComment, newImg, newLink, newCategory, newCategoryName);
            Assert.Contains("Comment is required!", response);
        }
        [Theory]
        [InlineData("Title", "Comment", "", "newLink.com", 1, "New Category")]
        public async void test_Post_News_Fail_With_Null_Image(string newTitle, string newComment, string newImg, string newLink, int newCategory, string newCategoryName)
        {
            TestNews api = new TestNews();
            var response = await api.Test_PostNew(newTitle, newComment, newImg, newLink, newCategory, newCategoryName);
            Assert.Contains("Image is required!", response);
        }
        [Theory]
        [InlineData("Title", "Comment", "Image.png", "", 1, "New Category")]
        public async void test_Post_News_Fail_With_Null_Link(string newTitle, string newComment, string newImg, string newLink, int newCategory, string newCategoryName)
        {
            TestNews api = new TestNews();
            var response = await api.Test_PostNew(newTitle, newComment, newImg, newLink, newCategory, newCategoryName);
            Assert.Contains("Link is required!", response);
        }
        [Theory]
        [InlineData("Title", "Comment", "Image.png", "newLink.com", 0, "New Category")]
        public async void test_Post_News_Fail_With_CategoryId_As_0(string newTitle, string newComment, string newImg, string newLink, int newCategory, string newCategoryName)
        {
            TestNews api = new TestNews();
            var response = await api.Test_PostNew(newTitle, newComment, newImg, newLink, newCategory, newCategoryName);
            Assert.Contains("New category ID is required!", response);
        }
        [Theory]
        [InlineData("Title", "Comment", "Image.png", "newLink.com", -1, "New Category")]
        public async void test_Post_News_Fail_With_CategoryId_Less_Than_0(string newTitle, string newComment, string newImg, string newLink, int newCategory, string newCategoryName)
        {
            TestNews api = new TestNews();
            var response = await api.Test_PostNew(newTitle, newComment, newImg, newLink, newCategory, newCategoryName);
            Assert.Contains("Invalid New Category ID!", response);
        }
        [Theory]
        [InlineData("Title", "Comment", "Image.png", "newLink.com", 1, "")]
        public async void test_Post_News_Fail_With_Null_CategoryName(string newTitle, string newComment, string newImg, string newLink, int newCategory, string newCategoryName)
        {
            TestNews api = new TestNews();
            var response = await api.Test_PostNew(newTitle, newComment, newImg, newLink, newCategory, newCategoryName);
            Assert.Contains("New category name is required!", response);
        }
        [Theory]
        [InlineData(1006)]
        public async void test_Delete_News(int newId)
        {
            TestNews api = new TestNews();
            var response = await api.Test_DeleteNew(newId);
            if (response != "")
            {
                Assert.Contains("Not Found", response);
            }
            else
            {
                Assert.Contains("", response);
            }
        }
    }
}
