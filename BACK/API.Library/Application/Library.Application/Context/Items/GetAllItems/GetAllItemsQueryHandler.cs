using Library.API.Models.Results;
using Library.Infrastructure;
using MediatR;
using Microsoft.EntityFrameworkCore;

namespace Library.Application.Context.Items.GetAllItems;

public class GetAllItemsQueryHandler : IRequestHandler<GetAllItemsQuery, IEnumerable<ItemResult>>
{
    private readonly ApplicationDbContext _dbContext;

    public GetAllItemsQueryHandler(ApplicationDbContext dbContext)
    {
        _dbContext = dbContext;
    }

    public async Task<IEnumerable<ItemResult>> Handle(GetAllItemsQuery request, CancellationToken cancellationToken)
    {
        var items = await _dbContext.Items.ToListAsync(cancellationToken);
        return items.Select(i => new ItemResult(i));
    }
}
