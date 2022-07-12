using Library.API.Models.Results;
using Library.Application.Context.Items.GetAllItems;
using Library.Application.Context.Items.GetItem;
using MediatR;
using Microsoft.AspNetCore.Mvc;

namespace Library.API.Controllers;

[ApiController]
[Route("[controller]")]
public class ItemController : ControllerBase
{
    private readonly IMediator _mediator;

    public ItemController(IMediator mediator)
    {
        _mediator = mediator;
    }

    [HttpGet("{itemId:guid}")]
    public async Task<ActionResult<ItemResult>> GetItem([FromRoute] Guid itemId)
    {
        var query = new GetItemQuery(itemId);

        var result = await _mediator.Send(query);

        return Ok(result);
    }

    [HttpGet]
    public async Task<ActionResult<IEnumerable<ItemResult>>> GetAllItems()
    {
        var query = new GetAllItemsQuery();

        var result = await _mediator.Send(query);

        return Ok(result);
    }
}
