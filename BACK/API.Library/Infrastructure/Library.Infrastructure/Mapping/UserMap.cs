using Library.Infrastructure.Entities;
using Microsoft.EntityFrameworkCore.Metadata.Builders;

namespace Library.Infrastructure.Mapping;

public class UserMap : BaseConfiguration<User, Guid>
{
    public override void Configure(EntityTypeBuilder<User> builder)
    {
        builder.Property(u => u.UserName).HasMaxLength(100);
        builder.HasIndex(u => u.UserName).IsUnique();
    }
}
