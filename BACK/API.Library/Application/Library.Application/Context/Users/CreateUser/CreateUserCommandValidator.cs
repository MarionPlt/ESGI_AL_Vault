using FluentValidation;

namespace Library.Application.Context.Users.CreateUser;

public class CreateUserCommandValidator : AbstractValidator<CreateUserCommand>
{
    public CreateUserCommandValidator()
    {
        RuleFor(c => c.UserName.Trim()).NotEmpty();
    }
}
