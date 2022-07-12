using Library.Infrastructure.Entities.Items;

namespace Library.API.Models.Results.Items;

public class VideoGameResult : ItemResult
{
    public VideoGameResult(VideoGame videoGame) : base(videoGame)
    {
        Platform = videoGame.Platform;
    }

    public string Platform { get; set; }
}
