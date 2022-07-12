namespace API.Identity.Infrastructure
{
    public class AuthUser
    {
        public Guid Id { get; set; }
        public string UserName { get; set; }
        public string Password { get; set; }
        public DateTime LastConnection { get; set; } = DateTime.Now;

        public AuthUser(Guid id, string userName, string password)
        {
            Id = id;
            UserName = userName;
            Password = password;
        }
    }
}
