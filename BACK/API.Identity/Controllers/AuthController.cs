using API.Identity.Controllers.DTOs;
using API.Identity.Infrastructure;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;

namespace API.Identity.Controllers;

[ApiController]
[Route("[controller]")]
public class AuthController : ControllerBase
{
    private readonly ApplicationDbContext _dbContext;

    public AuthController(ApplicationDbContext dbContext)
    {
        _dbContext = dbContext;
    }

    [HttpPost("login")]
    public async Task<ActionResult<Guid>> Login([FromBody] LoginDTO loginDTO)
    {
        var user = await _dbContext.AuthUsers.SingleOrDefaultAsync(u =>
            u.UserName.ToLower() == loginDTO.UserName.ToLower() && u.Password == loginDTO.Password);

        if (user == null)
        {
            return Unauthorized();
        }

        user.LastConnection = DateTime.Now;

        await _dbContext.SaveChangesAsync();

        return Ok(user.Id);
    }
}