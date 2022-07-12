using Library.Infrastructure.Entities;
using Library.Infrastructure.Entities.Enumerations;

namespace Library.API.Models.Results;

public class UserItemResult
{
    public UserItemResult(UserItem userItem)
    {
        Id = userItem.Id;
        AcquisitionDate = userItem.AcquisitionDate;
        State = userItem.State;
        Collection = userItem.Collection;
        Item = new ItemResult(userItem.Item);
    }

    public Guid Id { get; set; }

    /// <summary>
    ///     Acquisition date of the item.
    /// </summary>
    public DateTime AcquisitionDate { get; set; }

    /// <summary>
    ///     Quality state of the possessed item.
    /// </summary>
    public UserItemState State { get; set; }

    public string? Collection { get; set; }

    public ItemResult? Item { get; set; }
}
