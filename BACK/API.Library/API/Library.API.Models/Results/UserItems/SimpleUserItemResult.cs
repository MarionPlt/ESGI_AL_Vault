using Library.Infrastructure.Entities;

namespace Library.API.Models.Results.UserItems;

public class SimpleUserItemResult : UserItemResult
{
    public SimpleUserItemResult(UserItem userItem) : base(userItem)
    {
        Item = new ItemResult(userItem.Item);
    }

    public ItemResult Item { get; set; }
}
