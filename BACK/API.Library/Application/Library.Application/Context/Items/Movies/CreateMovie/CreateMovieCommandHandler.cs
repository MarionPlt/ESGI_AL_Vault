using Library.API.Models.Results.Items;
using Library.Infrastructure;
using Library.Infrastructure.Entities.Items;
using MediatR;

namespace Library.Application.Context.Items.Movies.CreateMovie;

public class CreateMovieCommandHandler : IRequestHandler<CreateMovieCommand, MovieResult>
{
    private readonly ApplicationDbContext _dbContext;

    public CreateMovieCommandHandler(ApplicationDbContext dbContext)
    {
        _dbContext = dbContext;
    }

    public async Task<MovieResult> Handle(CreateMovieCommand request, CancellationToken cancellationToken)
    {
        var movie = new Movie(request.Label, request.ReleaseDate, request.Support, request.ImageURL,
            request.Director,
            request.Editor);

        _dbContext.Add(movie);
        await _dbContext.SaveChangesAsync(cancellationToken);

        return new MovieResult(movie);
    }
}
