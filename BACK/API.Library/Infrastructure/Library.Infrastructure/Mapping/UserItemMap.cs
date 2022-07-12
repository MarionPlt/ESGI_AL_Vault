using Library.Infrastructure.Entities;
using Microsoft.EntityFrameworkCore.Metadata.Builders;

namespace Library.Infrastructure.Mapping;

public class UserItemMap : BaseConfiguration<UserItem, Guid>
{
    public override void Configure(EntityTypeBuilder<UserItem> builder)
    {
        builder.Property(ui => ui.State).HasConversion<string>();

        builder.HasOne(ui => ui.User).WithMany(u => u.UserItems).HasForeignKey(ui => ui.UserId);

        builder.HasOne(ui => ui.Item).WithMany(i => i.UserItems).HasForeignKey(ui => ui.ItemId);
    }
}
