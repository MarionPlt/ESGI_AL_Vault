using Library.API.Models.DTOs;
using Library.Application.Context.Users.CreateUser;
using MediatR;
using Microsoft.AspNetCore.Mvc;

namespace Library.API.Controllers;

[ApiController]
[Route("[controller]")]
public class UserController : ControllerBase
{
    private readonly IMediator _mediator;

    public UserController(IMediator mediator)
    {
        _mediator = mediator;
    }

    /// <summary>
    ///     Create a user.
    /// </summary>
    /// <param name="dto">The data object representing the user informations.</param>
    /// <returns>The ID of the created user.</returns>
    [HttpPost]
    public async Task<ActionResult<Guid>> CreateUser(UserDTO dto, CancellationToken cancellationToken)
    {
        var command = new CreateUserCommand(dto);
        var result = await _mediator.Send(command, cancellationToken);

        return Ok(result);
    }
}
