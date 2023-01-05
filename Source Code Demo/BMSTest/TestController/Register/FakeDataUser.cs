using BMS.Models;
using Bogus;
using System.Collections;
using System.Collections.Generic;

namespace BMSTest.TestController
{
    public class FakeDataUser : IEnumerable<User>
    {
        private readonly Faker<User> faker = new Faker<User>()
            .RuleFor(u => u.UserName, f => f.Name.LastName())
            .RuleFor(u => u.Password, f => f.Lorem.Word())
            .RuleFor(u => u.FullName, f => f.Name.FullName())
            .RuleFor(u => u.Email, f => f.Internet.Email())
            .RuleFor(u => u.Phone, f => f.Phone.PhoneNumber())
            .RuleFor(u => u.Address, f => f.Name.FullName());

        public IEnumerator<User> GetEnumerator()
        {
            yield return this.faker.Generate();
        }

        IEnumerator IEnumerable.GetEnumerator()
        {
            return this.GetEnumerator();
        }
    }
}
