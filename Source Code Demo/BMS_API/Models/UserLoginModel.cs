using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Threading.Tasks;

namespace BMS.Models
{
    public class UserLoginModel
    {
        [Required]
        public String UserName { get; set; }
        [Required]
        public String Password { get; set; }
    }
}
