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
    public class CarouselsController : ControllerBase
    {
        private readonly SneakerShopDbContext _context;

        public CarouselsController(SneakerShopDbContext context)
        {
            _context = context;
        }

        // GET: api/Carousels
        [HttpGet]
        public async Task<ActionResult<IEnumerable<Carousel>>> GetCarousels()
        {
            return await _context.Carousels.ToListAsync();
        }

        // GET: api/Carousels/5
        [HttpGet("{id}")]
        public async Task<ActionResult<Carousel>> GetCarousel(int id)
        {
            var carousel = await _context.Carousels.FindAsync(id);

            if (carousel == null)
            {
                return NotFound();
            }

            return carousel;
        }

        // PUT: api/Carousels/5
        // To protect from overposting attacks, see https://go.microsoft.com/fwlink/?linkid=2123754
        [HttpPut("{id}")]
        public async Task<IActionResult> PutCarousel(int id, Carousel carousel)
        {
            if (id != carousel.CarouselId)
            {
                return BadRequest();
            }

            _context.Entry(carousel).State = EntityState.Modified;

            try
            {
                await _context.SaveChangesAsync();
            }
            catch (DbUpdateConcurrencyException)
            {
                if (!CarouselExists(id))
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

        // POST: api/Carousels
        // To protect from overposting attacks, see https://go.microsoft.com/fwlink/?linkid=2123754
        [HttpPost]
        public async Task<ActionResult<Carousel>> PostCarousel(Carousel carousel)
        {
            _context.Carousels.Add(carousel);
            await _context.SaveChangesAsync();

            return CreatedAtAction("GetCarousel", new { id = carousel.CarouselId }, carousel);
        }

        // DELETE: api/Carousels/5
        [HttpDelete("{id}")]
        public async Task<IActionResult> DeleteCarousel(int id)
        {
            var carousel = await _context.Carousels.FindAsync(id);
            if (carousel == null)
            {
                return NotFound();
            }

            _context.Carousels.Remove(carousel);
            await _context.SaveChangesAsync();

            return NoContent();
        }

        private bool CarouselExists(int id)
        {
            return _context.Carousels.Any(e => e.CarouselId == id);
        }
    }
}
