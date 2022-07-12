using Library.Infrastructure.Entities.Enumerations;

namespace Library.Infrastructure.Entities.Items;

public class VideoGame : Item
{
    public VideoGame(string label, DateTime releaseDate, string? support, string? imageURL, string platform)
        : base(label, releaseDate, support, imageURL)
    {
        Type = ItemType.VideoGame;
        Platform = platform;
    }

    public string Platform { get; set; }
}
