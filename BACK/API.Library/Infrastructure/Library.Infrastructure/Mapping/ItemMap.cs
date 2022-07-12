using Library.Infrastructure.Entities;
using Microsoft.EntityFrameworkCore.Metadata.Builders;

namespace Library.Infrastructure.Mapping;

public class ItemMap : BaseConfiguration<Item, Guid>
{
    public override void Configure(EntityTypeBuilder<Item> builder)
    {
        builder.Property(i => i.Type).HasConversion<string>();
    }
}
