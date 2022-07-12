using Library.Infrastructure.Entities.Base;
using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Metadata.Builders;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Library.Infrastructure.Mapping;

public abstract class BaseConfiguration<TEntity, TKey> : IEntityTypeConfiguration<TEntity>
    where TEntity : class, IEntity
{
    void IEntityTypeConfiguration<TEntity>.Configure(EntityTypeBuilder<TEntity> builder)
    {
        builder.HasKey(x => x.Id);

        Configure(builder);
    }

    public  abstract void Configure(EntityTypeBuilder<TEntity> builder);
}
