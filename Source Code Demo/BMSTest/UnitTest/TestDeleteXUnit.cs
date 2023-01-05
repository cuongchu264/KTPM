using BMSTest.TestController.DeleteUser;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Xunit;

namespace BMSTest.UnitTest
{
    public class TestDeleteXUnit
    {
        [Theory]
        [InlineData(34)]
        public async void test_Delete_Success(int id)
        {
            TestDeleteUser api = new TestDeleteUser();
            var response = await api.Test_Delete(id);
            if (response != "")
            {
                Assert.Contains("Not Found", response);
            }
            else
            {
                Assert.Contains("No Content", response);
            }
        }
    }
}
