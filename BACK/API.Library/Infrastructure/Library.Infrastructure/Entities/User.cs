using Library.Infrastructure.Entities.Base;

namespace Library.Infrastructure.Entities;

/// <summary>
///     User of the vault app.
/// </summary>
public class User : Entity
{
    public User(string userName)
    {
        UserName = userName;
    }

    /// <summary>
    ///     user's username.
    /// </summary>
    public string UserName { get; set; }

    public List<UserItem> UserItems { get; set; } = default!;

    public void Update(string userName)
    {
        UserName = userName;
    }
}
