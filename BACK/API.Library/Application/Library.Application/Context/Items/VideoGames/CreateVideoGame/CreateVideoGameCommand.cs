using Library.API.Models.DTOs.Items;
using Library.API.Models.Results.Items;
using MediatR;

namespace Library.Application.Context.Items.VideoGames.CreateVideoGame;

public class CreateVideoGameCommand : ItemCommand, IRequest<VideoGameResult>
{
    public CreateVideoGameCommand(VideoGameDTO videoGameDto) : base(videoGameDto)
    {
        Platform = videoGameDto.Platform;
    }

    public string Platform { get; }
}
