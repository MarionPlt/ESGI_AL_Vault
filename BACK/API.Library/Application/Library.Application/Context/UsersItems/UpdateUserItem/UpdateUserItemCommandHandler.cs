using Library.API.Models.Results;
using Library.API.Models.Results.UserItems;
using Library.Infrastructure;
using Library.Infrastructure.Entities.Enumerations;
using Library.Infrastructure.Exceptions;
using MediatR;
using Microsoft.EntityFrameworkCore;

namespace Library.Application.Context.UsersItems.UpdateUserItem;

public class UpdateUserItemCommandHandler : IRequestHandler<UpdateUserItemCommand, UserItemResult>
{
    private readonly ApplicationDbContext _dbContext;

    public UpdateUserItemCommandHandler(ApplicationDbContext dbContext)
    {
        _dbContext = dbContext;
    }

    public async Task<UserItemResult> Handle(UpdateUserItemCommand request, CancellationToken cancellationToken)
    {
        var userItem = await _dbContext.UserItems
            .Include(ui => ui.Item)
            .SingleOrDefaultAsync(ui => ui.Id == request.UserItemId, cancellationToken);

        if (userItem == null)
        {
            throw new EntityNotFoundException("User item of ID " + request.UserItemId + " not found.");
        }

        userItem.AcquisitionDate = request.AcquisitionDate;
        userItem.Collection = request.Collection;
        userItem.State = request.State;

        _dbContext.Update(userItem);
        await _dbContext.SaveChangesAsync(cancellationToken);

        return userItem.Item.Type switch
        {
            ItemType.Book => new UserBookResult(userItem),
            ItemType.Movie => new UserMovieResult(userItem),
            ItemType.VideoGame => new UserVideoGameResult(userItem),
            _ => new SimpleUserItemResult(userItem)
        };
    }
}
