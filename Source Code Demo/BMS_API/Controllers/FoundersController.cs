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
    public class FoundersController : ControllerBase
    {
        private readonly SneakerShopDbContext _context;

        public FoundersController(SneakerShopDbContext context)
        {
            _context = context;
        }

        // GET: api/Founders
        [HttpGet]
        public async Task<ActionResult<IEnumerable<Founder>>> GetFounders()
        {
            return await _context.Founders.ToListAsync();
        }

        // GET: api/Founders/5
        [HttpGet("{id}")]
        public async Task<ActionResult<Founder>> GetFounder(int id)
        {
            var founder = await _context.Founders.FindAsync(id);

            if (founder == null)
            {
                return NotFound();
            }

            return founder;
        }

        // PUT: api/Founders/5
        // To protect from overposting attacks, see https://go.microsoft.com/fwlink/?linkid=2123754
        [HttpPut("{id}")]
        public async Task<IActionResult> PutFounder(int id, Founder founder)
        {
            if (id != founder.FounderId)
            {
                return BadRequest();
            }

            _context.Entry(founder).State = EntityState.Modified;

            try
            {
                await _context.SaveChangesAsync();
            }
            catch (DbUpdateConcurrencyException)
            {
                if (!FounderExists(id))
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

        // POST: api/Founders
        // To protect from overposting attacks, see https://go.microsoft.com/fwlink/?linkid=2123754
        [HttpPost]
        public async Task<ActionResult<Founder>> PostFounder(Founder founder)
        {
            _context.Founders.Add(founder);
            await _context.SaveChangesAsync();

            return CreatedAtAction("GetFounder", new { id = founder.FounderId }, founder);
        }

        // DELETE: api/Founders/5
        [HttpDelete("{id}")]
        public async Task<IActionResult> DeleteFounder(int id)
        {
            var founder = await _context.Founders.FindAsync(id);
            if (founder == null)
            {
                return NotFound();
            }

            _context.Founders.Remove(founder);
            await _context.SaveChangesAsync();

            return NoContent();
        }

        private bool FounderExists(int id)
        {
            return _context.Founders.Any(e => e.FounderId == id);
        }
    }
}
