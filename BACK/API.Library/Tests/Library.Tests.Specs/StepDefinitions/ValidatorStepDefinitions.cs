using Xunit;

namespace Library.Tests.Specs.StepDefinitions
{
    public class ValidatorStepDefinitions
    {
        protected readonly ScenarioContext _scenarioContext;

        public ValidatorStepDefinitions(ScenarioContext scenarioContext)
        {
            _scenarioContext = scenarioContext;
        }

        [Then(@"validation is successful")]
        public void ThenThereShouldNoError()
        {
            Assert.Equal(bool.Parse(_scenarioContext["isValid"].ToString()), true);
        }

        [Then(@"validation failed")]
        public void ThenThereShouldBeAnError()
        {
            Assert.Equal(bool.Parse(_scenarioContext["isValid"].ToString()), false);
        }
    }
}
