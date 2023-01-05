using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Threading.Tasks;

namespace BMS.Models
{
    public class Founder
    {
        [Key]
        public int FounderId { get; set; }
        public string FounderName { get; set; }
        public string FounderImg { get; set; }
        public string FounderComment { get; set; }
    }
}
