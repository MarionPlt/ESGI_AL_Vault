using Library.API.Models.Results;
using MediatR;

namespace Library.Application.Context.Items.GetAllItems;

public class GetAllItemsQuery : IRequest<IEnumerable<ItemResult>>
{
}
