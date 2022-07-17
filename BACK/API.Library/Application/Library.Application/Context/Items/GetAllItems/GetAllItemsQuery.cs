using Library.API.Models.DTOs;
using Library.API.Models.Results;
using Library.Infrastructure.Entities.Enumerations;
using MediatR;

namespace Library.Application.Context.Items.GetAllItems
{
    public class GetAllItemsQuery : IRequest<IEnumerable<ItemResult>>
    {
        public string? Label;

        public int PageIndex;
        public int PageSize;
        public DateTime? ReleaseDate;
        public ItemType? Type;

        public GetAllItemsQuery(PagingParameters? pagingParameters, ItemFiltersDTO? filters)
        {
            if (pagingParameters != null)
            {
                PageIndex = pagingParameters.PageIndex;
                PageSize = pagingParameters.PageSize;
            }

            if (filters != null)
            {
                if (filters.Type != null)
                {
                    if (Enum.TryParse<ItemType>(filters.Type, out var parsedType))
                    {
                        Type = parsedType;
                    }
                }

                ReleaseDate = filters.ReleaseDate;
                Label = filters.Label;
            }
        }
    }
}
