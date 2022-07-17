using Library.Infrastructure.Entities;
using Library.Infrastructure.Specifications;
using Library.Infrastructure.Specifications.Items;

namespace Library.Application.Context.Items.GetAllItems.Filters
{
    public class BaseFilterComponent : FilterComponent
    {
        public override Specification<Item> ApplySpecs()
        {
            return new ItemSpecification();
        }
    }
}
