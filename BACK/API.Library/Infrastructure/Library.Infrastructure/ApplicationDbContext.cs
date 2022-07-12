using System.Reflection;
using Library.Infrastructure.Entities;
using Library.Infrastructure.Entities.Items;
using Microsoft.EntityFrameworkCore;

namespace Library.Infrastructure;

public class ApplicationDbContext : DbContext
{
    public ApplicationDbContext(DbContextOptions options)
        : base(options)
    {
    }

    public DbSet<User> Users { get; set; } = default!;

    public DbSet<Item> Items { get; set; } = default!;

    public DbSet<UserItem> UserItems { get; set; } = default!;

    public DbSet<Book> Books { get; set; } = default!;

    public DbSet<VideoGame> VideoGames { get; set; } = default!;

    public DbSet<Movie> Movies { get; set; } = default!;

    protected override void OnModelCreating(ModelBuilder modelBuilder)
    {
        modelBuilder.ApplyConfigurationsFromAssembly(Assembly.GetExecutingAssembly());
    }
}