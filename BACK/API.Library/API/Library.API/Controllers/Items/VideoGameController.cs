using Library.API.Models.DTOs.Items;
using Library.API.Models.Results.Items;
using Library.Application.Context.Items.VideoGames.CreateVideoGame;
using MediatR;
using Microsoft.AspNetCore.Mvc;

namespace Library.API.Controllers.Items;

[ApiController]
[Route("[controller]")]
public class VideoGameController : ControllerBase
{
    private readonly IMediator _mediator;

    public VideoGameController(IMediator mediator)
    {
        _mediator = mediator;
    }

    [HttpPost]
    public async Task<ActionResult<VideoGameResult>> CreateVideoGame([FromBody] VideoGameDTO videoGameDto)
    {
        var command = new CreateVideoGameCommand(videoGameDto);

        var result = await _mediator.Send(command);

        return CreatedAtAction(nameof(CreateVideoGame), result);
    }
}
