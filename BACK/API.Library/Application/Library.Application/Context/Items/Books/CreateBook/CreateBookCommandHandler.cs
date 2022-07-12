using Library.Infrastructure;
using Library.Infrastructure.Entities.Items;
using MediatR;

namespace Library.Application.Context.Items.Books.CreateBook;

public class CreateBookCommandHandler : IRequestHandler<CreateBookCommand, Guid>
{
    private readonly ApplicationDbContext _dbContext;

    public CreateBookCommandHandler(ApplicationDbContext dbContext)
    {
        _dbContext = dbContext;
    }

    public async Task<Guid> Handle(CreateBookCommand request, CancellationToken cancellationToken)
    {
        var book = new Book(request.Label, request.ReleaseDate, request.Support, request.ImageURL, request.Editor,
            request.Authors, request.Volume);

        _dbContext.Books.Add(book);
        await _dbContext.SaveChangesAsync(cancellationToken);

        return book.Id;
    }
}
