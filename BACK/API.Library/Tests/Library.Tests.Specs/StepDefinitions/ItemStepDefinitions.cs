using Xunit;

namespace Library.Tests.Specs.StepDefinitions
{
    public class ItemStepDefinitions : ValidatorStepDefinitions
    {
        public ItemStepDefinitions(ScenarioContext scenarioContext)
            : base(scenarioContext)
        {
        }

        [Given(@"the label ""([^""]*)""")]
        public void GivenTheLabel(string label)
        {
            _scenarioContext["label"] = label;
        }

        [Given(@"the release date ""([^""]*)""")]
        public void GivenTheReleaseDate(string releaseDate)
        {
            _scenarioContext["releaseDate"] = releaseDate;
        }

        [Given(@"the support ""([^""]*)""")]
        public void GivenTheSupport(string support)
        {
            _scenarioContext["support"] = support;
        }

        [Given(@"the imageUrl ""([^""]*)""")]
        public void GivenTheImageUrl(string imageURL)
        {
            _scenarioContext["imageURL"] = imageURL;
        }


    }
}
