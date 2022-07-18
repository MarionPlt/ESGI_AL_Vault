using Library.API.Models.Results.Items;
using Library.Infrastructure;
using Library.Infrastructure.Entities.Items;
using Library.Infrastructure.Exceptions;
using MediatR;
using Microsoft.EntityFrameworkCore;

namespace Library.Application.Context.Items.Books.CreateBook
{
    public class CreateBookCommandHandler : IRequestHandler<CreateBookCommand, BookResult>
    {
        private readonly ApplicationDbContext _dbContext;

        public CreateBookCommandHandler(ApplicationDbContext dbContext)
        {
            _dbContext = dbContext;
        }

        public async Task<BookResult> Handle(CreateBookCommand request, CancellationToken cancellationToken)
        {
            var book = new Book(request.Label, request.ReleaseDate, request.Support, request.ImageURL, request.Editor,
                request.Authors, request.Volume);

            var anyDuplicatedBook = 
                await _dbContext.Books
                    .Where(b => b.Label.ToLower() == book.Label && b.ReleaseDate == book.ReleaseDate && b.Volume == book.Volume)
                    .AnyAsync(cancellationToken);
            if (anyDuplicatedBook)
            {
                throw new DataConflictException("Ce livre existe déjà.");
            }

            _dbContext.Books.Add(book);
            await _dbContext.SaveChangesAsync(cancellationToken);

            return new BookResult(book);
        }
    }
}
