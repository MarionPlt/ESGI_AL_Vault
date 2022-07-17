using System.Linq.Expressions;

namespace Library.Infrastructure.Specifications
{
    public abstract class Specification<T>
    {
        public static readonly Specification<T> All = new IdentitySpecification<T>();

        public static Specification<T> operator &(Specification<T> lhs, Specification<T> rhs)
        {
            return (lhs ?? throw new ArgumentNullException(nameof(lhs))).And(rhs);
        }

        public static Specification<T> operator |(Specification<T> lhs, Specification<T> rhs)
        {
            return (lhs ?? throw new ArgumentNullException(nameof(lhs))).Or(rhs);
        }

        public static Specification<T> operator !(Specification<T> spec)
        {
            return (spec ?? throw new ArgumentNullException(nameof(spec))).Not();
        }

        public Specification<T> BitwiseAnd(Specification<T> lhs, Specification<T> rhs)
        {
            return (lhs ?? throw new ArgumentNullException(nameof(lhs))).And(rhs);
        }

        public Specification<T> BitwiseOr(Specification<T> lhs, Specification<T> rhs)
        {
            return (lhs ?? throw new ArgumentNullException(nameof(lhs))).Or(rhs);
        }

        public Specification<T> LogicalNot(Specification<T> spec)
        {
            return (spec ?? throw new ArgumentNullException(nameof(spec))).Not();
        }

        public bool IsSatisfiedBy(T entity)
        {
            var predicate = ToExpression().Compile();

            return predicate(entity);
        }

        public abstract Expression<Func<T, bool>> ToExpression();

        public Specification<T> And(Specification<T> specification)
        {
            if (this == All)
            {
                return specification;
            }

            if (specification == All)
            {
                return this;
            }

            return new AndSpecification<T>(this, specification);
        }

        public Specification<T> Or(Specification<T> specification)
        {
            if (this == All || specification == All)
            {
                return All;
            }

            return new OrSpecification<T>(this, specification);
        }

        public Specification<T> Not()
        {
            return new NotSpecification<T>(this);
        }
    }
}
