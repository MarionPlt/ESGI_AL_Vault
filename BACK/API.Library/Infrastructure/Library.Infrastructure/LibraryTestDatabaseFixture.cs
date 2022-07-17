using Library.Infrastructure;
using Microsoft.EntityFrameworkCore;

namespace Library.Tests
{
    public class LibraryTestDatabaseFixture
    {
        private const string ConnectionString = @"Server=(localdb)\mssqllocaldb;Database=test_vault_library;Trusted_Connection=True";

        private static readonly object _lock = new();
        private static bool _databaseInitialized;

        public LibraryTestDatabaseFixture()
        {
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

        public void Cleanup()
        {
            using var context = CreateContext();

            context.Books.RemoveRange(context.Books);
            context.Movies.RemoveRange(context.Movies);
            context.VideoGames.RemoveRange(context.VideoGames);

            context.SaveChanges();
        }
    }
}

