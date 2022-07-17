using Library.Infrastructure.Entities;
using Library.Infrastructure.Specifications;

namespace Library.Application.Context.Items.GetAllItems.Filters
{
    public class FilterDecorator : FilterComponent
    {
        protected FilterComponent Component;

        public FilterDecorator(FilterComponent component)
        {
            Component = component;
        }

        public override Specification<Item> ApplySpecs()
        {
            return Component.ApplySpecs();
        }
    }
}
