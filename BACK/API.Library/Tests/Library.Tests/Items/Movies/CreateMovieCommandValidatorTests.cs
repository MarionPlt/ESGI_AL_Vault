using System;
using Library.Application.Context.Items.Movies.CreateMovie;
using Xunit;

namespace Library.Tests.Items.Movies
{
    public class CreateMovieCommandValidatorTests
    {
        private CreateMovieCommandValidator validator;

        public CreateMovieCommandValidatorTests()
        {
            validator = new();
        }

        [Fact]
        public void Should_have_error_when_Director_is_empty()
        {
            var command = new CreateMovieCommand(new()
            {
                Label = "Dune",
                Type = "Movie",
                ReleaseDate = new DateTime(1965, 01, 01),
                Support = "physical",
                ImageURL = "http://localhost/image",
                Director = "",
                Editor = "editor"
            });

            Assert.False(validator.Validate(command).IsValid);
        }

        [Fact]
        public void Should_have_error_when_Editor_is_empty()
        {
            var command = new CreateMovieCommand(new()
            {
                Label = "Dune",
                Type = "Movie",
                ReleaseDate = new DateTime(1965, 01, 01),
                Support = "physical",
                ImageURL = "http://localhost/image",
                Director = "David Lynch",
                Editor = ""
            });

            Assert.False(validator.Validate(command).IsValid);
        }
    }
}
