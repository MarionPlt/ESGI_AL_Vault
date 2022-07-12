using Library.Infrastructure.Entities.Enumerations;

namespace Library.Infrastructure.Entities.Items;

public class Book : Item
{
    public Book(string label,
        DateTime releaseDate,
        string? support,
        string? imageURL,
        string editor,
        string authors,
        int? volume)
        : base(label, releaseDate, support, imageURL)
    {
        Type = ItemType.Book;
        Editor = editor;
        Authors = authors;
        Volume = volume;
    }

    public string Editor { get; set; }

    public string Authors { get; set; }

    public int? Volume { get; set; }
}
