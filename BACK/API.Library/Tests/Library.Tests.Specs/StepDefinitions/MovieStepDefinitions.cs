using System.Globalization;
using Library.Application.Context.Items.Movies.CreateMovie;

namespace Library.Tests.Specs.StepDefinitions
{
    [Binding]
    [Scope(Feature = "Movie")]
    public  class MovieStepDefinitions : ItemStepDefinitions
    {
        private readonly CreateMovieCommandValidator _validator;

        public MovieStepDefinitions(ScenarioContext scenarioContext, CreateMovieCommandValidator validator)
            : base(scenarioContext)
        {
            _validator = validator;
        }

        [Given(@"the director ""([^""]*)""")]
        public void GivenTheDirector(string director)
        {
            _scenarioContext["director"] = director;
        }

        [Given(@"the editor ""([^""]*)""")]
        public void GivenTheEditor(string editor)
        {
            _scenarioContext["editor"] = editor;
        }

        [When(@"validate CreateMovieCommand")]
        public void WhenValidateCreateMovieCommand()
        {
            var command = new CreateMovieCommand(new()
            {
                Label = _scenarioContext["label"].ToString() ?? string.Empty,
                ReleaseDate = DateTime.ParseExact(_scenarioContext["releaseDate"].ToString(), "d", CultureInfo.CreateSpecificCulture("fr-FR")),
                Type = "Book",
                Support = _scenarioContext["support"].ToString(),
                ImageURL = _scenarioContext["imageURL"].ToString(),
                Director = (string)_scenarioContext.GetValueOrDefault("director") ?? string.Empty,
                Editor = (string)_scenarioContext.GetValueOrDefault("editor") ?? string.Empty,
            });

            _scenarioContext["isValid"] = _validator.Validate(command).IsValid;
        }
    }
}
