using System;
using Library.Application.Context.Items.VideoGames.CreateVideoGame;
using Xunit;

namespace Library.Tests.Items.VideoGames
{
    public class CreateVideoGameCommandValidatorTests
    {
        private CreateVideoGameCommandValidator validator;

        public CreateVideoGameCommandValidatorTests()
        {
            validator = new();
        }

        [Fact]
        public void Should_have_error_when_Platform_is_empty()
        {
            var command = new CreateVideoGameCommand(new()
            {
                Label = "Dune",
                Type = "Book",
                ReleaseDate = new DateTime(1965, 01, 01),
                Support = "physical",
                ImageURL = "http://localhost/image",
                Platform = ""
            });


            Assert.False(validator.Validate(command).IsValid);
        }        
    }
}
