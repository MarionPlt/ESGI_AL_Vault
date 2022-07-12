using Library.Infrastructure;
using Library.Infrastructure.Entities;
using Library.Infrastructure.Exceptions;
using MediatR;
using Microsoft.EntityFrameworkCore;

namespace Library.Application.Context.UsersItems.CreateUserItem;

public class CreateUserItemCommandHandler : IRequestHandler<CreateUserItemCommand, Guid>
{
    private readonly ApplicationDbContext _dbContext;

    public CreateUserItemCommandHandler(ApplicationDbContext dbContext)
    {
        _dbContext = dbContext;
    }

    public async Task<Guid> Handle(CreateUserItemCommand request, CancellationToken cancellationToken)
    {
        var user = await _dbContext.Users.SingleOrDefaultAsync(u => u.Id == request.UserId, cancellationToken);

        if (user == null)
        {
            throw new EntityNotFoundException("User of ID " + request.UserId + " not found.");
        }

        var item = await _dbContext.Items.SingleOrDefaultAsync(i => i.Id == request.ItemId, cancellationToken);

        if (item == null)
        {
            throw new EntityNotFoundException("Item of ID " + request.ItemId + " not found.");
        }

        var userItem = new UserItem(user.Id, item.Id, request.AcquisitionDate, request.State, request.Collection);

        _dbContext.UserItems.Add(userItem);
        await _dbContext.SaveChangesAsync(cancellationToken);

        return userItem.Id;
    }
}
