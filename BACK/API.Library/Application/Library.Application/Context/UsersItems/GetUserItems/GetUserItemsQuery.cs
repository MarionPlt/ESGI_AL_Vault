using Library.API.Models.Results.UserItems;
using MediatR;

namespace Library.Application.Context.UsersItems.GetUserItems;

public class GetUserItemsQuery : IRequest<IEnumerable<SimpleUserItemResult>>
{
    public GetUserItemsQuery(Guid userId)
    {
        UserId = userId;
    }

    public Guid UserId { get; }
}
