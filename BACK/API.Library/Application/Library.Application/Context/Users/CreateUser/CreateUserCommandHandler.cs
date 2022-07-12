using Library.Infrastructure;
using Library.Infrastructure.Entities;
using MediatR;

namespace Library.Application.Context.Users.CreateUser;

public class CreateUserCommandHandler : IRequestHandler<CreateUserCommand, Guid>
{
    private readonly ApplicationDbContext _dbContext;

    public CreateUserCommandHandler(ApplicationDbContext dbContext)
    {
        _dbContext = dbContext;
    }

    public async Task<Guid> Handle(CreateUserCommand request, CancellationToken cancellationToken)
    {
        var user = new User(request.UserName);

        if (request.Id.HasValue)
        {
            user.Id = request.Id.Value;
        }

        _dbContext.Users.Add(user);
        await _dbContext.SaveChangesAsync(cancellationToken);

        return user.Id;
    }
}
