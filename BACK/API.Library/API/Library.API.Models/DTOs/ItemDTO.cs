namespace Library.API.Models.DTOs;

public class ItemDTO
{
    /// <summary>
    ///     Label of the item.
    /// </summary>
    public string Label { get; set; }

    /// <summary>
    ///     Type of item.
    /// </summary>
    public string Type { get; set; }

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
}
