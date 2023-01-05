using Microsoft.AspNetCore.Mvc;
using Microsoft.IdentityModel.Tokens;
using BMS.Common;
using BMS.IService;
using BMS.Models;
using System;
using System.Collections.Generic;
using System.IdentityModel.Tokens.Jwt;
using System.Linq;
using System.Security.Claims;
using System.Text;
using System.Threading.Tasks;
using System.Text.RegularExpressions;

namespace BMS.Service
{
    public class UserService : IUserService
    {
        private readonly SneakerShopDbContext _context;
        public UserService(SneakerShopDbContext context)
        {
            _context = context;
        }
        public List<User> GetAllUsers()
        {
            return _context.Users.ToList();
        }

        public UserLoginModel Login(UserLoginModel model)
        {
            var user = _context.Users.FirstOrDefault(x => x.UserName == model.UserName);
            if (user != null)
            {
                bool isValidPassword = BCrypt.Net.BCrypt.Verify(model.Password, user.Password);
                if (isValidPassword)
                {
                    return model;
                }
            }
            return null;
        }

        public async Task<ActionResult<User>> Signup(User user)
        {
            var hasNumber = new Regex(@"[0-9]+");
            var hasUpperChar = new Regex(@"[A-Z]+");
            var hasMiniMaxChars = new Regex(@".{8,15}");
            var hasLowerChar = new Regex(@"[a-z]+");
            var hasSymbols = new Regex(@"[!@#$%^&*()_+=\[{\]};:<>|./?,-]");

            if (!hasLowerChar.IsMatch(user.Password))
            {
                throw new Exception("Password should contain At least one lower case letter");
            }
            else if (!hasUpperChar.IsMatch(user.Password))
            {
                throw new Exception("Password should contain At least one upper case letter");
            }
            else if (!hasMiniMaxChars.IsMatch(user.Password))
            {
                throw new("Password should not be less than 8 characters");
            }
            else if (!hasNumber.IsMatch(user.Password))
            {
                throw new Exception("Password should contain At least one numeric value");
            }

            else if (!hasSymbols.IsMatch(user.Password))
            {
                throw new Exception("Password should contain At least one special case characters");
            }
            else if (!IsValidEmail(user.Email))
            {
                throw new Exception("Email is invalid");
            }
            else
            {
                user.Password = BCrypt.Net.BCrypt.HashPassword(user.Password);
                _context.Users.Add(user);
                await _context.SaveChangesAsync();
                return user;
            }
        }


        static bool IsValidEmail(string email)
        {
            var trimmedEmail = email.Trim();

            if (trimmedEmail.EndsWith("."))
            {
                return false; // suggested by @TK-421
            }
            try
            {
                var addr = new System.Net.Mail.MailAddress(email);
                return addr.Address == trimmedEmail;
            }
            catch
            {
                return false;
            }
        }
    }
}