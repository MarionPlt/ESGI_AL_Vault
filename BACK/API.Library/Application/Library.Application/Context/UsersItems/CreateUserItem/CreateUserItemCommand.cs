using Library.API.Models.DTOs;
using Library.API.Models.Results;
using MediatR;

namespace Library.Application.Context.UsersItems.CreateUserItem
{
    public class CreateUserItemCommand : UserItemCommand, IRequest<UserItemResult>
    {
        public CreateUserItemCommand(Guid userId, Guid itemId, UserItemDTO userItemDto) : base(userItemDto)
        {
            ItemId = itemId;
            UserId = userId;
        }

        public Guid ItemId { get; }

        public Guid UserId { get; }
    }
}
