using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Threading.Tasks;

namespace BMS.Models
{
    public class Product
    {
        [Key]
        public int ProductId { get; set; }
        public string ProductName { get; set; }
        public int CategoryId { get; set; }
        public double Price { get; set; }
        public string Avatar { get; set; }
        public string Description { get; set; }
        public int InStocks { get; set; }
        public string Img1 { get; set; }

        public double totalPrice = 0;
        public void PriceAdd(double total)
        {
            Price += Price + total;
        }

        public void TotalPrice(double price)
        {
            totalPrice += price;
        }
        public void InStocksProduct(int instock)
        {
            InStocks = InStocks - instock;
        }
    }
    //Fake Database
}
