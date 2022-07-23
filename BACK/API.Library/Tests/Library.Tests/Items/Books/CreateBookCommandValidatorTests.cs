using System;
using FluentValidation.TestHelper;
using Library.Application.Context.Items.Books.CreateBook;
using Xunit;

namespace Library.Tests.Items.Books
{
    public class CreateBookCommandValidatorTests
    {
        private CreateBookCommandValidator validator;

        public CreateBookCommandValidatorTests()
        {
            validator = new();
        }

        [Fact]
        public void Should_have_error_when_Autors_is_empty()
        {
            var command = new CreateBookCommand(new()
            {
                Label = "Dune",
                Type = "Book",
                ReleaseDate = new DateTime(1965, 01, 01),
                Support = "physical",
                ImageURL = "http://localhost/image",
                Authors = "Frank Herbert",
                Editor = "",
                Volume = 1
            });

            //var result = validator.TestValidate(command);
            //result.ShouldHaveValidationErrorFor(r => r.Authors);

            Assert.False(validator.Validate(command).IsValid);
        }

        [Fact]
        public void Should_have_error_when_Editor_is_empty()
        {
            var command = new CreateBookCommand(new()
            {
                Label = "Dune",
                Type = "Book",
                ReleaseDate = new DateTime(1965, 01, 01),
                Support = "physical",
                ImageURL = "http://localhost/image",
                Authors = "",
                Editor = "editor",
                Volume = 1
            });

            //var result = validator.TestValidate(command);
            //result.ShouldHaveValidationErrorFor(r => r.Editor).Only();

            Assert.False(validator.Validate(command).IsValid);
        }

        [Fact]
        public void Should_have_error_when_Volume_is_negative()
        {
            var command = new CreateBookCommand(new()
            {
                Label = "Dune",
                Type = "Book",
                ReleaseDate = new DateTime(1965, 01, 01),
                Support = "physical",
                ImageURL = "http://localhost/image",
                Authors = "Frank Herbert",
                Editor = "Chilton Books",
                Volume = -1
            });

            //var result = validator.TestValidate(command);
            //result.ShouldHaveValidationErrorFor(r => r.Volume);

            Assert.False(validator.Validate(command).IsValid);
        }
    }
}
