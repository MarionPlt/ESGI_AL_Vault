using Library.API.Models.Results.Items;
using Library.Infrastructure.Entities;
using Library.Infrastructure.Entities.Items;

namespace Library.API.Models.Results.UserItems;

public class UserMovieResult : UserItemResult
{
    public UserMovieResult(UserItem userItem) : base(userItem)
    {
        Item = new MovieResult((Movie)userItem.Item);
    }

    public MovieResult Item { get; set; }
}
