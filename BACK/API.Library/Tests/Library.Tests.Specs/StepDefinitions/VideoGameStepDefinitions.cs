using System.Globalization;
using Library.Application.Context.Items.VideoGames.CreateVideoGame;

namespace Library.Tests.Specs.StepDefinitions
{
    [Binding]
    [Scope(Feature = "VideoGame")]
    public class VideoGameStepDefinitions : ItemStepDefinitions
    {
        private readonly CreateVideoGameCommandValidator _validator;

        public VideoGameStepDefinitions(ScenarioContext scenarioContext, CreateVideoGameCommandValidator validator)
            : base(scenarioContext)
        {
            _validator = validator;    
        }

        [Given(@"the platform ""([^""]*)""")]
        public void GivenThePlatform(string platform)
        {
            _scenarioContext["platform"] = platform;
        }

        [When(@"validate CreateVideoGameCommand")]
        public void WhenValidateCreateVideoGameCommand()
        {
            var command = new CreateVideoGameCommand(new()
            {
                Label = _scenarioContext["label"].ToString() ?? string.Empty,
                ReleaseDate = DateTime.ParseExact(_scenarioContext["releaseDate"].ToString(), "d", CultureInfo.CreateSpecificCulture("fr-FR")),
                Type = "Book",
                Support = _scenarioContext["support"].ToString(),
                ImageURL = _scenarioContext["imageURL"].ToString(),
                Platform = (string)_scenarioContext.GetValueOrDefault("platform") ?? string.Empty,
            });

            _scenarioContext["isValid"] = _validator.Validate(command).IsValid;
        }
    }
}
