using Library.API.Models.Results.UserItems;
using Library.Infrastructure;
using MediatR;
using Microsoft.EntityFrameworkCore;

namespace Library.Application.Context.UsersItems.GetUserItems;

public class GetUserItemsQueryHandler : IRequestHandler<GetUserItemsQuery, IEnumerable<SimpleUserItemResult>>
{
    private readonly ApplicationDbContext _dbContext;

    public GetUserItemsQueryHandler(ApplicationDbContext dbContext)
    {
        _dbContext = dbContext;
    }

    public async Task<IEnumerable<SimpleUserItemResult>> Handle(GetUserItemsQuery request,
        CancellationToken cancellationToken)
    {
        var userItems =
            await _dbContext.UserItems
                .Include(ui => ui.Item)
                .Where(ui => ui.UserId == request.UserId)
                .ToListAsync(cancellationToken);

        return userItems.Select(ui => new SimpleUserItemResult(ui));
    }
}
