using System;
using System.Linq;
using System.Threading;
using System.Threading.Tasks;
using Library.Application.Context.UsersItems.UpdateUserItem;
using Library.Infrastructure;
using Library.Infrastructure.Entities.Enumerations;
using Library.Tests.Common;
using Xunit;

namespace Library.Tests.UserItems
{
    [Collection("NonParallelizable")]
    public class UpdateUserItemCommandHandlerTests : IClassFixture<LibraryTestDatabaseFixture>
    {
        public UpdateUserItemCommandHandlerTests(LibraryTestDatabaseFixture fixture)
            => Fixture = fixture;

        public LibraryTestDatabaseFixture Fixture { get; }

        [Fact]
        public async Task UpdateUserItemCommand_update_respective_userItem_async()
        {
            using var context = Fixture.CreateContext();
            context.Database.BeginTransaction();

            SeedDatabase(context);

            var userItem = context.UserItems.First();

            var command = new UpdateUserItemCommand(userItem.Id, new()
            {
                AcquisitionDate = userItem.AcquisitionDate,
                State = UserItemState.WellWorn.ToString(),
                Collection = userItem.Collection
            });

            var handler = new UpdateUserItemCommandHandler(context);

            await handler.Handle(command, new CancellationToken());

            context.ChangeTracker.Clear();

            Assert.True(context.UserItems.Any(
                ui => ui.Id == userItem.Id
                && ui.AcquisitionDate == command.AcquisitionDate
                && ui.State == command.State
                && ui.Collection == command.Collection));
        }

        private void SeedDatabase(ApplicationDbContext context)
        {
            context.Users.Add(new("Jean"));
            context.VideoGames.Add(new("Dune", new DateTime(1992, 01, 01), "physical", "http://localhost/image", "MS-DOS"));
            context.SaveChanges();

            context.UserItems.Add(new(
                context.Users.Select(u => u.Id).First(),
                context.VideoGames.Select(vg => vg.Id).First(),
                new DateTime(2012, 03, 15),
                UserItemState.MinimalWear,
                null));

            context.SaveChanges();
        }
    }
}
