using System;
using System.Linq;
using System.Threading;
using System.Threading.Tasks;
using Library.Application.Context.Items.Books.CreateBook;
using Library.Infrastructure.Entities.Enumerations;
using Library.Tests.Common;
using Xunit;

namespace Library.Tests.Items.Books
{
    [Collection("NonParallelizable")]
    public class CreateBookCommandHandlerTests : IClassFixture<LibraryTestDatabaseFixture>
    {
        public CreateBookCommandHandlerTests(LibraryTestDatabaseFixture fixture)
            => Fixture = fixture;

        public LibraryTestDatabaseFixture Fixture { get; }

        [Fact]
        public async Task CreateBookCommand_add_a_book_to_database_async()
        {
            using var context = Fixture.CreateContext();
            context.Database.BeginTransaction();

            var command = new CreateBookCommand(new()
            {
                Label = "Dune",
                Type = "Book",
                ReleaseDate = new DateTime(1965, 01, 01),
                Support = "physical",
                ImageURL = "http://localhost/image",
                Authors = "	Frank Herbert",
                Editor = "Chilton Books",
                Volume = 1
            });

            var handler = new CreateBookCommandHandler(context);

            await handler.Handle(command, new CancellationToken());

            context.ChangeTracker.Clear();

            Assert.True(context.Books.Any(
                b => b.Label == command.Label
                && b.Type == ItemType.Book
                && b.ReleaseDate == command.ReleaseDate
                && b.Support == command.Support
                && b.ImageURL == command.ImageURL
                && b.Authors == command.Authors
                && b.Editor == command.Editor
                && b.Volume == command.Volume));
        }
    }
}
