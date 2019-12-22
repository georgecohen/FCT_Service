using FCT_Service.Helpers;
using FCT_Service.Models;
using Microsoft.Extensions.Options;
using Microsoft.IdentityModel.Tokens;
using System;
using System.IdentityModel.Tokens.Jwt;
using System.Linq;
using System.Security.Claims;
using System.Text;

namespace FCT_Service.Services
{
    public interface IUserService
    {
        Customer Authenticate(string username, string password);
    }

    public class UserService : IUserService
    {
        private readonly AppSettings _appSettings;
        private readonly FctContext _context;

        public UserService(IOptions<AppSettings> appSettings, FctContext context)
        {
            _appSettings = appSettings.Value;
            _context = context;
        }

        public Customer Authenticate(string email, string password)
        {
            // var user = _users.SingleOrDefault(x => x.Email == email && x.Password == password);
            var user = _context.Customers.SingleOrDefault(x => x.Email == email && x.Password == password);


            // return null if user not found
            if (user == null)
                return null;

            // authentication successful so generate jwt token
            var tokenHandler = new JwtSecurityTokenHandler();
            var key = Encoding.ASCII.GetBytes(_appSettings.Secret);
            var tokenDescriptor = new SecurityTokenDescriptor
            {
                Subject = new ClaimsIdentity(new Claim[]
                {
                    new Claim(ClaimTypes.Name, user.ID.ToString())
                }),
                Expires = DateTime.UtcNow.AddDays(7),
                SigningCredentials = new SigningCredentials(new SymmetricSecurityKey(key), SecurityAlgorithms.HmacSha256Signature)
            };
            var token = tokenHandler.CreateToken(tokenDescriptor);
            user.Token = tokenHandler.WriteToken(token);

            return user.WithoutPassword();
        }

    }
}

