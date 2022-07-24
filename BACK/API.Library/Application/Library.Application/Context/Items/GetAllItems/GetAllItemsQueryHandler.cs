using Library.API.Models.Results;
using Library.Application.Context.Items.GetAllItems.Filters;
using Library.Infrastructure;
using MediatR;
using Microsoft.EntityFrameworkCore;

namespace Library.Application.Context.Items.GetAllItems
{
    public class GetAllItemsQueryHandler : IRequestHandler<GetAllItemsQuery, IEnumerable<ItemResult>>
    {
        private readonly ApplicationDbContext _dbContext;

        public GetAllItemsQueryHandler(ApplicationDbContext dbContext)
        {
            _dbContext = dbContext;
        }

        public async Task<IEnumerable<ItemResult>> Handle(GetAllItemsQuery request, CancellationToken cancellationToken)
        {
            FilterComponent filter = new BaseFilterComponent();
            var filterDecorator = new FilterDecorator(filter);

            if (request.Type.HasValue)
            {
                filterDecorator = new ItemTypeFilterDecorator(filterDecorator, request.Type.Value);
            }

            if (!string.IsNullOrWhiteSpace(request.Label))
            {
                filterDecorator = new ItemLabelFilterDecorator(filterDecorator, request.Label);
            }

            var items = await _dbContext.Items.Where(filterDecorator.ApplySpecs().ToExpression())
                .ToListAsync(cancellationToken);

            return items.Select(i => new ItemResult(i));
        }
    }
}
