using Library.API.Controllers.Items;
using Library.Infrastructure.Entities.Items;

namespace Library.Tests.Specs.StepDefinitions;

[Binding]
public sealed class BookStepDefinitions : BaseStepDefinitions
{
    [Given(@"the books are")]
    public void GivenTheBooksAre(Table dataTable)
    {
        foreach (var row in dataTable.Rows)
        {
            _context.Books.Add(new Book(row[0], DateTime.ParseExact(row[1], "dd/MM/yyyy", null), row[2], row[3],
                row[4], row[5], int.Parse(row[6])));
        }

        _context.SaveChanges();
    }

    [When(@"add book")]
    public async void WhenAddBookAsync(Table dataTable)
    {
        foreach (var row in dataTable.Rows)
        {
            var bookController = new BookController(_mediator);

            await bookController.CreateBook(new()
            {
                Label = row[0],
                Type = "Book",
                ReleaseDate = DateTime.ParseExact(row[1], "dd/MM/yyyy", null),
                Support = row[2],
                ImageURL = row[3],
                Authors = row[5],
                Editor = row[4],
                Volume = int.Parse(row[6])
            });
        }        
    }

    [When(@"remove book")]
    public void WhenRemoveBook(Table dataTable)
    {
        foreach (var row in dataTable.Rows)
        {
            var book = _context.Books.FirstOrDefault(x => x.Label == row[0]);
            _context.Books.Remove(book);
            
        }
        _context.SaveChanges();
    }

    [Then(@"the books should be")]
    public void ThenTheResultOfTheBallotShouldBe(Table dataTable)
    {
        var booksFromResult = dataTable.Rows.Select(row => new Book(row[0],
                DateTime.ParseExact(row[1], "dd/MM/yyyy", null), row[2], row[3], row[4], row[5], int.Parse(row[6])))
            .ToList();

        _context.Books.Should().BeEquivalentTo(booksFromResult, x => x.Excluding(p => p.Id));
    }
}
