using Library.Infrastructure.Entities;
using Library.Infrastructure.Entities.Enumerations;
using Library.Infrastructure.Specifications;
using Library.Infrastructure.Specifications.Items;

namespace Library.Application.Context.Items.GetAllItems.Filters
{
    public class ItemTypeFilterDecorator : FilterDecorator
    {
        private readonly ItemType _itemType;

        public ItemTypeFilterDecorator(FilterComponent component, ItemType itemType) : base(component)
        {
            _itemType = itemType;
        }

        public override Specification<Item> ApplySpecs()
        {
            return base.ApplySpecs().And(new ItemTypeSpecification(_itemType));
        }
    }
}
