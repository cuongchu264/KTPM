using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using System.Linq;
using System.Threading.Tasks;

namespace BMS.Order
{
    public class Bill
    {
        [Key]
        public int BillId { get; set; }
        public string CustomerName { get; set; }
        public string UserName { get; set; }
        public string Phone { get; set;}
        public string Address { get; set; }
        public Bill()
        {
            DayOrder = DateTime.Now;
        }
        public DateTime? DayOrder { get; set; }
        public double Total { get; set; }
        public string Status { get; set; }
    }
}
