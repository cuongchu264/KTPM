using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using BMS.Models;
using BMS.News;

namespace BMS.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class NewsController : ControllerBase
    {
        private readonly SneakerShopDbContext _context;

        public NewsController(SneakerShopDbContext context)
        {
            _context = context;
        }

        // GET: api/News
        [HttpGet]
        public async Task<ActionResult<IEnumerable<New>>> GetNews()
        {
            return await _context.News.ToListAsync();
        }

        // GET: api/News/5
        [HttpGet("{id}")]
        public async Task<ActionResult<New>> GetNew(int id)
        {
            var @new = await _context.News.FindAsync(id);

            if (@new == null)
            {
                return NotFound();
            }

            return @new;
        }

        // GET Hot Products vid CategoryId and Position
        [HttpGet("viaNewCate")]
        public async Task<ActionResult<IEnumerable<New>>> GetNewviaCate([FromQuery] string NewCategoryId)
        {
            int tmp;
            tmp = int.Parse(NewCategoryId);
            var data = from p in _context.News
                       where (p.NewCategory == tmp)
                       select (p);
            return await data.ToListAsync();
        }

        // PUT: api/News/5
        // To protect from overposting attacks, see https://go.microsoft.com/fwlink/?linkid=2123754
        [HttpPut("{id}")]
        public async Task<IActionResult> PutNew(int id, New @new)
        {
            if (id != @new.NewId)
            {
                return BadRequest();
            }

            _context.Entry(@new).State = EntityState.Modified;

            try
            {
                await _context.SaveChangesAsync();
            }
            catch (DbUpdateConcurrencyException)
            {
                if (!NewExists(id))
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

        // POST: api/News
        // To protect from overposting attacks, see https://go.microsoft.com/fwlink/?linkid=2123754
        [HttpPost]
        public async Task<ActionResult<New>> PostNew(New news)
        {
            if (news.NewTitle == "" || news.NewTitle == null)
            {
                return BadRequest(new { state = "Title is required!" }); ;
            }
            else if (news.NewComment == "" || news.NewComment == null)
            {
                return BadRequest(new { state = "Comment is required!" }); ;
            }
            else if (news.NewImg == "" || news.NewImg == null)
            {
                return BadRequest(new { state = "Image is required!" }); ;
            }
            else if (news.NewLink == "" || news.NewLink == null)
            {
                return BadRequest(new { state = "Link is required!" }); ;
            }
            else if (news.NewCategory == 0)
            {
                return BadRequest(new { state = "New category ID is required!" }); ;
            }
            else if (news.NewCategory < 0)
            {
                return BadRequest(new { state = "Invalid New Category ID!" }); ;
            }
            else if (news.NewCategoryName == "" || news.NewCategoryName == null)
            {
                return BadRequest(new { state = "New category name is required!" }); ;
            }
            _context.News.Add(news);
            await _context.SaveChangesAsync();

            return CreatedAtAction("GetNew", new { id = news.NewId }, news);
        }

        // DELETE: api/News/5
        [HttpDelete("{id}")]
        public async Task<IActionResult> DeleteNew(int id)
        {
            var @new = await _context.News.FindAsync(id);
            if (@new == null)
            {
                return NotFound();
            }

            _context.News.Remove(@new);
            await _context.SaveChangesAsync();

            return NoContent();
        }

        private bool NewExists(int id)
        {
            return _context.News.Any(e => e.NewId == id);
        }
    }
}
