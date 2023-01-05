using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using BMS.Models;
using BMS.Order;

namespace BMS.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class CartDetailsController : ControllerBase
    {
        private readonly SneakerShopDbContext _context;

        public CartDetailsController(SneakerShopDbContext context)
        {
            _context = context;
        }

        // GET: api/CartDetails
        [HttpGet]
        public async Task<ActionResult<IEnumerable<CartDetail>>> GetCartDetails()
        {
            return await _context.CartDetails.ToListAsync();
        }

        // GET: api/CartDetails/5
        [HttpGet("{id}")]
        public async Task<ActionResult<CartDetail>> GetCartDetail(int id)
        {
            var cartDetail = await _context.CartDetails.FindAsync(id);

            if (cartDetail == null)
            {
                return NotFound();
            }

            return cartDetail;
        }
        
        
        //TOP 5 best seller
        [HttpGet("FlagshipProduct")]
        public async Task<ActionResult<IEnumerable<CartDetail>>> GetFlagshipProduct()
        {
            var query = (from p in _context.Products
                         let tong = (from cd in _context.CartDetails
                                     join b in _context.Bills on cd.BillId equals b.BillId
                                     where cd.ProductId == p.ProductId
                                     select cd.Quantity).Sum()
                         where tong > 0
                         orderby tong descending
                         select new
                         {
                             p.ProductId,
                             p.ProductName,
                             p.Avatar,
                             p.Price,
                             Quantity = tong
                         }).Take(6).ToListAsync();
            return Ok(await query);
        }

        //SEARCH DATA 
        [HttpGet("SearchBill")]
        public async Task<ActionResult<IEnumerable<CartDetail>>> SearchCartDetail([FromQuery] string BillId)
        {
            int tmp;
            tmp = int.Parse(BillId);
            var data2 = from p in _context.CartDetails
                        where (p.BillId == tmp)
                        select (p);
            return await data2.ToListAsync();
        }

        // PUT: api/CartDetails/5
        // To protect from overposting attacks, see https://go.microsoft.com/fwlink/?linkid=2123754
        [HttpPut("{id}")]
        public async Task<IActionResult> PutCartDetail(int id, CartDetail cartDetail)
        {
            if (id != cartDetail.CartDetailId)
            {
                return BadRequest();
            }

            _context.Entry(cartDetail).State = EntityState.Modified;

            try
            {
                await _context.SaveChangesAsync();
            }
            catch (DbUpdateConcurrencyException)
            {
                if (!CartDetailExists(id))
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

        // POST: api/CartDetails
        // To protect from overposting attacks, see https://go.microsoft.com/fwlink/?linkid=2123754
        [HttpPost]
        public async Task<ActionResult<CartDetail>> PostCartDetail(CartDetail cartDetail)
        {
            _context.CartDetails.Add(cartDetail);
            await _context.SaveChangesAsync();

            return CreatedAtAction("GetCartDetail", new { id = cartDetail.CartDetailId }, cartDetail);
        }

        // DELETE: api/CartDetails/5
        [HttpDelete("{id}")]
        public async Task<IActionResult> DeleteCartDetail(int id)
        {
            var cartDetail = await _context.CartDetails.FindAsync(id);
            if (cartDetail == null)
            {
                return NotFound();
            }

            _context.CartDetails.Remove(cartDetail);
            await _context.SaveChangesAsync();

            return NoContent();
        }

        private bool CartDetailExists(int id)
        {
            return _context.CartDetails.Any(e => e.CartDetailId == id);
        }
    }
}
