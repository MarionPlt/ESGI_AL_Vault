using Library.Application.Context.Users.CreateUser;

namespace Library.Tests.Specs.StepDefinitions
{
    [Binding]
    [Scope(Feature = "User")]
    public class UserStepDefinitions : ValidatorStepDefinitions
    {
        private CreateUserCommandValidator _validator;

        public UserStepDefinitions(ScenarioContext scenarioContext, CreateUserCommandValidator validator)
            : base(scenarioContext)
        {
            _validator = validator;
        }

        [Given(@"the userName ""([^""]*)""")]
        public void GivenTheUserName(string userName)
        {
            _scenarioContext["userName"] = userName;
        }

        [When(@"validate CreateUserCommand")]
        public void WhenValidateCreateUserCommand()
        {
            var command = new CreateUserCommand(new(
                new Guid(),
                (string)_scenarioContext.GetValueOrDefault("userName") ?? string.Empty
            ));

            _scenarioContext["isValid"] = _validator.Validate(command).IsValid;
        }
    }
}
