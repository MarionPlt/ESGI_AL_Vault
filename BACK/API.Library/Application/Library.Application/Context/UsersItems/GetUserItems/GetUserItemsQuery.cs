using Library.API.Models.Results;
using MediatR;

namespace Library.Application.Context.UsersItems.GetUserItems;

public class GetUserItemsQuery : IRequest<IEnumerable<UserItemResult>>
{
    public GetUserItemsQuery(Guid userId)
    {
        UserId = userId;
    }

    public Guid UserId { get; }
}
