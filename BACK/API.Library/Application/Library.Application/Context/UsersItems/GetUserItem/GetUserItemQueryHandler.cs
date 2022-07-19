using Library.API.Models.Results;
using Library.API.Models.Results.UserItems;
using Library.Infrastructure;
using Library.Infrastructure.Entities.Enumerations;
using Library.Infrastructure.Exceptions;
using MediatR;
using Microsoft.EntityFrameworkCore;

namespace Library.Application.Context.UsersItems.GetUserItem;

public class GetUserItemQueryHandler : IRequestHandler<GetUserItemQuery, UserItemResult>
{
    private readonly ApplicationDbContext _dbContext;

    public GetUserItemQueryHandler(ApplicationDbContext dbContext)
    {
        _dbContext = dbContext;
    }

    public async Task<UserItemResult> Handle(GetUserItemQuery request, CancellationToken cancellationToken)
    {
        var userItem =
            await _dbContext.UserItems
                .Include(ui => ui.Item)
                .SingleOrDefaultAsync(ui => ui.Id == request.UserItemId, cancellationToken);

        if (userItem == null)
        {
            throw new EntityNotFoundException("User item of ID " + request.UserItemId + " not found.");
        }

        return userItem.Item.Type switch
        {
            ItemType.Book => new UserBookResult(userItem),
            ItemType.VideoGame => new UserVideoGameResult(userItem),
            ItemType.Movie => new UserMovieResult(userItem),
            _ => new SimpleUserItemResult(userItem)
        };
    }
}
