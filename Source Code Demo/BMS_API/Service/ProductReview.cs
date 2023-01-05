using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Threading.Tasks;

namespace BMS.Service
{
    public class ProductReview
    {
        [Key]
        public int ProductReviewId { get; set; }
        public string CustomerName { get; set; }
        public int Star { get; set; }
        public string Content { get; set; }
        public int ProductId { get; set; }
    }
}
