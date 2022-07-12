using Library.API.Models.Results;
using MediatR;

namespace Library.Application.Context.UsersItems.GetUserItem;

public class GetUserItemQuery : IRequest<UserItemResult>
{
    public GetUserItemQuery(Guid userItemId)
    {
        UserItemId = userItemId;
    }

    public Guid UserItemId { get; }
}
