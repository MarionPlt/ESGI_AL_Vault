using Library.API.Controllers.Items;
using Library.Infrastructure.Entities.Items;

namespace Library.Tests.Specs.StepDefinitions;

[Binding]
public sealed class MovieStepDefinitions : BaseStepDefinitions    
{
    [Given(@"the movies are")]
    public void GivenTheMoviesAre(Table dataTable)
    {
        foreach (var row in dataTable.Rows)
        {
            _context.Movies.Add(new Movie(row[0], DateTime.ParseExact(row[1], "dd/MM/yyyy", null), row[2], row[3],
                row[4], row[5]));
        }

        _context.SaveChanges();
    }

    [When(@"add a movie")]
    public async void WhenAddAMovieAsync(Table dataTable)
    {
        foreach (var row in dataTable.Rows)
        {
            var movieController = new MovieController(_mediator);

            await movieController.CreateMovie(new()
            {
                Label = row[0],
                Type = "Book",
                ReleaseDate = DateTime.ParseExact(row[1], "dd/MM/yyyy", null),
                Support = row[2],
                ImageURL = row[3],
                Director = row[4],
                Editor = row[5]
            });
        }
    }

    [Then(@"the movies should be")]
    public void ThenTheMoviessShouldBe(Table dataTable)
    {
        var moviesFromResult = dataTable.Rows.Select(row => new Movie(row[0],
            DateTime.ParseExact(row[1], "dd/MM/yyyy", null), row[2], row[3], row[4], row[5]))
        .ToList();

        _context.Movies.Should().BeEquivalentTo(moviesFromResult, x => x.Excluding(p => p.Id));
    }
}
