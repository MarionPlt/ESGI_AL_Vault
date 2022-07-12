using Library.API.Models.DTOs.Items;
using Library.Application.Context.Items.Books.CreateBook;
using MediatR;
using Microsoft.AspNetCore.Mvc;

namespace Library.API.Controllers.Items;

[ApiController]
[Route("[controller]")]
public class BookController : ControllerBase
{
    private readonly IMediator _mediator;

    public BookController(IMediator mediator)
    {
        _mediator = mediator;
    }

    [HttpPost]
    public async Task<ActionResult<Guid>> CreateBook([FromBody] BookDTO bookDTO)
    {
        var command = new CreateBookCommand(bookDTO);

        var result = await _mediator.Send(command);

        return Ok(result);
    }
}
