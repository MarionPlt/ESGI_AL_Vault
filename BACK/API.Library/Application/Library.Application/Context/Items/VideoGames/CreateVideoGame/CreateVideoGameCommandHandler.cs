using Library.API.Models.Results.Items;
using Library.Infrastructure;
using Library.Infrastructure.Entities.Items;
using MediatR;

namespace Library.Application.Context.Items.VideoGames.CreateVideoGame;

public class CreateVideoGameCommandHandler : IRequestHandler<CreateVideoGameCommand, VideoGameResult>
{
    private readonly ApplicationDbContext _dbContext;

    public CreateVideoGameCommandHandler(ApplicationDbContext dbContext)
    {
        _dbContext = dbContext;
    }

    public async Task<VideoGameResult> Handle(CreateVideoGameCommand request, CancellationToken cancellationToken)
    {
        var videoGame = new VideoGame(request.Label, request.ReleaseDate, request.Support, request.ImageURL,
            request.Platform);

        _dbContext.VideoGames.Add(videoGame);
        await _dbContext.SaveChangesAsync(cancellationToken);

        return new VideoGameResult(videoGame);
    }
}
