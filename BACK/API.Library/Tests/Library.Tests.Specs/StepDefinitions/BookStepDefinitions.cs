using Library.Infrastructure;
using Library.Infrastructure.Entities.Items;

namespace Library.Tests.Specs.StepDefinitions;

[Binding]
public sealed class BookStepDefinitions
{
    private readonly ApplicationDbContext _context;

    public BookStepDefinitions(ApplicationDbContext context)
    {
        _context = context;
    }

    [Given("the books are")]
    public void GivenTheBooksAre(Table dataTable)
    {
        foreach (var row in dataTable.Rows)
        {
            _context.Books.Add(new Book(row[0], DateTime.ParseExact(row[1], "dd/MM/yyyy", null), row[2], row[3],
                row[4], row[5], int.Parse(row[6])));
        }
    }

    [When("add a book")]
    public void WhenAddBook(Table dataTable)
    {
        var book = new Book(dataTable.Rows[0][0], DateTime.ParseExact(dataTable.Rows[0][1], "dd/MM/yyyy", null),
            dataTable.Rows[0][2], dataTable.Rows[0][3], dataTable.Rows[0][4], dataTable.Rows[0][5],
            int.Parse(dataTable.Rows[0][6]));
        _context.Books.Add(book);
    }

    [Then("the books should be")]
    public void ThenTheResultOfTheBallotShouldBe(Table dataTable)
    {
        var booksFromResult = dataTable.Rows.Select(row => new Book(row[0],
                DateTime.ParseExact(row[1], "dd/MM/yyyy", null), row[2], row[3], row[4], row[5], int.Parse(row[6])))
            .ToList();
        _context.Books.Should().BeEquivalentTo(booksFromResult);
    }
}
