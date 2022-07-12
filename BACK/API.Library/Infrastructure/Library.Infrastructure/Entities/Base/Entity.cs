namespace Library.Infrastructure.Entities.Base;

/// <summary>
///     Database entity with a Guid ID.
/// </summary>
public class Entity : IEntity
{
    /// <summary>
    ///     Entity identification.
    /// </summary>
    public Guid Id { get; set; }
}
