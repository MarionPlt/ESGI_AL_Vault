namespace Library.API.Models.DTOs;

/// <summary>
///     A data object representing an user.
/// </summary>
public class UserDTO
{
    public UserDTO(Guid? id, string userName)
    {
        Id = id;
        UserName = userName;
    }

    /// <summary>
    ///     The user ID.
    /// </summary>
    public Guid? Id { get; }

    /// <summary>
    ///     The user name.
    /// </summary>
    public string UserName { get; }
}
