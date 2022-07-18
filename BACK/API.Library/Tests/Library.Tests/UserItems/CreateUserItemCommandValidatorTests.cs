using System;
using Library.Application.Context.UsersItems.CreateUserItem;
using Xunit;

namespace Library.Tests.UserItems
{
    public class CreateUserItemCommandValidatorTests
    {
        private CreateUserItemCommandValidator validator;

        public CreateUserItemCommandValidatorTests()
        {
            validator = new();
        }

        [Fact]
        public void Should_have_error_when_userId_is_empty()
        {
            var command = new CreateUserItemCommand(Guid.Empty, new(), new()
            {
                AcquisitionDate = new DateTime(2022, 3, 16),
                State = "BattleScarred"
            });

            Assert.False(validator.Validate(command).IsValid);
        }

        [Fact]
        public void Should_have_error_when_itemId_is_empty()
        {
            var command = new CreateUserItemCommand(new(), Guid.Empty, new()
            {
                AcquisitionDate = new DateTime(2022, 3, 16),
                State = "BattleScarred"
            });

            Assert.False(validator.Validate(command).IsValid);
        }
    }
}
