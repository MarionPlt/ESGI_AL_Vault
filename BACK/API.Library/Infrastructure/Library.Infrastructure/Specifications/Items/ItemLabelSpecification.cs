using System.Linq.Expressions;
using Library.Infrastructure.Entities;

namespace Library.Infrastructure.Specifications.Items
{
    public class ItemLabelSpecification : Specification<Item>
    {
        private readonly string _label;

        public ItemLabelSpecification(string label)
        {
            _label = label;
        }

        public override Expression<Func<Item, bool>> ToExpression()
        {
            return i => i.Label.ToLower().Contains(_label.ToLower());
        }
    }
}
