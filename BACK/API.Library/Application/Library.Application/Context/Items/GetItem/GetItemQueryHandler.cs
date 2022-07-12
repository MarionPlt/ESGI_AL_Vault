using Library.API.Models.Results;
using Library.API.Models.Results.Items;
using Library.Infrastructure;
using Library.Infrastructure.Entities.Enumerations;
using Library.Infrastructure.Entities.Items;
using Library.Infrastructure.Exceptions;
using MediatR;
using Microsoft.EntityFrameworkCore;

namespace Library.Application.Context.Items.GetItem;

public class GetItemQueryHandler : IRequestHandler<GetItemQuery, ItemResult>
{
    private readonly ApplicationDbContext _dbContext;

    public GetItemQueryHandler(ApplicationDbContext dbContext)
    {
        _dbContext = dbContext;
    }

    public async Task<ItemResult> Handle(GetItemQuery request, CancellationToken cancellationToken)
    {
        var item = await _dbContext.Items.SingleOrDefaultAsync(i => i.Id == request.ItemId, cancellationToken);

        if (item == null)
        {
            throw new EntityNotFoundException("Item of ID " + request.ItemId + " not found.");
        }

        return item.Type switch
        {
            ItemType.Book => new BookResult((Book)item),
            ItemType.Movie => new MovieResult((Movie)item),
            ItemType.VideoGame => new VideoGameResult((VideoGame)item),
            _ => new ItemResult(item)
        };
    }
}
