using Library.API.Models.Results;
using MediatR;

namespace Library.Application.Context.Items.GetItem;

public class GetItemQuery : IRequest<ItemResult>
{
    public GetItemQuery(Guid itemId)
    {
        ItemId = itemId;
    }

    public Guid ItemId { get; }
}
