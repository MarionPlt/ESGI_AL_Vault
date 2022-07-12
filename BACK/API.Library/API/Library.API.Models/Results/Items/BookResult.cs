using Library.Infrastructure.Entities.Items;

namespace Library.API.Models.Results.Items;

public class BookResult : ItemResult
{
    public BookResult(Book book) : base(book)
    {
        Editor = book.Editor;
        Authors = book.Authors;
        Volume = book.Volume;
    }

    public string Editor { get; set; }

    public string Authors { get; set; }

    public int? Volume { get; set; }
}
