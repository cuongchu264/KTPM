using BMSTest.TestController;
using TestProject1.TestController;
using Xunit;

namespace BMSTest
{
    public class TestLoginXUnit
    {

        [Theory]
        [InlineData("congdat123","cnd210601")]
        public async void test_Login_Success(string userName, string password)
        {
            TestLogin api = new TestLogin();
            var response = await api.Test_Login(userName, password);
            Assert.NotEqual("{\r\n  \"state\": \"invalid username or password\"\r\n}", response);
        }

        [Theory]
        [InlineData("congssdat123", "cnd210601")]
        public async void test_Login_Fail(string userName, string password)
        {
            TestLogin api = new TestLogin();
            var response = await api.Test_Login(userName, password);
            Assert.Equal("{\r\n  \"state\": \"invalid username or password\"\r\n}", response);
 
        }
        [Theory]
        [ClassData(typeof(TestLoginInputData))]
        public async void test_Login_Fail_With_Null_UserName (string userName, string password)
        {
            if (userName == "")
            {
                TestLogin api = new TestLogin();
                var response = await api.Test_Login(userName, password);
                Assert.Contains("The UserName field is required.", response);
            }
        }
        [Theory]
        [ClassData(typeof(TestLoginInputData))]
        public async void test_Login_Fail_With_Null_Password(string userName, string password)
        {
            if (password == "")
            {
                TestLogin api = new TestLogin();
                var response = await api.Test_Login(userName, password);
                Assert.Contains("The Password field is required.", response);
            }
        }
    }
}
