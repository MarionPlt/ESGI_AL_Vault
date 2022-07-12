using Library.API.Models.DTOs;
using Library.API.Models.Results;
using Library.Application.Context.UsersItems.CreateUserItem;
using Library.Application.Context.UsersItems.GetUserItem;
using Library.Application.Context.UsersItems.GetUserItems;
using Library.Application.Context.UsersItems.UpdateUserItem;
using MediatR;
using Microsoft.AspNetCore.Mvc;

namespace Library.API.Controllers;

[ApiController]
[Route("[controller]")]
public class UserItemController : ControllerBase
{
    private readonly IMediator _mediator;

    public UserItemController(IMediator mediator)
    {
        _mediator = mediator;
    }

    [HttpPost("user/{userId:guid}/item/{itemId:guid}")]
    public async Task<ActionResult<Guid>> CreateUserItem([FromRoute] Guid userId, [FromRoute] Guid itemId,
        [FromBody] UserItemDTO userItemDTO)
    {
        var command = new CreateUserItemCommand(userId, itemId, userItemDTO);

        var result = await _mediator.Send(command);

        return CreatedAtAction(nameof(CreateUserItem), result);
    }

    [HttpGet("user/{userId:guid}")]
    public async Task<ActionResult<UserItemResult>> GetUserItems([FromRoute] Guid userId)
    {
        var query = new GetUserItemsQuery(userId);

        var result = await _mediator.Send(query);

        return Ok(result);
    }

    [HttpGet("{userItemId:guid}")]
    public async Task<ActionResult<UserItemResult>> GetUserItem([FromRoute] Guid userItemId)
    {
        var query = new GetUserItemQuery(userItemId);

        var result = await _mediator.Send(query);

        return Ok(result);
    }

    [HttpPut("{userItemId:guid}")]
    public async Task<ActionResult<UserItemResult>> UpdateUserItem([FromRoute] Guid userItemId,
        [FromBody] UserItemDTO userItemDTO)
    {
        var command = new UpdateUserItemCommand(userItemId, userItemDTO);

        var result = await _mediator.Send(command);

        return Ok(result);
    }
}
