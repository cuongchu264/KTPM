using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Threading.Tasks;

namespace BMS.Models
{
    public class AdminLoginModel
    {
        [Required]
        public string Username { get; set; }
        [Required]
        public string Password { get; set; }
        public void Account(string name, string mk)
        {
            Username = name;
            Password = mk;
        }
    }
}
