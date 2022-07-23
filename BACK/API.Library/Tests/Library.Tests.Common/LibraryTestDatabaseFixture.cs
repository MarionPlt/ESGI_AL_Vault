using Library.Infrastructure;
using Microsoft.EntityFrameworkCore;
using Microsoft.Extensions.Configuration;
using Xunit.Abstractions;

namespace Library.Tests.Common
{
    public class LibraryTestDatabaseFixture
    {
        private string ConnectionString;

        private static readonly object _lock = new();
        private static bool _databaseInitialized;

        public LibraryTestDatabaseFixture()
        {
            ConnectionString = Configuration.ConnectionString;

            Console.WriteLine("ConnectionString: " + ConnectionString);

            lock (_lock)
            {
                if (!_databaseInitialized)
                {
                    using (var context = CreateContext())
                    {
                        context.Database.EnsureDeleted();
                        context.Database.EnsureCreated();

                        context.SaveChanges();
                    }

                    _databaseInitialized = true;
                }
            }
        }

        public ApplicationDbContext CreateContext()
            => new(
                new DbContextOptionsBuilder<ApplicationDbContext>()
                    .UseSqlServer(ConnectionString)
                    .Options);

        public async Task CleanupAsync()
        {
            using var context = CreateContext();

            context.Books.RemoveRange(context.Books);
            context.Movies.RemoveRange(context.Movies);
            context.VideoGames.RemoveRange(context.VideoGames);

            await context.SaveChangesAsync();
        }
    }
}

