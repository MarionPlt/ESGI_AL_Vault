namespace API.Identity.Controllers.DTOs
{
    public class LoginDTO
    {
        public string UserName { get; set; } = default!;
        public string Password { get; set; } = default!;
    }
}
