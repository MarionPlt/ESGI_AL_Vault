using Library.Infrastructure.Entities.Items;
using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Metadata.Builders;

namespace Library.Infrastructure.Mapping.Items;

public class VideoGameMap : IEntityTypeConfiguration<VideoGame>
{
    public void Configure(EntityTypeBuilder<VideoGame> builder)
    {
        builder.ToTable("VideoGames");
    }
}
