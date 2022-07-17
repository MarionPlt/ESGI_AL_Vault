using System.Linq.Expressions;
using Library.Infrastructure.Entities;
using Library.Infrastructure.Entities.Enumerations;

namespace Library.Infrastructure.Specifications.Items
{
    public class ItemTypeSpecification : Specification<Item>
    {
        private readonly ItemType _type;

        public ItemTypeSpecification(ItemType type)
        {
            _type = type;
        }

        public override Expression<Func<Item, bool>> ToExpression()
        {
            return i => i.Type == _type;
        }
    }
}
