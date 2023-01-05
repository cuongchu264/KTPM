using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using BMS.Models;

namespace BMS.Controllers
{
    [Route("api/[controller]")]
    [ApiController] 
    public class ProductsController : ControllerBase
    {
        private readonly SneakerShopDbContext _context;

        public ProductsController(SneakerShopDbContext context)
        {
            _context = context;
        }

        // GET: api/Products
        [HttpGet]
        public async Task<ActionResult<IEnumerable<Product>>> GetProducts()
        {
            return await _context.Products.ToListAsync();
        }

        // GET: api/Products/5
        [HttpGet("{id}")]
        public async Task<ActionResult<Product>> GetProduct(int id)
        {
            var product = await _context.Products.FindAsync(id);

            if (product == null)
            {
                return NotFound();
            }

            return product;
        }
        


        // GET Products vid CategoryId
        [HttpGet("viaCategoryId")]
        public async Task<ActionResult<IEnumerable<Product>>> GetProductviaCategoryId([FromQuery] string CategoryId)
        {
            int tmp;
            tmp = int.Parse(CategoryId);
            var data = from p in _context.Products
                       where (p.CategoryId == tmp)
                       select (p);
            return await data.ToListAsync();
        }



        //SEARCH DATA 
        [HttpGet("SearchProduct")]
        public async Task<ActionResult<IEnumerable<Product>>> SearchProduct([FromQuery] string text)
        {
            int tmp;
            try
            {
                tmp = int.Parse(text);
            }
            catch (Exception ex)
            {
                var data = from p in _context.Products
                           where (p.ProductName.Contains(text))
                           select (p);
                return await data.ToListAsync();
            }

            var data2 = from p in _context.Products
                        where ((p.ProductId == tmp) || (p.Price == tmp) || (p.ProductName.Contains(text)))
                        select (p);
            return await data2.ToListAsync();
        }


        // PUT: api/Products/5
        // To protect from overposting attacks, see https://go.microsoft.com/fwlink/?linkid=2123754
        [HttpPut("{id}")]
        public async Task<IActionResult> PutProduct(int id, Product product)
        {
            if (id != product.ProductId)
            {
                return BadRequest();
            }

            _context.Entry(product).State = EntityState.Modified;

            try
            {
                await _context.SaveChangesAsync();
            }
            catch (DbUpdateConcurrencyException)
            {
                if (!ProductExists(id))
                {
                    return NotFound();
                }
                else
                {
                    throw;
                }
            }

            return NoContent();
        }

       
        // POST: api/Products
        // To protect from overposting attacks, see https://go.microsoft.com/fwlink/?linkid=2123754
        [HttpPost]
        public async Task<ActionResult<Product>> PostProduct(Product product)
        {
            if (product.ProductName == "" || product.ProductName == null)
            {
                return BadRequest(new { state = "Product name is required!" }); ;
            }
            if (product.CategoryId == 0)
            {
                return BadRequest(new { state = "Category ID is required!" }); ;
            }
            else if (product.CategoryId < 0)
            {
                return BadRequest(new { state = "Invalid category ID!" }); ;
            }
            else if (product.Price == 0)
            {
                return BadRequest(new { state = "Price is required!" }); ;
            }
            else if (product.Price < 0)
            {
                return BadRequest(new { state = "Invalid price!" }); ;
            }
            else if (product.Avatar == "" || product.Avatar == null)
            {
                return BadRequest(new { state = "Avatar is required!" }); ;
            }
            else if (product.Description == "" || product.Description == null)
            {
                return BadRequest(new { state = "Description is required!" }); ;
            }
            else if (product.InStocks < 0)
            {
                return BadRequest(new { state = "Invalid Instocks!" }); ;
            }
            _context.Products.Add(product);
            await _context.SaveChangesAsync();

            return CreatedAtAction("GetProduct", new { id = product.ProductId }, product);
        }

        // DELETE: api/Products/5
        [HttpDelete("{id}")]
        public async Task<IActionResult> DeleteProduct(int id)
        {
            var product = await _context.Products.FindAsync(id);
            if (product == null)
            {
                return NotFound();
            }

            _context.Products.Remove(product);
            await _context.SaveChangesAsync();

            return NoContent();
        }

        private bool ProductExists(int id)
        {
            return _context.Products.Any(e => e.ProductId == id);
        }
    }
}
