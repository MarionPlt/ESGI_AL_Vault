using System;
using System.Linq;
using System.Threading;
using System.Threading.Tasks;
using Library.Application.Context.Users.CreateUser;
using Library.Tests.Common;
using Xunit;

namespace Library.Tests.Users
{
    [Collection("NonParallelizable")]
    public class CreateUserCommandHandlerTests : IClassFixture<LibraryTestDatabaseFixture>
    {
        public CreateUserCommandHandlerTests(LibraryTestDatabaseFixture fixture)
            => Fixture = fixture;

        public LibraryTestDatabaseFixture Fixture { get; }

        [Fact]
        public async Task CreateUserCommand_add_a_user_to_database_async()
        {
            using var context = Fixture.CreateContext();
            context.Database.BeginTransaction();

            var command = new CreateUserCommand(new(new Guid(), "Jean"));

            var handler = new CreateUserCommandHandler(context);

            await handler.Handle(command, new CancellationToken());

            context.ChangeTracker.Clear();

            Assert.True(context.Users.Any(
                u => u.UserName == command.UserName));
        }
    }
}
