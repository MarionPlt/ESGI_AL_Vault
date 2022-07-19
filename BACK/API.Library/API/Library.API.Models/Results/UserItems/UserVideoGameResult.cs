using Library.API.Models.Results.Items;
using Library.Infrastructure.Entities;
using Library.Infrastructure.Entities.Items;

namespace Library.API.Models.Results.UserItems;

public class UserVideoGameResult : UserItemResult
{
    public UserVideoGameResult(UserItem userItem) : base(userItem)
    {
        Item = new VideoGameResult((VideoGame)userItem.Item);
    }

    public VideoGameResult Item { get; set; }
}
