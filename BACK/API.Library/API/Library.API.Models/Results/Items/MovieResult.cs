using Library.Infrastructure.Entities.Items;

namespace Library.API.Models.Results.Items;

public class MovieResult : ItemResult
{
    public MovieResult(Movie movie) : base(movie)
    {
        Director = movie.Director;
        Editor = movie.Editor;
    }

    public string Director { get; set; }
    public string Editor { get; set; }
}
