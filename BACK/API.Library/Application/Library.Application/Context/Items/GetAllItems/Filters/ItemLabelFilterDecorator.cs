using Library.Infrastructure.Entities;
using Library.Infrastructure.Specifications;
using Library.Infrastructure.Specifications.Items;

namespace Library.Application.Context.Items.GetAllItems.Filters
{
    public class ItemLabelFilterDecorator : FilterDecorator
    {
        private readonly string _label;

        public ItemLabelFilterDecorator(FilterComponent component, string label) : base(component)
        {
            _label = label;
        }

        public override Specification<Item> ApplySpecs()
        {
            return base.ApplySpecs().And(new ItemLabelSpecification(_label));
        }
    }
}
