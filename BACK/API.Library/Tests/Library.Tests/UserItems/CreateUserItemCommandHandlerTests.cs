using System;
using System.Linq;
using System.Threading;
using System.Threading.Tasks;
using Library.Application.Context.UsersItems.CreateUserItem;
using Library.Infrastructure;
using Library.Tests.Common;
using Xunit;

namespace Library.Tests.UserItems
{
    [Collection("NonParallelizable")]
    public class CreateUserItemCommandHandlerTests : IClassFixture<LibraryTestDatabaseFixture>
    {
        public CreateUserItemCommandHandlerTests(LibraryTestDatabaseFixture fixture)
            => Fixture = fixture;

        public LibraryTestDatabaseFixture Fixture { get; }

        [Fact]
        public async Task CreateUserItemCommand_add_a_userItem_to_database_async()
        {
            using var context = Fixture.CreateContext();
            context.Database.BeginTransaction();

            SeedDatabase(context);

            var user = context.Users.First();
            var item = context.VideoGames.First();

            var command = new CreateUserItemCommand(user.Id, item.Id, new()
            {
                AcquisitionDate = new DateTime(2012, 03, 15),
                State = "FieldTested",
                Collection = null
            });

            var handler = new CreateUserItemCommandHandler(context);

            await handler.Handle(command, new CancellationToken());

            context.ChangeTracker.Clear();

            Assert.True(context.UserItems.Any(
                ui => ui.ItemId == command.ItemId
                && ui.UserId == command.UserId
                && ui.AcquisitionDate == command.AcquisitionDate
                && ui.State == command.State
                && ui.Collection == command.Collection));
        }

        private void SeedDatabase(ApplicationDbContext context)
        {
            context.Users.Add(new("Jean"));
            context.VideoGames.Add(new("Dune", new DateTime(1992, 01, 01), "physical", "http://localhost/image", "MS-DOS"));
            context.SaveChanges();
        }
    }
}
