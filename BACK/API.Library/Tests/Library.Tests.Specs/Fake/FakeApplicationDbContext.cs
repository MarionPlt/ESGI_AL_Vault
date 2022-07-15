using Library.Infrastructure.Entities;
using Library.Infrastructure.Entities.Items;

namespace Library.Tests.Specs.Fake
{
    public class FakeApplicationDbContext
    {
        public FakeApplicationDbContext()
        {
        }

        public List<User> Users { get; set; } = new();

        public List<Item> Items { get; set; } = new();

        public List<UserItem> UserItems { get; set; } = new();

        public List<Book> Books { get; set; } = new();

        public List<VideoGame> VideoGames { get; set; } = new();

        public List<Movie> Movies { get; set; } = new();
    }
}
