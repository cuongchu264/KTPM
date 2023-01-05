using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using Microsoft.IdentityModel.Tokens;
using RestSharp;
using BMS.IService;
using BMS.Models;
using System;
using System.Collections.Generic;
using System.IdentityModel.Tokens.Jwt;
using System.Linq;
using System.Security.Claims;
using System.Text;
using System.Threading.Tasks;

// For more information on enabling Web API for empty projects, visit https://go.microsoft.com/fwlink/?LinkID=397860

namespace BMS.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class AccountController : ControllerBase
    {
        private readonly SneakerShopDbContext _context;

        IUserService _userService = null;
        public AccountController(IUserService userService, SneakerShopDbContext context)
        {
            _userService = userService;
            _context = context;
        }
        // GET: api/<AccountController>
        [HttpGet]
        public List<User> GetAllUser()
        {
            return _userService.GetAllUsers();
        }

        //Get Info via UserName
        [HttpGet("viaUserName")]
        public async Task<ActionResult<IEnumerable<User>>> GetInfoViaUserName([FromQuery] string UserName)
        {
            var data = from p in _context.Users
                       where (p.UserName == UserName)
                       select (p);
            return await data.ToListAsync();
        }

        //Get User via MonthCreate
        [HttpGet("viaMonthCreate")]
        public async Task<ActionResult<IEnumerable<User>>> GetUserViaMonthCreate([FromQuery] string Month)
        {
            int tmp;
            tmp = int.Parse(Month);
            var data = from p in _context.Users
                       where p.DayCreated.Value.Month == tmp
                       select (p);
            return await data.ToListAsync();
        }

        // GET Account vid sort and pagination
        [HttpGet("viaSortingAndPagination")]
        public async Task<ActionResult<IEnumerable<User>>> GetAccountviaSortingandPagination([FromQuery] AccountPaginator filter)
        {
            var paginator = new AccountPaginator(filter.Page_size, filter.Current_page, filter.Sort);
            if (filter.Sort == "userId")
            {
                var data = from p in _context.Users
                           orderby p.UserId ascending
                           select (p);
                return await data
                    .Skip((paginator.Current_page - 1) * paginator.Page_size)
                    .Take(paginator.Page_size).ToListAsync();
            }
            if (filter.Sort == "-userId")
            {
                var data = from p in _context.Users
                           orderby p.UserId descending
                           select (p);
                return await data
                    .Skip((paginator.Current_page - 1) * paginator.Page_size)
                    .Take(paginator.Page_size).ToListAsync();
            }
            if (filter.Sort == "userName")
            {
                var data = from p in _context.Users
                           orderby p.UserName ascending
                           select (p);
                return await data
                    .Skip((paginator.Current_page - 1) * paginator.Page_size)
                    .Take(paginator.Page_size).ToListAsync();
            }
            if (filter.Sort == "-userName")
            {
                var data = from p in _context.Users
                           orderby p.UserName descending
                           select (p);
                return await data
                    .Skip((paginator.Current_page - 1) * paginator.Page_size)
                    .Take(paginator.Page_size).ToListAsync();
            }

            return BadRequest();
        }


        // POST api/<AccountController>
        [HttpPost]
        public async Task<ActionResult<User>> Signup(User user)
        {
            var tmp = _context.Users.FirstOrDefault(x => x.UserName == user.UserName);
            if (tmp == null)
            {
                if (user.UserName == null || user.UserName == "")
                {
                    return BadRequest(new { state = "Username is required!" }); ;
                }
                if (user.Password == null || user.Password == "")
                {
                    return BadRequest(new { state = "Password is required!" }); ;
                }
                if (user.FullName == null || user.FullName == "")
                {
                    return BadRequest(new { state = "FullName is required!" }); ;
                }
                if (user.Email == null || user.Email == "")
                {
                    return BadRequest(new { state = "Email is required!" }); ;
                }
                if (user.Phone == null || user.Phone == "")
                {
                    return BadRequest(new { state = "Phone is required!" }); ;
                }
                if (user.Address == null || user.Address == "")
                {
                    return BadRequest(new { state = "Address is required!" }); ;
                }
                return await _userService.Signup(user);
            }
            return BadRequest(new { state = "This account is already in use, please try another one" });
        }

        [HttpPost("login")]
        public IActionResult Login([FromBody] UserLoginModel model)
        {
            var user = _userService.Login(model);
            if(user!=null)
            {
                string secret = "g2sL6RLQh6dVRSSnCRjvEqP971-V2DGpFoUleIfKrIc";
                string iss = "dcaea177e8d14f1fb863059dde75ca3b";
                string audience = "Sneaker Shop";

                var singinKey = new SymmetricSecurityKey(Encoding.ASCII.GetBytes(secret));

                var claims = new List<Claim>()
                {
                    new Claim(ClaimTypes.Name, model.UserName),
                    new Claim(ClaimTypes.NameIdentifier, model.UserName),
                    new Claim("Title", "This is User of BMS"),
                };

                var jwt = new JwtSecurityToken(
                    issuer: iss,
                    audience: audience,
                    claims: claims,
                    notBefore: DateTime.UtcNow,
                    expires: DateTime.UtcNow.AddSeconds(60 * 60),
                    signingCredentials: new SigningCredentials(singinKey, SecurityAlgorithms.HmacSha256)
                    );
                var jwtToken = new JwtSecurityTokenHandler().WriteToken(jwt);

                return Ok(new
                {
                    access_token = jwtToken,
                    expires = DateTime.UtcNow.AddSeconds(60 * 60),
                    name = model.UserName
                });
            }
            return BadRequest(new { state = "invalid username or password" });
        }

        // GET: api/Users/5
        [HttpGet("{id}")]
        public async Task<ActionResult<User>> GetUser(int id)
        {
            var user = await _context.Users.FindAsync(id);

            if (user == null)
            {
                return NotFound();
            }

            return user;
        }

        // PUT: api/Users/5
        // To protect from overposting attacks, see https://go.microsoft.com/fwlink/?linkid=2123754
        [HttpPut("{id}")]
        public async Task<IActionResult> PutUser(int id, User user)
        {
            if (id != user.UserId)
            {
                return BadRequest();
            }

            _context.Entry(user).State = EntityState.Modified;

            try
            {
                await _context.SaveChangesAsync();
            }
            catch (DbUpdateConcurrencyException)
            {
                if (!UserExists(id))
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

        private bool UserExists(int id)
        {
            return _context.Users.Any(e => e.UserId == id);
        }

        // DELETE: api/Users/5
        [HttpDelete("{id}")]
        public async Task<IActionResult> DeleteUser(int id)
        {
            var user = await _context.Users.FindAsync(id);
            if (user == null)
            {

                return NotFound();
            }

            _context.Users.Remove(user);
            await _context.SaveChangesAsync();
            return NoContent();
        }

    }
}
