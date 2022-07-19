using Library.API.Controllers.Items;
using Library.Infrastructure.Entities.Items;

namespace Library.Tests.Specs.StepDefinitions;

[Binding]
public sealed class VideoGameStepDefinitions : BaseStepDefinitions
{
    [Given(@"the videogames are")]
    public void GivenTheVideogamesAre(Table dataTable)
    {
        foreach (var row in dataTable.Rows)
        {
            _context.VideoGames.Add(new VideoGame(row[0], DateTime.ParseExact(row[1], "dd/MM/yyyy", null), row[2], row[3], row[4]));
        }

        _context.SaveChanges();
    }

    [When(@"add a videogames")]
    public async void WhenAddAVideogamesAsync(Table dataTable)
    {
        foreach (var row in dataTable.Rows)
        {
            var videogameController = new VideoGameController(_mediator);

            await videogameController.CreateVideoGame(new()
            {
                Label = row[0],
                Type = "Book",
                ReleaseDate = DateTime.ParseExact(row[1], "dd/MM/yyyy", null),
                Support = row[2],
                ImageURL = row[3],
                Platform = row[4]
            });
        }
    }

    [Then(@"the videogames should be")]
    public void ThenTheVideogamesShouldBe(Table dataTable)
    {
        var videogamesFromResult = dataTable.Rows.Select(row => new VideoGame(row[0],
        DateTime.ParseExact(row[1], "dd/MM/yyyy", null), row[2], row[3], row[4]))
            .ToList();

        _context.VideoGames.Should().BeEquivalentTo(videogamesFromResult, x => x.Excluding(p => p.Id));
    }
}
