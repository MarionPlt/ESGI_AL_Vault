using MediatR;

namespace Library.Application.Context.UsersItems.DeleteUserItem;

public class DeleteUserItemCommand : IRequest
{
    public DeleteUserItemCommand(Guid userItemId)
    {
        UserItemId = userItemId;
    }

    public Guid UserItemId { get; }
}
