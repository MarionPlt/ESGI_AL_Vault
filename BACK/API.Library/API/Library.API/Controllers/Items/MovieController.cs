using Library.API.Models.DTOs.Items;
using Library.API.Models.Results.Items;
using Library.Application.Context.Items.Movies.CreateMovie;
using MediatR;
using Microsoft.AspNetCore.Mvc;

namespace Library.API.Controllers.Items;

[ApiController]
[Route("[controller]")]
public class MovieController : ControllerBase
{
    private readonly IMediator _mediator;

    public MovieController(IMediator mediator)
    {
        _mediator = mediator;
    }

    [HttpPost]
    public async Task<ActionResult<MovieResult>> CreateMovie([FromBody] MovieDTO movieDTO)
    {
        var command = new CreateMovieCommand(movieDTO);

        var result = await _mediator.Send(command);

        return CreatedAtAction(nameof(CreateMovie), result);
    }
}
