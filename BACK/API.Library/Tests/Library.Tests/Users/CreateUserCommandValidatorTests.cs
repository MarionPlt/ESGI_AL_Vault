using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Library.Application.Context.Users.CreateUser;
using Xunit;

namespace Library.Tests.Users
{
    public class CreateUserCommandValidatorTests
    {
        private CreateUserCommandValidator validator;

        public CreateUserCommandValidatorTests()
        {
            validator = new();
        }

        [Fact]
        public void Should_have_error_when_userName_is_empty()
        {
            var command = new CreateUserCommand(new(new(), new("")));

            Assert.False(validator.Validate(command).IsValid);
        }
    }
}
