using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Threading.Tasks;

namespace BMS.Chart
{
    public class UserChart
    {
        [Key]
        public int USerChartId { get; set; }
        public string UserChartMonth { get; set; }
        public int ChartSumOfUSer { get; set; }
    }
}
