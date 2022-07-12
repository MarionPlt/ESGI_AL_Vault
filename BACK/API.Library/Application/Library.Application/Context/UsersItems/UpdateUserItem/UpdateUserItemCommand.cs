using Library.API.Models.DTOs;
using Library.API.Models.Results;
using MediatR;

namespace Library.Application.Context.UsersItems.UpdateUserItem;

public class UpdateUserItemCommand : UserItemCommand, IRequest<UserItemResult>
{
    public UpdateUserItemCommand(Guid userItemId, UserItemDTO userItemDTO) : base(userItemDTO)
    {
        UserItemId = userItemId;
    }

    public Guid UserItemId { get; }
}
