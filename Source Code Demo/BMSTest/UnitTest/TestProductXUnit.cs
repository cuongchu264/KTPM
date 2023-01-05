using BMSTest.TestController.ProductController;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Xunit;

namespace BMSTest.UnitTest
{
    public class TestProductXUnit
    {
        [Theory]
        [InlineData("Ngói", 4 , 2000 , "ngoi.img", "Ngói lặp mái ", 3500, "String")]
        public async void test_Post_Product_Success(string productName, int categoryId, int price, string avatar, string description, int inStocks, string img1)
        {
            TestProduct api = new TestProduct();
            var response = await api.Test_PostProduct(productName, categoryId, price, avatar, description, inStocks, img1);
            Assert.Contains(productName, response);
        }
        [Theory]
        [InlineData("", 4, 2000, "ngoi.img", "Ngói lặp mái ", 3500, "String")]
        public async void test_Post_Product_Fail_With_Null_ProductName(string productName, int categoryId, int price, string avatar, string description, int inStocks, string img1)
        {
            TestProduct api = new TestProduct();
            var response = await api.Test_PostProduct(productName, categoryId, price, avatar, description, inStocks, img1);
            Assert.Contains("Product name is required!", response);
        }
        [Theory]
        [InlineData("Ngói", 0, 2000, "ngoi.img", "Ngói lặp mái ", 3500, "String")]
        public async void test_Post_Product_Fail_With_Null_CategoryID(string productName, int categoryId, int price, string avatar, string description, int inStocks, string img1)
        {
            TestProduct api = new TestProduct();
            var response = await api.Test_PostProduct(productName, categoryId, price, avatar, description, inStocks, img1);
            Assert.Contains("Category ID is required!", response);
        }
        [Theory]
        [InlineData("Ngói", -1, 2000, "ngoi.img", "Ngói lặp mái ", 3500, "String")]
        public async void test_Post_Product_Fail_With_CategoryID_Less_Than_0(string productName, int categoryId, int price, string avatar, string description, int inStocks, string img1)
        {
            TestProduct api = new TestProduct();
            var response = await api.Test_PostProduct(productName, categoryId, price, avatar, description, inStocks, img1);
            Assert.Contains("Invalid category ID!", response);
        }
        [Theory]
        [InlineData("Ngói", 4, 0 , "ngoi.img", "Ngói lặp mái ", 3500, "String")]
        public async void test_Post_Product_Fail_With_Null_Price(string productName, int categoryId, int price, string avatar, string description, int inStocks, string img1)
        {
            TestProduct api = new TestProduct();
            var response = await api.Test_PostProduct(productName, categoryId, price, avatar, description, inStocks, img1);
            Assert.Contains("Price is required!", response);
        }
        [Theory]
        [InlineData("Ngói", 4, -1, "ngoi.img", "Ngói lặp mái ", 3500, "String")]
        public async void test_Post_Product_Fail_With_Price_Less_Than_0(string productName, int categoryId, int price, string avatar, string description, int inStocks, string img1)
        {
            TestProduct api = new TestProduct();
            var response = await api.Test_PostProduct(productName, categoryId, price, avatar, description, inStocks, img1);
            Assert.Contains("Invalid price!", response);
        }
        [Theory]
        [InlineData("Ngói", 4, 2000, "", "Ngói lặp mái ", 3500, "String")]
        public async void test_Post_Product_Fail_With_Null_Avatar(string productName, int categoryId, int price, string avatar, string description, int inStocks, string img1)
        {
            TestProduct api = new TestProduct();
            var response = await api.Test_PostProduct(productName, categoryId, price, avatar, description, inStocks, img1);
            Assert.Contains("Avatar is required!", response);
        }
        [Theory]
        [InlineData("Ngói", 4, 2000, "ngoi.img", "", 3500, "String")]
        public async void test_Post_Product_Fail_With_Null_description(string productName, int categoryId, int price, string avatar, string description, int inStocks, string img1)
        {
            TestProduct api = new TestProduct();
            var response = await api.Test_PostProduct(productName, categoryId, price, avatar, description, inStocks, img1);
            Assert.Contains("Description is required!", response);
        }
        [Theory]
        [InlineData("Ngói", 4, 2000, "ngoi.img", "Ngói lặp mái ", -1, "String")]
        public async void test_Post_Product_Fail_With_Instock_Less_0(string productName, int categoryId, int price, string avatar, string description, int inStocks, string img1)
        {
            TestProduct api = new TestProduct();
            var response = await api.Test_PostProduct(productName, categoryId, price, avatar, description, inStocks, img1);
            Assert.Contains("Invalid Instocks!", response);
        }
        [Theory]
        [InlineData(10081)]
        public async void test_Delete_Product(int productId)
        {
            TestProduct api = new TestProduct();
            var response = await api.Test_DeleteProduct(productId);
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
