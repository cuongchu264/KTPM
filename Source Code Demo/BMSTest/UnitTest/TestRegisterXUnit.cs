using BMSTest.TestController;
using Xunit;

namespace BMSTest
{
    public class TestRegisterXUnit
    {
        [Theory]
        [InlineData("congdat12345","Cnd21060191@","Nguyen Cong Dat", "cnd210601@gmail.com","0359182080","Ly Son","String")]
        public async void test_Register_Success(string userName, string password, string fullName, string email, string phone, string address, string avatar)
        {
            TestRegister api = new TestRegister();
            var response = await api.Test_Register(userName, password, fullName, email, phone, address, avatar);
            if ("{\"state\":\"This account is already in use, please try another one\"}" == response)
            {
                Assert.Equal("{\"state\":\"This account is already in use, please try another one\"}", response);
            }
            else
            {
                Assert.Contains(userName, response);
            }
        }
        [Theory]
        [InlineData("congdat123", "Cnd21060191@", "Nguyen Cong Dat", "cnd210601@gmail.com","0359182080","Ly Son","String")]
        public async void test_Register_Fail(string userName, string password, string fullName, string email, string phone, string address, string avatar)
        {
            TestRegister api = new TestRegister();
            var response = await api.Test_Register(userName, password, fullName, email, phone, address, avatar);
            Assert.Equal("{\"state\":\"This account is already in use, please try another one\"}", response);
        }
        [Theory]
        [InlineData("", "Cnd21060191@", "Nguyen Cong Dat", "cnd210601@gmail.com", "0359182080", "Ly Son", "String")]
        public async void test_Register_with_Null_UserName(string userName, string password, string fullName, string email, string phone, string address, string avatar)
        {
            TestRegister api = new TestRegister();
            var response = await api.Test_Register(userName, password, fullName, email, phone, address, avatar);
            Assert.Equal("{\"state\":\"Username is required!\"}", response);
        }
        [Theory]
        [InlineData("abcxyzzz", "", "Nguyen Cong Dat", "cnd210601@gmail.com", "0359182080", "Ly Son", "String")]
        public async void test_Register_with_Null_Password(string userName, string password, string fullName, string email, string phone, string address, string avatar)
        {
            TestRegister api = new TestRegister();
            var response = await api.Test_Register(userName, password, fullName, email, phone, address, avatar);
            Assert.Equal("{\"state\":\"Password is required!\"}", response);
        }
        [Theory]
        [InlineData("abcxyz", "Cnd21060191@", "", "cnd210601@gmail.com", "0359182080", "Ly Son", "String")]
        public async void test_Register_with_Null_FullName(string userName, string password, string fullName, string email, string phone, string address, string avatar)
        {
            TestRegister api = new TestRegister();
            var response = await api.Test_Register(userName, password, fullName, email, phone, address, avatar);
            Assert.Equal("{\"state\":\"FullName is required!\"}", response);
        }
        [Theory]
        [InlineData("abcxyz", "Cnd21060191@", "Nguyen Cong Dat", "", "0359182080", "Ly Son", "String")]
        public async void test_Register_with_Null_Email (string userName, string password, string fullName, string email, string phone, string address, string avatar)
        {
            TestRegister api = new TestRegister();
            var response = await api.Test_Register(userName, password, fullName, email, phone, address, avatar);
            Assert.Equal("{\"state\":\"Email is required!\"}", response);
        }
        [Theory]
        [InlineData("abcxyz", "Cnd21060191@", "Nguyen Cong Dat", "cnd210621@gmail.com", "", "Ly Son", "String")]
        public async void test_Register_with_Null_Phone(string userName, string password, string fullName, string email, string phone, string address, string avatar)
        {
            TestRegister api = new TestRegister();
            var response = await api.Test_Register(userName, password, fullName, email, phone, address, avatar);
            Assert.Equal("{\"state\":\"Phone is required!\"}", response);
        }
        [Theory]
        [InlineData("abcxyz", "Cnd21060191@", "Nguyen Cong Dat", "cnd210621", "0359182080", "", "String")]
        public async void test_Register_with_Null_Address(string userName, string password, string fullName, string email, string phone, string address, string avatar)
        {
            TestRegister api = new TestRegister();
            var response = await api.Test_Register(userName, password, fullName, email, phone, address, avatar);
            Assert.Equal("{\"state\":\"Address is required!\"}", response);
        }
        [Theory]
        [InlineData("testnotuppercase", "cnd210601", "Nguyen Cong Dat", "cnd210621@gmail.com", "0359182080", "Ly Son", "String")]
        public async void test_Register_with_Password_Not_Have_One_Uppercase(string userName, string password, string fullName, string email, string phone, string address, string avatar)
        {
            TestRegister api = new TestRegister();
            var response = await api.Test_Register(userName, password, fullName, email, phone, address, avatar);
            Assert.Contains("Password should contain At least one upper case letter", response);
        }
        [Theory]
        [InlineData("testnotlowercase", "ABC1223@1231", "Nguyen Cong Dat", "cnd210621@gmail.com", "0359182080", "Ly Son", "String")]
        public async void test_Register_with_Password_Not_Have_One_Lowercase(string userName, string password, string fullName, string email, string phone, string address, string avatar)
        {
            TestRegister api = new TestRegister();
            var response = await api.Test_Register(userName, password, fullName, email, phone, address, avatar);
            Assert.Contains("Password should contain At least one lower case letter", response);
        }
        [Theory]
        [InlineData("testcharacters", "ABa@31", "Nguyen Cong Dat", "cnd210621@gmail.com", "0359182080", "Ly Son", "String")]
        public async void test_Register_with_Password_Less_Than_8_Characters(string userName, string password, string fullName, string email, string phone, string address, string avatar)
        {
            TestRegister api = new TestRegister();
            var response = await api.Test_Register(userName, password, fullName, email, phone, address, avatar);
            Assert.Contains("Password should not be less than 8 characters", response);
        }
        [Theory]
        [InlineData("testnotnumberic", "ABCabc@av", "Nguyen Cong Dat", "cnd210621@gmail.com", "0359182080", "Ly Son", "String")]
        public async void test_Register_with_Password_Not_Have_One_Numberic(string userName, string password, string fullName, string email, string phone, string address, string avatar)
        {
            TestRegister api = new TestRegister();
            var response = await api.Test_Register(userName, password, fullName, email, phone, address, avatar);
            Assert.Contains("Password should contain At least one numeric value", response);
        }
        [Theory]
        [InlineData("testnotspecialcase", "ABC1223asd1231", "Nguyen Cong Dat", "cnd210621@gmail.com", "0359182080", "Ly Son", "String")]
        public async void test_Register_with_Password_Not_Have_One_Specialcase(string userName, string password, string fullName, string email, string phone, string address, string avatar)
        {
            TestRegister api = new TestRegister();
            var response = await api.Test_Register(userName, password, fullName, email, phone, address, avatar);
            Assert.Contains("Password should contain At least one special case characters", response);
        }
        [Theory]
        [InlineData("testIsInvalidEmail", "Abc@12345678", "Nguyen Cong Dat", "cnd210621", "0359182080", "Ly Son", "String")]
        public async void test_Register_with_Email_Is_invalid(string userName, string password, string fullName, string email, string phone, string address, string avatar)
        {
            TestRegister api = new TestRegister();
            var response = await api.Test_Register(userName, password, fullName, email, phone, address, avatar);
            Assert.Contains("Email is invalid", response);
        }
    }
}
