using System;
using System.Linq;
using System.Threading;
using System.Threading.Tasks;
using Library.Application.Context.Items.Movies.CreateMovie;
using Library.Infrastructure.Entities.Enumerations;
using Library.Tests.Common;
using Xunit;

namespace Library.Tests.Items.Movies
{
    [Collection("NonParallelizable")]
    public class CreateMovieCommandHandlerTests : IClassFixture<LibraryTestDatabaseFixture>
    {
        public CreateMovieCommandHandlerTests(LibraryTestDatabaseFixture fixture)
            => Fixture = fixture;

        public LibraryTestDatabaseFixture Fixture { get; }

        [Fact]
        public async Task CreateMovieCommand_add_a_movie_to_database_async()
        {
            using var context = Fixture.CreateContext();
            context.Database.BeginTransaction();

            var command = new CreateMovieCommand(new()
            {
                Label = "Dune",
                Type = "Movie",
                ReleaseDate = new DateTime(1985, 02, 06),
                Support = "physical",
                ImageURL = "http://localhost/image",
                Director = "David Lynch",
                Editor = ""
            });

            var handler = new CreateMovieCommandHandler(context);

            await handler.Handle(command, new CancellationToken());

            context.ChangeTracker.Clear();

            Assert.True(context.Movies.Any(
                b => b.Label == command.Label
                && b.Type == ItemType.Movie
                && b.ReleaseDate == command.ReleaseDate
                && b.Support == command.Support
                && b.ImageURL == command.ImageURL
                && b.Editor == command.Editor
                && b.Director == command.Director));
        }
    }
}
