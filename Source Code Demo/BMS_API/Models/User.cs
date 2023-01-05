using Bogus;
using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Threading.Tasks;

namespace BMS.Models
{
    public class User
    {
        [Key]
        public int UserId { get; set; }
        public String UserName { get; set; }
        public String Password { get; set; }
        public String FullName { get; set; }
        public String Email { get; set; }
        public String Phone { get; set; }
        public String Address { get; set; }
        public String Avatar { get; set; }
        public User()
        {
            DayCreated = DateTime.Now;
        }
        public DateTime? DayCreated { get; set;}
        
        //Fake Data 
        public static Faker<User> FakeData { get;} =
            new Faker<User>()
            .RuleFor(u => u.UserName, f => f.Name.LastName())
            .RuleFor(u => u.Password, f => f.Lorem.Word())
            .RuleFor(u => u.FullName, f => f.Name.FullName())
            .RuleFor(u => u.Email, f => f.Internet.Email())
            .RuleFor(u => u.Phone, f => f.Phone.PhoneNumber())
            .RuleFor(u => u.Address, f => f.Name.FullName());

    }
}
