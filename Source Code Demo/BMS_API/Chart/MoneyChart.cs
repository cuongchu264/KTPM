using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Threading.Tasks;

namespace BMS.Chart
{
    public class MoneyChart
    {
        [Key]
        public int MoneyChartId { get; set; }
        public string MoneyChartMonth { get; set; }
        public int ChartSumOfMoney { get; set; }
    }
}