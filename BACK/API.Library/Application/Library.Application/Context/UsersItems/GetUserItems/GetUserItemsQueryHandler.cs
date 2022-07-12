using Library.API.Models.Results;
using Library.Infrastructure;
using MediatR;
using Microsoft.EntityFrameworkCore;

namespace Library.Application.Context.UsersItems.GetUserItems;

public class GetUserItemsQueryHandler : IRequestHandler<GetUserItemsQuery, IEnumerable<UserItemResult>>
{
    private readonly ApplicationDbContext _dbContext;

    public GetUserItemsQueryHandler(ApplicationDbContext dbContext)
    {
        _dbContext = dbContext;
    }

    public async Task<IEnumerable<UserItemResult>> Handle(GetUserItemsQuery request,
        CancellationToken cancellationToken)
    {
        var userItems =
            await _dbContext.UserItems
                .Include(ui => ui.Item)
                .Where(ui => ui.UserId == request.UserId)
                .ToListAsync(cancellationToken);

        return userItems.Select(ui => new UserItemResult(ui));
    }
}
