using Library.API.Models.DTOs;
using MediatR;

namespace Library.Application.Context.Users.CreateUser;

public class CreateUserCommand : IRequest<Guid>
{
    public CreateUserCommand(UserDTO dto)
    {
        Id = dto.Id;
        UserName = dto.UserName;
    }

    public Guid? Id { get; }

    public string UserName { get; }
}
