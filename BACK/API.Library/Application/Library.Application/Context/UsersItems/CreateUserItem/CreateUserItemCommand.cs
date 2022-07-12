using Library.API.Models.DTOs;
using MediatR;

namespace Library.Application.Context.UsersItems.CreateUserItem;

public class CreateUserItemCommand : UserItemCommand, IRequest<Guid>
{
    public CreateUserItemCommand(Guid userId, Guid itemId, UserItemDTO userItemDto) : base(userItemDto)
    {
        ItemId = itemId;
        UserId = userId;
    }

    public Guid ItemId { get; }

    public Guid UserId { get; }
}
