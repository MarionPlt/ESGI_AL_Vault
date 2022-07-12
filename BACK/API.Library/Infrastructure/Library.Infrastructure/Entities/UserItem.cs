using Library.Infrastructure.Entities.Base;
using Library.Infrastructure.Entities.Enumerations;

namespace Library.Infrastructure.Entities;

/// <summary>
/// Item belonging to a user.
/// </summary>
public class UserItem : Entity
{
    /// <summary>
    /// Acquisition date of the item.
    /// </summary>
    public DateTime AcquisitionDate { get; set; }

    /// <summary>
    /// Quality state of the possessed item.
    /// </summary>
    public UserItemState State { get; set; }

    public string? Collection { get; set; } 

    /// <summary>
    /// Related user ID.
    /// </summary>
    public Guid UserId { get; set; }

    /// <summary>
    /// Related item ID.
    /// </summary>
    public Guid ItemId { get; set; }

    /// <summary>
    /// User navigation property.
    /// </summary>
    public User User { get; set; } = default!;

    /// <summary>
    /// Item navigation property.
    /// </summary>
    public Item Item { get; set; } = default!;

    public UserItem(Guid userId, Guid itemId, DateTime acquisitionDate, UserItemState state, string? collection)
    {
        UserId = userId;
        ItemId = itemId;
        AcquisitionDate = acquisitionDate;
        State = state;
        Collection = collection;
    }
}