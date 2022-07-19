using Library.Infrastructure;
using Library.Infrastructure.Exceptions;
using MediatR;
using Microsoft.EntityFrameworkCore;

namespace Library.Application.Context.UsersItems.DeleteUserItem;

public class DeleteUserItemCommandHandler : IRequestHandler<DeleteUserItemCommand>
{
    private readonly ApplicationDbContext _dbContext;

    public DeleteUserItemCommandHandler(ApplicationDbContext dbContext)
    {
        _dbContext = dbContext;
    }

    public async Task<Unit> Handle(DeleteUserItemCommand request, CancellationToken cancellationToken)
    {
        var userItem = await _dbContext.UserItems.SingleOrDefaultAsync(ui => ui.Id == request.UserItemId);

        if (userItem == null)
        {
            throw new EntityNotFoundException("User item of ID " + request.UserItemId + " nout found.");
        }

        _dbContext.Remove(userItem);
        await _dbContext.SaveChangesAsync(cancellationToken);

        return Unit.Value;
    }
}
