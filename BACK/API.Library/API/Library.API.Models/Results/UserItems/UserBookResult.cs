using Library.API.Models.Results.Items;
using Library.Infrastructure.Entities;
using Library.Infrastructure.Entities.Items;

namespace Library.API.Models.Results.UserItems;

public class UserBookResult : UserItemResult
{
    public UserBookResult(UserItem userItem) : base(userItem)
    {
        Book = new BookResult((Book)userItem.Item);
    }

    public BookResult Book { get; set; }
}
