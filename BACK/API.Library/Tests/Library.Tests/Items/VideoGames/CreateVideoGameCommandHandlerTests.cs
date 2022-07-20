using System;
using System.Linq;
using System.Threading;
using System.Threading.Tasks;
using Library.Application.Context.Items.VideoGames.CreateVideoGame;
using Library.Infrastructure.Entities.Enumerations;
using Library.Tests.Common;
using Xunit;

namespace Library.Tests.Items.VideoGames
{
    [Collection("NonParallelizable")]
    public class CreateVideoGameCommandHandlerTests : IClassFixture<LibraryTestDatabaseFixture>
    {
        public CreateVideoGameCommandHandlerTests(LibraryTestDatabaseFixture fixture)
            => Fixture = fixture;

        public LibraryTestDatabaseFixture Fixture { get; }

        [Fact]
        public async Task CreateVideoGameCommand_add_a_videogame_to_database_async()
        {
            using var context = Fixture.CreateContext();
            context.Database.BeginTransaction();

            var command = new CreateVideoGameCommand(new()
            {
                Label = "Dune",
                Type = "VideoGame",
                ReleaseDate = new DateTime(1992, 01, 01),
                Support = "physical",
                ImageURL = "http://localhost/image",
                Platform = "MS-DOS",
            });

            var handler = new CreateVideoGameCommandHandler(context);

            await handler.Handle(command, new CancellationToken());

            context.ChangeTracker.Clear();

            Assert.True(context.VideoGames.Any(
                vg => vg.Label == command.Label
                && vg.Type == ItemType.VideoGame
                && vg.ReleaseDate == command.ReleaseDate
                && vg.Support == command.Support
                && vg.ImageURL == command.ImageURL
                && vg.Platform == command.Platform));
        }
    }
}
