using Library.Infrastructure.Entities;
using Library.Infrastructure.Specifications;

namespace Library.Application.Context.Items.GetAllItems.Filters
{
    public abstract class FilterComponent
    {
        public abstract Specification<Item> ApplySpecs();
    }
}
