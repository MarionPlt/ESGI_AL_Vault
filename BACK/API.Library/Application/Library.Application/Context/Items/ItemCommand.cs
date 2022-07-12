using Library.API.Models.DTOs;
using Library.Infrastructure.Entities.Enumerations;

namespace Library.Application.Context.Items;

/// <summary>
///     Item creation command class.
/// </summary>
public class ItemCommand
{
    public ItemCommand(ItemDTO dto)
    {
        Label = dto.Label;

        if (!Enum.TryParse<ItemType>(dto.Type, out var itemType))
        {
            throw new InvalidCastException();
        }

        Type = itemType;
        ReleaseDate = dto.ReleaseDate;
        Support = dto.Support;
        ImageURL = dto.ImageURL;
    }

    /// <summary>
    ///     Label of the item.
    /// </summary>
    public string Label { get; }

    /// <summary>
    ///     Type of item.
    /// </summary>
    public ItemType Type { get; }

    /// <summary>
    ///     Release date of the item.
    /// </summary>
    public DateTime ReleaseDate { get; }

    /// <summary>
    ///     Support of the item (physical, digital, etc...)
    /// </summary>
    public string? Support { get; }

    /// <summary>
    ///     URL to an image of the item.
    /// </summary>
    public string? ImageURL { get; }
}
