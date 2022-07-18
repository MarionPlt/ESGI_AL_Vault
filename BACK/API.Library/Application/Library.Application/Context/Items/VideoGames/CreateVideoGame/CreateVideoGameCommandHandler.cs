using Library.API.Models.Results.Items;
using Library.Infrastructure;
using Library.Infrastructure.Entities.Items;
using Library.Infrastructure.Exceptions;
using MediatR;
using Microsoft.EntityFrameworkCore;

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

        var anyDuplicatedBook =
            await _dbContext.VideoGames
                .Where(vg => vg.Label.ToLower() == videoGame.Label && vg.ReleaseDate == videoGame.ReleaseDate && vg.Platform == videoGame.Platform)
                .AnyAsync(cancellationToken);

        if (anyDuplicatedBook)
        {
            throw new DataConflictException("Ce film existe déjà.");
        }

        _dbContext.VideoGames.Add(videoGame);
        await _dbContext.SaveChangesAsync(cancellationToken);

        return new VideoGameResult(videoGame);
    }
}
