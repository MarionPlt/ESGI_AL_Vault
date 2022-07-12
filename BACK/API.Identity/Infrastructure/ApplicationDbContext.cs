using System.Runtime.CompilerServices;
using Microsoft.EntityFrameworkCore;

namespace API.Identity.Infrastructure
{
    public class ApplicationDbContext : DbContext
    {
        public ApplicationDbContext(DbContextOptions options) : base(options)
        {

        }

        public DbSet<AuthUser> AuthUsers { get; set; } = default!;

        protected override void OnModelCreating(ModelBuilder modelBuilder)
        {
            modelBuilder.Entity<AuthUser>().ToTable("AuthUsers");
            modelBuilder.Entity<AuthUser>().HasKey(u => u.Id);
            modelBuilder.Entity<AuthUser>().HasIndex(u => u.UserName).IsUnique();
            modelBuilder.Entity<AuthUser>().Property(u => u.Password).IsRequired().HasMaxLength(100);
            modelBuilder.Entity<AuthUser>().Property(u => u.LastConnection).IsRequired();
        }
    }
}
