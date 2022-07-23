using System;
using Library.Application.Context.UsersItems.UpdateUserItem;
using Xunit;

namespace Library.Tests.UserItems
{
    public class UpdateUserItemCommandValidatorTests
    {
        private UpdateUserItemCommandValidator validator;

        public UpdateUserItemCommandValidatorTests()
        {
            validator = new();
        }

        [Fact]
        public void Should_have_error_when_userItemId_is_empty()
        {
            var command = new UpdateUserItemCommand(Guid.Empty, new()
            {
                AcquisitionDate = new DateTime(2022, 3, 16),
                State = "BattleScarred"
            });

            Assert.False(validator.Validate(command).IsValid);
        }
    }
}
