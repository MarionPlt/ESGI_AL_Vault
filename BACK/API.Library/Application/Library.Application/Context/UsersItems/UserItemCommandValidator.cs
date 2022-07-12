using FluentValidation;

namespace Library.Application.Context.UsersItems;

public class UserItemCommandValidator : AbstractValidator<UserItemCommand>
{
    public UserItemCommandValidator()
    {
        RuleFor(ui => ui.AcquisitionDate).NotEmpty();
        RuleFor(ui => ui.State).NotNull();
    }
}
