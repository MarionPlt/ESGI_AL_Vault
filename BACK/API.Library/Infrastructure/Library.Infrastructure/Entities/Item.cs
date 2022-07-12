using Library.Infrastructure.Entities.Base;
using Library.Infrastructure.Entities.Enumerations;

namespace Library.Infrastructure.Entities;

/// <summary>
///     An existing item that a user can add to its collections.
/// </summary>
public class Item : Entity
{
    public Item(string label, DateTime releaseDate, string? support, string? imageURL)
    {
        Label = label;
        ReleaseDate = releaseDate;
        Support = support;
        ImageURL = imageURL;
    }

    /// <summary>
    ///     Label of the item.
    /// </summary>
    public string Label { get; set; }

    /// <summary>
    ///     Type of item.
    /// </summary>
    public ItemType Type { get; set; }

    /// <summary>
    ///     Release date of the item.
    /// </summary>
    public DateTime ReleaseDate { get; set; }

    /// <summary>
    ///     Support of the item (physical, digital, etc...)
    /// </summary>
    public string? Support { get; set; }

    /// <summary>
    ///     URL to an image of the item.
    /// </summary>
    public string? ImageURL { get; set; }

    public List<UserItem> UserItems { get; set; } = default!;
}
