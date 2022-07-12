namespace Library.API.Models.DTOs.Items;

public class BookDTO : ItemDTO
{
    /// <summary>
    ///     Editor of the book.
    /// </summary>
    public string Editor { get; set; }

    /// <summary>
    ///     Author(s) of the book.
    /// </summary>
    public string Authors { get; set; }

    /// <summary>
    ///     Volume of the book.
    /// </summary>
    public int? Volume { get; set; }
}
