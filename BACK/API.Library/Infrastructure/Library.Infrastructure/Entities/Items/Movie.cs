using Library.Infrastructure.Entities.Enumerations;

namespace Library.Infrastructure.Entities.Items;

public class Movie : Item
{
    public Movie(string label, DateTime releaseDate, string? support, string? imageURL, string director,
        string editor) : base(label, releaseDate, support, imageURL)
    {
        Type = ItemType.Movie;
        Director = director;
        Editor = editor;
    }

    public string Director { get; set; }
    public string Editor { get; set; }
}
