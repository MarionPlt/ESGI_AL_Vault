using System.Globalization;
using Library.Application.Context.Items.Books.CreateBook;

namespace Library.Tests.Specs.StepDefinitions
{
    [Binding]
    [Scope(Feature = "Book")]
    public sealed class BookStepDefinitions : ItemStepDefinitions
    {
        private readonly CreateBookCommandValidator _validator;

        public BookStepDefinitions(ScenarioContext scenarioContext, CreateBookCommandValidator validator)
            : base(scenarioContext)
        {
            _validator = validator;            
        }

        [Given(@"the editor ""([^""]*)""")]
        public void GivenTheEditor(string editor)
        {
            _scenarioContext["editor"] = editor;
        }

        [Given(@"the author ""([^""]*)""")]
        public void GivenTheAuthor(string author)
        {
            _scenarioContext["author"] = author;
        }

        [Given(@"the volume (.*)")]
        public void GivenTheVolume(int volume)
        {
            _scenarioContext["volume"] = volume;
        }

        [When(@"validate CreateBookCommand")]
        public void WhenValidateCreateBookCommand()
        {
            var command = new CreateBookCommand(new()
            {
                Label = _scenarioContext["label"].ToString() ?? string.Empty,
                ReleaseDate = DateTime.ParseExact(_scenarioContext["releaseDate"].ToString(), "d", CultureInfo.CreateSpecificCulture("fr-FR")),
                Type = "Book",
                Support = _scenarioContext["support"].ToString(),
                ImageURL = _scenarioContext["imageURL"].ToString(),
                Editor = (string)_scenarioContext.GetValueOrDefault("editor") ?? string.Empty,
                Authors = (string)_scenarioContext.GetValueOrDefault("author") ?? string.Empty,
                Volume = int.Parse(_scenarioContext["volume"].ToString() ?? "0"),
            });            

            _scenarioContext["isValid"] = _validator.Validate(command).IsValid;
        }
    }
}
