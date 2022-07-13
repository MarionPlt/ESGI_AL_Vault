namespace API.Identity.Infrastructure
{
    public class AuthUser
    {
        public Guid Id { get; set; }
        public string UserName { get; set; }
        public string Password { get; set; }
        public DateTime LastConnection { get; set; } = DateTime.Now;

        public AuthUser(string userName, string password)
        {
            UserName = userName;
            Password = password;
        }
    }
}
